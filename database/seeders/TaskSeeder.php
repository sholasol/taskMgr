<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Project;
use App\Models\Task;
use Illuminate\Database\Seeder;



class TaskSeeder extends Seeder
{
    public function run()
    {
        //All present projects
        $projects = Project::all();

        // Create tasks for each project
        foreach ($projects as $project) {
            $priority = 1; // reset project priority for each project
            $taskCount = rand(3, 5); // Random number of tasks for each project
            
            for ($i = 0; $i < $taskCount; $i++) {
                Task::create([
                    'name' => fake()->sentence(4),
                    'priority' => $priority++,
                    'project_id' => $project->id,
                    'comment' => fake()->sentence(10),
                ]);
            }
        }
    }
}