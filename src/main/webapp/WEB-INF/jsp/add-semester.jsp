<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Semester</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="card">
            <div class="card-header text-center">
                <h2>Add Semester</h2>
            </div>
            <div class="card-body">
                <form action="save" method="post">
                    <div class="mb-3">
                        <label class="form-label">Semester Name:</label>
                        <input type="text" name="name" class="form-control" placeholder="Enter Semester Name" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Branch:</label>
                        <select name="branch" class="form-select" required>
                            <option value="" disabled selected>Select Branch</option>
                            <!-- Dynamic branch options will be populated here -->
                        </select>
                    </div>
                    <div class="d-flex justify-content-between">
                        <a href="/semesters" class="btn btn-secondary">Cancel</a>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
