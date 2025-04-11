<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document Upload Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Student Management System</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="/scholarship">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="/">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card p-4 shadow">
                    <h2 class="text-center mb-4">Edit Document Details</h2>
                    <form id="documentForm" method="post" action="/documents/update-document">
                        <input type="hidden" name="documentId" value="${document.id}">
                        <input type="hidden" name="studentId" value="${document.student.id}">
                        <div class="row mb-3">
                            <label for="profileId" class="col-sm-4 col-form-label">Profile Id</label>
                            <div class="col-sm-8">
                                <input type="text" value="${document.profileId}" class="form-control" name="profileId"
                                    placeholder="Enter Profile Id" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="aadharNo" class="col-sm-4 col-form-label">Aadhar No.</label>
                            <div class="col-sm-8">
                                <input type="text" value="${document.aadharNo}" class="form-control" name="aadharNo"
                                    placeholder="Enter Aadhar No." required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="casteCertificate" class="col-sm-4 col-form-label">Caste Certificate No.</label>
                            <div class="col-sm-8">
                                <input type="text" value="${document.casteCertificateNo}" class="form-control"
                                    name="casteCertificateNo" placeholder="Enter Caste Certificate No." required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="incomeCertificate" class="col-sm-4 col-form-label">Income Certificate
                                No.</label>
                            <div class="col-sm-8">
                                <input type="text" value="${document.incomeCertificateNo}" class="form-control"
                                    name="incomeCertificateNo" placeholder="Enter Income Certificate No." required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="residenceCertificate" class="col-sm-4 col-form-label">Residence Certificate
                                No.</label>
                            <div class="col-sm-8">
                                <input type="text" value="${document.residenceCertificateNo}" class="form-control"
                                    name="residenceCertificateNo" placeholder="Enter Residence Certificate No." required>
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