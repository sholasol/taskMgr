@include('layouts.head')






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
                    <div class="card-header">
                        Add New Task
                    </div>
                    <div class="card-body">
                        @if($projects->count() > 0)
                            <form action="{{ route('task.store') }}" method="POST">
                                @csrf
                                <div class="mb-3">
                                    <label for="name" class="form-label">Task Name</label>
                                    <input type="text" class="form-control" id="name" name="name" required>
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
                                    <label for="comment" class="form-label">Comment</label>
                                    <textarea class="form-control" id="comment" name="comment" ></textarea>
                                    @error('comment')
                                        <p class="text-danger">{{ $messgae }}</p>
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
                    <div id="task-list">
                        @foreach($tasks as $task)
                            <div class="task-item d-flex justify-content-between align-items-center" data-id="{{ $task->id }}">
                                <div>
                                    <span class="fw-bold">#{{ $task->priority }}: {{ $task->name }}</span>
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
                        No tasks found. Create your first task to get started!
                    </div>
                @endif
            </div>
        </div>

        
    </div>




    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous">
    </script>

<script>
    $(function() {
        $("#task-list").sortable({
            update: function(event, ui) {
                const taskIds = $(this).sortable('toArray', {attribute: 'data-id'});
                
                $.ajax({
                    url: '{{ route("task.reorder") }}',
                    method: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    data: {
                        tasks: taskIds
                    },
                    success: function(response) {
                        if (response.success) {
                            location.reload();
                        }
                    }
                });
            }
        });
    });
</script>
</body>

</html>
