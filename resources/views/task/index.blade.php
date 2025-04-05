@include('layouts.head')
<meta name="csrf-token" content="{{ csrf_token() }}">

<div class="container mt-5">
    <div class="row mb-4">
        <div class="col">
            <h1>Task Manager</h1>
            <p>Welcome, {{ Auth::user()->name }}</p>
        </div>
        <div class="col-auto">
            <a href="{{ route('dashboard.index') }}" class="btn btn-outline-primary">Manage Projects</a>
        </div>
    </div>

    <div class="row mb-4">
        <div class="col">
            <form action="{{ route('task') }}" method="GET" class="d-flex">
                <select name="project_id" class="form-select me-2">
                    <option value="">All Projects</option>
                    @foreach($projects as $project)
                        <option value="{{ $project->id }}" {{ $projectId == $project->id ? 'selected' : '' }}>
                            {{ $project->name }}
                        </option>
                    @endforeach
                </select>
                <button type="submit" class="btn btn-outline-secondary">Filter</button>
            </form>
        </div>
    </div>

    <div class="row mb-4">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">Add New Task</div>
                <div class="card-body">
                    @if($projects->count() > 0)
                        <form action="{{ route('task.store') }}" method="POST">
                            @csrf
                            <div class="mb-3">
                                <label for="name" class="form-label">Task Name</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                                @error('name')
                                    <p class="text-danger">{{ $message }}</p>
                                @enderror
                            </div>
                            <div class="mb-3">
                                <label for="project_id" class="form-label">Project</label>
                                <select name="project_id" id="project_id" class="form-select" required>
                                    @foreach($projects as $project)
                                        <option value="{{ $project->id }}" {{ $projectId == $project->id ? 'selected' : '' }}>
                                            {{ $project->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="project_id" class="form-label">Priority</label>
                                <select name="priority" id="priority" class="form-select" required>
                                        <option value="3">High</option>
                                        <option value="2">Medium</option>
                                        <option value="1">Low</option>
                                </select>
                                @error('priority')
                                    <p class="text-danger">{{ $message }}</p>
                                @enderror
                            </div>
                            <div class="mb-3">
                                <label for="comment" class="form-label">Comment</label>
                                <textarea class="form-control" id="comment" name="comment"></textarea>
                                @error('comment')
                                    <p class="text-danger">{{ $message }}</p>
                                @enderror
                            </div>
                            <button type="submit" class="btn btn-primary">Add Task</button>
                        </form>
                    @else
                        <div class="alert alert-info mb-0">
                            You need to create a project first before adding tasks.
                            <a href="{{ route('dashboard.index') }}" class="alert-link">Create a project</a>
                        </div>
                    @endif
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <h2>Tasks</h2>
            @if($tasks->count() > 0)
                <div id="task-list" class="list-group">
                    @foreach($tasks as $task)
                        <div class="task-item list-group-item d-flex justify-content-between align-items-center" data-id="{{ $task->id }}">
                            <div>
                                <span class="fw-bold priority-label">#{{ $task->priority }}: {{ $task->name }}</span>
                                <span class="badge bg-info ms-2">{{ $task->project->name }}</span>
                            </div>
                            <div>
                                <a href="{{ route('task.edit', $task) }}" class="btn btn-sm btn-outline-primary">Edit</a>
                                <form action="{{ route('task.destroy', $task) }}" method="POST" class="d-inline">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-sm btn-outline-danger" onclick="return confirm('Are you sure?')">Delete</button>
                                </form>
                            </div>
                        </div>
                    @endforeach
                </div>
            @else
                <div class="alert alert-info">
                    No tasks found for this project. Create your first task to get started!
                </div>
            @endif
        </div>
    </div>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
<script>
    $(function() {
        $("#task-list").sortable({
            update: function(event, ui) {
                const taskIds = $(this).sortable('toArray', { attribute: 'data-id' });
                console.log('Task IDs being sent:', taskIds); // Debug the IDs

                if (taskIds.length === 0) {
                    alert('No tasks to reorder');
                    return;
                }

                $.ajax({
                    url: '{{ route("task.reorder") }}', // Should resolve to /reorder
                    method: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
                        'Accept': 'application/json' // Ensure JSON response
                    },
                    data: { tasks: taskIds },
                    success: function(response) {
                        console.log('Success Response:', response);
                        if (response.success) {
                            $("#task-list .task-item").each(function(index) {
                                $(this).find('.priority-label').text(`#${index + 1}: ${$(this).find('.priority-label').text().split(': ')[1]}`);
                            });
                        }
                    },
                    error: function(xhr, status, error) {
                        console.log('Error Response:', xhr.responseJSON);
                        console.log('Status:', status);
                        console.log('Error:', error);
                        alert('Error reordering tasks: ' + (xhr.responseJSON?.message || 'Unknown error'));
                    }
                });
            }
        }).disableSelection();
    });
</script>
</body>
</html>