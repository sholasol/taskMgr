<?php

namespace App\Http\Controllers;

use App\Models\Task;
use App\Models\Project;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TaskController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $userId = Auth::id();
        $projectId = $request->query('project_id');

        $projects = Project::where('user_id', $userId)->get();

        // If no project_id is provided, default to the first project
        if (!$projectId && $projects->isNotEmpty()) {
            $projectId = $projects->first()->id;
        }

        $query = Task::whereHas('project', function ($q) use ($userId) {
            $q->where('user_id', $userId);
        })->orderBy('priority');

        if ($projectId) {
            $query->where('project_id', $projectId);
        } else {
            // If no projects exist, $tasks will be empty
            $tasks = collect();
            return view('task.index', compact('tasks', 'projects', 'projectId'));
        }

        $tasks = $query->get();

        return view('task.index', compact('tasks', 'projects', 'projectId'));
    }






    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'project_id' => 'required|exists:projects,id',
            'comment'  => 'nullable|string',
            'priority'  => 'required|numeric',
        ]);

        // Verify user owns the project
        $project = Project::findOrFail($request->project_id);
        if ($project->user_id !== Auth::id()) {
            abort(403);
        }

        // Get the highest priority and add 1 for the new task
        // $maxPriority = Task::where('project_id', $request->project_id)->max('priority') ?? 0;

        Task::create([
            'name' => $request->name,
            'priority' => $request->priority,
            'project_id' => $request->project_id,
            'comment'    => $request->comment,
        ]);

        sweetalert()->success('Task created Successfully');
        return redirect()->route('task', ['project_id' => $request->project_id]);
    }



    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Task $task)
    {
        //check project owner
        if ($task->project->user_id !== Auth::id()) {
            abort(403);
        }

        $project = Project::where('id', $task->project_id)->first();
        return view('task.edit', compact('task', 'project'));
    }

    /**
     * Update task order via drag-and-drop
     */
    public function updateOrder(Request $request)
    {
        $taskIds = $request->input('tasks', []);

        if (empty($taskIds)) {
            return response()->json(['success' => false, 'message' => 'No tasks provided'], 400);
        }

        // Fetch tasks and validate
        $tasks = Task::whereIn('id', $taskIds)->get();
        if ($tasks->count() !== count($taskIds)) {
            return response()->json(['success' => false, 'message' => 'One or more task IDs are invalid'], 400);
        }

        // Verify project consistency and authorization
        $projectId = $tasks->first()->project_id;
        $userId = Auth::id();

        foreach ($tasks as $task) {
            $taskProjectId = (int) $task->project_id;

            if (!$task->project || $task->project->user_id !== $userId) {
                return response()->json(['success' => false, 'message' => 'Unauthorized access to project'], 403);
            }
            if ($task->project_id !== $projectId) {
                return response()->json(['success' => false, 'message' => 'Tasks must belong to the same project'], 400);
            }
        }

        // Update priorities based on new order
        foreach ($taskIds as $order => $id) {
            Task::where('id', $id)->update(['priority' => $order + 1]);
        }

        return response()->json(['success' => true, 'message' => 'Tasks reordered successfully']);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Task $task)
    {
        // Verify user owns the project this task belongs to
        if ($task->project->user_id !== Auth::id()) {
            abort(403);
        }

        $request->validate([
            'name' => 'required|string|max:255',
            'project_id' => 'required|exists:projects,id',
            'comment' => 'nullable|string'
        ]);

        // Verify user owns the destination project as well
        $project = Project::findOrFail($request->project_id);
        if ($project->user_id !== Auth::id()) {
            abort(403);
        }

        $task->update([
            'name' => $request->name,
            'project_id' => $request->project_id,
            'comment' => $request->comment,
        ]);

        sweetalert()->success('Task updated Successfully');

        return redirect()->route('task', ['project_id' => $request->project_id]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Task $task)
    {
        // Verify user owns the project this task belongs to
        if ($task->project->user_id !== Auth::id()) {
            abort(403);
        }

        $projectId = $task->project_id;
        $task->delete();

        // Reorder remaining tasks
        $tasks = Task::where('project_id', $projectId)->orderBy('priority')->get();
        foreach ($tasks as $index => $t) {
            $t->priority = $index + 1;
            $t->save();
        }

        sweetalert()->success('Task deleted Successfully');

        return redirect()->route('task', ['project_id' => $projectId]);
    }
}
