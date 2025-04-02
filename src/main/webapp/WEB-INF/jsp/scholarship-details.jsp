<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Scholarship Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        button a {
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
                    <form action="/documents/add" method="post">
                        <input type="hidden" name="studentId" value="${student.id}"/>
                        <c:forEach var="document" items="${student.documents}">
                            <a href="/documents/update?documentId=${document.id}" class="btn btn-primary">Edit Document</a>
                        </c:forEach>
                    </form>
                </div>  
                <button type="submit" class="text-left mb-2 mt-3 btn btn-primary">
                    <i class="fas fa-upload mx-2" style="color: #ffffff;"></i>Upload Document Details
                </button>
                
                <!-- Student Details -->
                <div class="card p-4">
                    <div class="row mb-2">
                        <div class="col-md-3"><strong>Profile Id:</strong></div>
                        <div class="col-md-3">PR2201C04003</div>
                        <div class="col-md-3"><strong>Roll No.:</strong></div>
                        <div class="col-md-3"><c:out value="${student.rollNo}"/></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-3"><strong>Name:</strong></div>
                        <div class="col-md-3"><c:out value="${student.studentName}"/></div>
                        <div class="col-md-3"><strong>Father Name:</strong></div>
                        <div class="col-md-3"><c:out value="${student.fatherName}"/></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-3"><strong>Branch:</strong></div>
                        <div class="col-md-3"><c:out value="${student.branch.branchName}"/></div>
                        <div class="col-md-3"><strong>Semester:</strong></div>
                        <div class="col-md-3"><c:out value="${student.semester.semesterName}"/></div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-3"><strong>Mobile No:</strong></div>
                        <div class="col-md-3"><c:out value="${student.mobileNo}"/></div>
                        <div class="col-md-3"><strong>Admission Year</strong></div>
                        <div class="col-md-3"><c:out value="${student.admissionYear}"/></div>
                    </div>
                    <div class="row mb-2">
                        
                        <div class="col-md-3"><strong>Aadhar No.:</strong></div>
                        <div class="col-md-3">
                            <c:forEach var="document" items="${student.documents}">
                                <c:out value="${document.aadharNo}"/>
                            </c:forEach>
                        </div>
                        <div class="col-md-3"><strong>Income Certificate No.:</strong></div>
                        <div class="col-md-3">
                            <c:forEach var="document" items="${student.documents}">
                                <c:out value="${document.incomeCertificateNo}"/>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-3"><strong>Caste Certificate No.:</strong></div>
                        <div class="col-md-3">
                            <c:forEach var="document" items="${student.documents}">
                                <c:out value="${document.casteCertificateNo}"/>
                            </c:forEach>
                        </div>
                        <div class="col-md-3"><strong>Caste:</strong></div>
                        <div class="col-md-3"><c:out value="${student.caste}"/></div>
                    </div>

                    <div class="row mb-2">
                        <div class="col-md-3"><strong>Residence Certificate No.:</strong></div>
                        <div class="col-md-3">
                            <c:forEach var="document" items="${student.documents}">
                                <c:out value="${document.residenceCertificateNo}"/>
                            </c:forEach>
                        </div>
                        <div class="col-md-3"><strong>Address:</strong></div>
                        <div class="col-md-3"><c:out value="${student.address}"/></div>
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
                                <c:forEach var="scholarship" items="${scholarships}">
                                    <tr>
                                        <td>${scholarship.id}</td>
                                        <td>${scholarship.applicationNo}</td>
                                        <td>${scholarship.applicationType}</td>
                                        <td>${scholarship.academicYear}</td>
                                        <td>${scholarship.scholarId}</td>
                                        <td>${scholarship.entitlementAmount}</td>
                                        <td>${scholarship.status}</td>
                                        <td>
                                            <button class="btn btn-danger btn-sm">
                                                <a href="update-application-details.html?id=${scholarship.id}">Edit</a>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
