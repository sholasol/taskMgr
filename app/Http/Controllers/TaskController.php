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
        $projectId = $request->query('project_id');
        
        // Get only projects owned by the current user
        $projects = Project::where('user_id', Auth::id())->get();
        
        // Set up the task query
        $query = Task::query()
            ->orderBy('priority')
            ->whereHas('project', function($q) {
                $q->where('user_id', Auth::id());
            });
        
        // Filter by project if requested
        if ($projectId) {
            $query->where('project_id', $projectId);
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
        ]);

        // Verify user owns the project
        $project = Project::findOrFail($request->project_id);
        if ($project->user_id !== Auth::id()) {
            abort(403);
        }

        // Get the highest priority and add 1 for the new task
        $maxPriority = Task::where('project_id', $request->project_id)->max('priority') ?? 0;
        
        Task::create([
            'name' => $request->name,
            'priority' => $maxPriority + 1,
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

    public function updateOrder(Request $request)
    {
        $tasks = $request->input('tasks', []);
        $projectId = null;
        
        foreach ($tasks as $order => $id) {
            $task = Task::findOrFail($id);
            
            // Verify user owns the project this task belongs to
            if ($task->project->user_id !== Auth::id()) {
                abort(403);
            }
            
            $task->priority = $order + 1;
            $task->save();
            
            if ($projectId === null) {
                $projectId = $task->project_id;
            }
        }
        
        sweetalert()->success('Task reordered Successfully');
        return response()->json(['success' => true]);
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
