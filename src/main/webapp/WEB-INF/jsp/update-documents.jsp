<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Document Details</title>
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

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card p-4 shadow">
                    <h2 class="text-center mb-4">Update Document Details</h2>

                    <form action="/documents/update" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="documentId" value="${document.id}"/>
                        <input type="hidden" name="studentId" value="${document.student.id}"/>
                        <div class="row mb-3">
                            <label for="aadharNo" class="col-sm-4 col-form-label">Aadhar No.</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="aadharNo" name="aadharNo" value="<c:out value='${document.aadharNo}'/>" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="casteCertificate" class="col-sm-4 col-form-label">Caste Certificate No.</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="casteCertificate" name="casteCertificateNo" value="<c:out value='${document.casteCertificateNo}'/>" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="incomeCertificateNo" class="col-sm-4 col-form-label">Income Certificate No.</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="incomeCertificate" name="incomeCertificateNo" value="<c:out value='${document.incomeCertificateNo}'/>" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="residenceCertificateNo" class="col-sm-4 col-form-label">Residence Certificate No.</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="residenceCertificate" name="residenceCertificateNo" value="<c:out value='${document.residenceCertificateNo}'/>" required>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
