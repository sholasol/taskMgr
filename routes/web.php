<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\TaskController;

Route::get('/', function () {
    return view('welcome');
});

// Route::get('/login', [AuthController::class, 'create'])->name('login.create');s
Route::post('/login', [AuthController::class, 'store'])->name('login');





Route::middleware('auth')->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard.index');

    Route::get('/task', [TaskController::class, 'index'])->name('task');
    Route::post('/task', [TaskController::class, 'store'])->name('task.store');
    Route::get('/edit/{task}', [TaskController::class, 'edit'])->name('task.edit');
    Route::post('/update/{task}', [TaskController::class, 'update'])->name('task.update');
    Route::delete('/destroy/{task}', [TaskController::class, 'destroy'])->name('task.destroy');
    Route::post('/reorder', [TaskController::class, 'reorder'])->name('task.reorder');



    Route::get('/project', [ProjectController::class, 'create'])->name('project.create');

    Route::post('/create', [ProjectController::class, 'store'])->name('project.store');



    Route::post('/logout', [AuthController::class, 'destroy'])->name('logout');
});




