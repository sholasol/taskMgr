<?php

use App\Http\Controllers\ProjectController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/projects', [ProjectController::class, 'index'])->name('projects.index');

Route::get('/create', [ProjectController::class, 'create'])
->name('projects.create');

Route::post('/create', [ProjectController::class, 'store'])
->name('projects.store');




