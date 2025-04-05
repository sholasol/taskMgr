@include('layouts.head')

<div class="container mt-5">
    <div class="row mb-4">
        <div class="col">
            <h1>Manage Projects</h1>
            <p>Welcome, {{ Auth::user()->name }}</p>
        </div>
    </div>

    <div class="row mb-4">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    Add New Project
                </div>
                <div class="card-body">
                    <form action="{{ route('project.store') }}" method="POST">
                        @csrf
                        <div class="mb-3">
                            <label for="name" class="form-label">Project Name</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                            @error('name')
                                <p class="text-danger">{{$messgae}}</p>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="start" class="form-label">Start Date</label>
                            <input type="date" class="form-control" id="start_date" name="start_date" required>
                            @error('start_date')
                                <p class="text-danger">{{ $messgae }}</p>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="start" class="form-label">End Date</label>
                            <input type="date" class="form-control" id="end_date" name="end_date" required>
                            @error('end_date')
                                <p class="text-danger">{{ $messgae }}</p>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label">Description</label>
                            <textarea class="form-control" id="description" name="description" ></textarea>
                            @error('description')
                                <p class="text-danger">{{ $messgae }}</p>
                            @enderror
                        </div>
                        <button type="submit" class="btn btn-primary">Create Project</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <h2>Projects</h2>
            @if($projects->count() > 0)
                <div class="list-group">
                    @foreach($projects as $project)
                        <div class="list-group-item d-flex justify-content-between align-items-center">
                            <div>
                                {{ $project->name }}
                                <small class="text-muted ms-2">{{ $project->tasks->count() }} tasks</small>
                            </div>
                            <div>
                                <a href="{{ route('task', ['project_id' => $project->id]) }}" class="btn btn-sm btn-outline-primary">View Tasks</a>
                            </div>
                        </div>
                    @endforeach

                   
                </div>
            @else
                <div class="alert alert-info">
                    You don't have any projects yet. Create your first project to get started!
                </div>
            @endif
        </div>
    </div>

</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous">
    </script>
</body>

</html>
