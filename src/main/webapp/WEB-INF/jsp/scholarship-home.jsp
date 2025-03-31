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
                    <li class="nav-item"><a class="nav-link" href="scholarship-home.jsp">Home</a></li>
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
                <form id="filter-form">
                    <div class="mb-3">
                        <label class="form-label">Branch</label>
                        <select id="branch" class="form-control">
                            <option>All</option>
                            <option>Computer Science</option>
                            <option>Electronics</option>
                            <option>Mechanical</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Year</label>
                        <select id="year" class="form-control">
                            <option>All</option>
                            <option>1st Year</option>
                            <option>2nd Year</option>
                            <option>3rd Year</option>
                            <option>4th Year</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Cast</label>
                        <select id="cast" class="form-control">
                            <option>All</option>
                            <option>General</option>
                            <option>OBC</option>
                            <option>SC</option>
                            <option>ST</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Application Year</label>
                        <select id="appYear" class="form-control">
                            <option>All</option>
                            <option>2023</option>
                            <option>2024</option>
                            <option>2025</option>
                            <option>2026</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Apply Filters</button>
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
                                <th>Name</th>
                                <th>Roll Number</th>
                                <th>Branch Code</th>
                                <th>Semester</th>
                                <th>Cast</th>
                                <th>Eligible</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="student-table">
                            <c:forEach var="student" items="${students}">
                                <tr>
                                    <td>${student.id}</td>
                                    <td>${student.studentName}</td>
                                    <td>${student.rollNo}</td>
                                    <td>${student.branch.branchCode}</td>
                                    <td>${student.semester.semesterName}</td>
                                    <td>${student.caste}</td>
                                 	<td>${Scholarship.applicationStatus}</td>
                                    <td>
                                        <button class="btn btn-danger btn-sm">
                                            <a href="scholarship-details/${student.id}" class="text-white">View</a>
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
        document.getElementById("filter-form").addEventListener("submit", function (event) {
            event.preventDefault();

            let branch = document.getElementById("branch").value;
            let year = document.getElementById("year").value;
            let cast = document.getElementById("cast").value;
            let appYear = document.getElementById("appYear").value;

            let queryParams = new URLSearchParams();
            if (branch !== "All") queryParams.append("branch", branch);
            if (year !== "All") queryParams.append("year", year);
            if (cast !== "All") queryParams.append("cast", cast);
            if (appYear !== "All") queryParams.append("appYear", appYear);

            fetch(`/api/students?${queryParams.toString()}`)
                .then(response => response.json())
                .then(data => {
                    let tbody = document.getElementById("student-table");
                    tbody.innerHTML = "";
                    
                    data.forEach((student, index) => {
                        let row = `<tr>
                            <td>${index + 1}</td>
                            <td>${student.name}</td>
                            <td>${student.rollNumber}</td>
                            <td>${student.branchCode}</td>
                            <td>${student.semester}</td>
                            <td>${student.cast}</td>
                            <td>${student.appStatus}</td>
                            <td><button class="btn btn-danger btn-sm">
                                <a href="scholarship-details/${student.id}" class="text-white">View</a>
                            </button></td>
                        </tr>`;
                        tbody.innerHTML += row;
                    });
                })
                .catch(error => console.error("Error fetching data:", error));
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
