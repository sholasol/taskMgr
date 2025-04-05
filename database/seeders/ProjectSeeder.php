<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Project;
use Illuminate\Database\Seeder;


class ProjectSeeder extends Seeder
{
    public function run()
    {
        $users = User::all(); //get all users

        // Create projects for each user
        foreach ($users as $user) {
            Project::factory()
                ->count(rand(1, 3))
                ->for($user)
                ->create();
        }
    }
}