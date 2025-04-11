<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <!-- Navbar -->
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

    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-3 col-lg-2 d-md-block bg-light sidebar p-3">
                <h4>Filters</h4>
                <form id="filter-form" method="get" action="/scholarship">
                    <div class="mb-3">
                        <label class="form-label">Branch Code</label>
                        <select name="branchCode" class="form-control">
                            <option value="">All</option>
                            <option value="C04">Computer Science</option>
                            <option value="EC">Electronics</option>
                            <option value="ME">Mechanical</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Semester</label>
                        <select name="semester" class="form-control">
                            <option value="">All</option>
                            <option value="1st Semester">1st Semester</option>
                            <option value="2st Semester">2st Semester</option>
                            <option value="3st Semester">3st Semester</option>
                            <option value="4st Semester">4st Semester</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Caste</label>
                        <select name="cast" class="form-control">
                            <option value="">All</option>
                            <option value="General">General</option>
                            <option value="OBC">OBC</option>
                            <option value="SC">SC</option>
                            <option value="ST">ST</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Application Status</label>
                        <select name="status" class="form-control">
                            <option value="">All</option>
                            <option value="Applied">Applied</option>
                            <option value="Not Applied">Not Applied</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary my-3">Apply Filters</button>

                    <a href="/scholarship" class="btn btn-secondary">Reset Filters</a>
                </form>
            </nav>

            <!-- Main Content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <h2 class="text-center mt-4">Student Details</h2>

                <!-- Student Table -->
                <div class="card p-4">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Roll Number</th>
                                <th>Name</th>
                                <th>Mobile No</th>
                                <th>Branch Code</th>
                                <th>Semester</th>
                                <th>Cast</th>
                                <th>Apply Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="student-table">
                            <c:forEach var="student" items="${students}">
                                <tr>
                                    <td>${student.id}</td>
                                    <td>${student.rollNo}</td>
                                    <td>${student.studentName}</td>
                                    <td>${student.mobileNo}</td>
                                    <td>${student.branch.code}</td>
                                    <td>${student.semester.name}</td>
                                    <td>${student.caste}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty student.scholarships}">
                                                <span class="badge bg-success">Applied</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-secondary">Not Applied</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <button class="btn btn-danger btn-sm">
                                            <a href="scholarship/${student.id}" class="text-white">View</a>
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

    <script>
        // Preserve selected filter values when page reloads
        document.addEventListener('DOMContentLoaded', function() {
            const params = new URLSearchParams(window.location.search);
            ['branchCode', 'semester', 'cast', 'status'].forEach(param => {
                const value = params.get(param);
                if (value) {
                    const select = document.querySelector(`select[name="${param}"]`);
                    if (select) select.value = value;
                }
            });
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
