<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Scholarship Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        button a{
            text-decoration: none;
            color: rgb(255, 255, 255);
        }
    </style>
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
    
    <div class="container-fluid">
        <div class="row">
            <!-- Main Content -->
            <main class="col-md-12 px-md-4">
                <div class="d-flex justify-content-between">
                <h4 class="text-left mt-4">Student Details</h4>
                <button class="text-left mb-2 mt-3 btn btn-primary"><a href="add-documents.html"><i class="fas fa-upload mx-2" style="color: #ffffff;"></i>Upload Document Details</a></button>
            </div>
                <!-- Student Details -->
                <div class="card p-4">
                    <div class="row mb-2">
                        <div class="col-md-3"><strong>Profile Id:</strong></div>
                        <div class="col-md-3">PR2201C04003</div>
                        <div class="col-md-3"><strong>Roll No.:</strong></div>
                        <div class="col-md-3">22014C04003</div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-3"><strong>Name:</strong></div>
                        <div class="col-md-3">Deepak Vishwakarma</div>
                        <div class="col-md-3"><strong>Father Name:</strong></div>
                        <div class="col-md-3">Aman Vishwakarma</div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-3"><strong>Branch:</strong></div>
                        <div class="col-md-3">Computer Science And Engineering</div>
                        <div class="col-md-3"><strong>Semester:</strong></div>
                        <div class="col-md-3">6th Semester</div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-3"><strong>Mobile No:</strong></div>
                        <div class="col-md-3">7805961023</div>
                        <div class="col-md-3"><strong>Admission Year</strong></div>
                        <div class="col-md-3">2022-23</div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-3"><strong>Cast:</strong></div>
                        <div class="col-md-3">OBC</div>
                        <div class="col-md-3"><strong>Aadhar No.:</strong></div>
                        <div class="col-md-3">9993 3443 6556</div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-3"><strong>Income Certificate:</strong></div>
                        <div class="col-md-3">Yes</div>
                        <div class="col-md-3"><strong>Residence Certificate No.:</strong></div>
                        <div class="col-md-3">123456</div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-3"><strong>Caste Certificate:</strong></div>
                        <div class="col-md-3">Yes</div>
                        <div class="col-md-3"><strong>Address:</strong></div>
                        <div class="col-md-3">Yes</div>
                    </div>
                </div>
                <div class="d-flex justify-content-between">
                    <h4 class="text-center mt-4">Scholarship Details</h4>
                    <button class="text-left mb-2 mt-3 btn btn-primary"><a href="add-documents.html">Add Application</a></button>
                </div>
                    <!-- Student Table -->
                    <div class="card p-4">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Application No.</th>
                                    <th>Application Type</th>
                                    <th>Academic Year</th>
                                    <th>Scholar Id</th>
                                    <th>Entitlement Amount</th>
                                    <th>App. Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>Pr033020001</td>
                                    <td>Renewal</td>
                                    <td>2025</td>
                                    <td>S03034020</td>
                                    <td>14440</td>
                                    <td>Pending</td>
                                    <td><button class="btn btn-danger btn-sm"><a href="update-application-details.html">Edit</a></button></td>
                                </tr>
                                <!-- More students can be dynamically added -->
                            </tbody>
                        </table>
                    </div>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
