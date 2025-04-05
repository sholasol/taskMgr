@include('layouts.head')






    <div class="container mt-5">
        <div class="row mb-4">
            <div class="col">
                <h1>Edit Task</h1>
                <p>Welcome, {{ Auth::user()->name }}</p>
            </div>
            <div class="col-auto">
                <a href="{{ route('task') }}" class="btn btn-outline-primary">Manage Tasks</a>
            </div>
        </div>

  

        <div class="row mb-4">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        Update Task
                    </div>
                    <div class="card-body">
                            <form action="{{ route('task.update', ['task' => $task->id]) }}" method="POST">
                                @csrf
                                <input type="hidden" name="project_id" value="{{$project->id}}" />
                                <div class="mb-3">
                                    <label for="name" class="form-label">Project Name</label>
                                    <input type="text" class="form-control" id="project" name="project" value="{{ $project->name}}" readonly>
                                </div>

                                <div class="mb-3">
                                    <label for="name" class="form-label">Task Name</label>
                                    <input type="text" class="form-control" id="name" name="name" value="{{ $task->name}}" required>
                                </div>
                               
                                <div class="mb-3">
                                    <label for="project_id" class="form-label">Priority</label>
                                    <select name="priority" id="priority" class="form-select" required>
                                            <option value="3" >High</option>
                                            <option value="2">Medium</option>
                                            <option value="1">Low</option>
                                    </select>
                                    @error('priority')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>

                                <div class="mb-3">
                                    <label for="comment" class="form-label">Comment</label>
                                    <textarea class="form-control" id="comment" name="comment">
                                        {{ $task->comment}}
                                    </textarea>
                                    @error('comment')
                                        <p class="text-danger">{{ $messgae }}</p>
                                    @enderror
                                </div>
                                <button type="submit" class="btn btn-primary">Update Task</button>
                            </form>
                       
                    </div>
                </div>
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
                            // Refresh the page to show the updated priorities
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
