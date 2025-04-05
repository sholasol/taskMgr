<?php

namespace Database\Factories;


use App\Models\Project;
use Illuminate\Database\Eloquent\Factories\Factory;

class TaskFactory extends Factory
{
    public function definition()
    {
        static $priority = 1;
        
        return [
            'name' => $this->faker->sentence(4),
            'priority' => $priority++,
            'project_id' => Project::factory(),
            'comment' => $this->faker->text(200),
        ];
    }
}