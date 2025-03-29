<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Student Management System</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="scholarship-home.html">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="/">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card p-4 shadow">
                    <h2 class="text-center mb-4">Submit Application Details</h2>
                    <form id="applicationForm">
                        <div class="row mb-3">
                            <label for="appNo" class="col-sm-4 col-form-label">Application No.</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="appNo" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="appType" class="col-sm-4 col-form-label">Application Type</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="appType" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="academicYear" class="col-sm-4 col-form-label">Academic Year</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="academicYear" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="scholarId" class="col-sm-4 col-form-label">Scholar Id</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="scholarId" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="entitlement" class="col-sm-4 col-form-label">Entitlement Amount</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="entitlement" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="status" class="col-sm-4 col-form-label">Application Status</label>
                            <div class="col-sm-8">
                                <select class="form-control" id="status" required>
                                    <option value="" selected disabled>Select Application Status</option>
                                    <option value="Approved">Approved</option>
                                    <option value="Hold">Hold</option>
                                    <option value="Payment Processed">Payment Processed</option>
                                    <option value="Pending">Pending</option>
                                    <option value="Rejected">Rejected</option>
                                    <option value="Sension">Sension</option>
                                    <option value="Submitted">Submitted</option>
                                </select>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
