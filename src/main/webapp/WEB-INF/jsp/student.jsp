<!--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student list</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #ffffff;
        }

        /* Sidebar Styling */
        .sidebar {
            width: 250px;
            height: calc(100vh - 56px); /* Adjusted to start after navbar */
            background: linear-gradient(135deg, #04a2f1, #474242);
            color: rgb(255, 255, 255);
            font-style:initial;
            position: absolute;
            top: 56px; /* Start after navbar */
            left: 0;
            transition: width 0.3s ease-in-out;
        }

        .sidebar a {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            color: white;
            font-size: 16px;
            text-decoration: none;
            transition: 0.3s;
            border-radius: 5px;
        }

        .sidebar a i {
            margin-right: 10px;
            min-width: 30px;
            text-align: center;
        }

        .sidebar a span {
            transition: opacity 0.3s ease-in-out;
        }

        .sidebar a:hover {
            background: rgba(0, 0, 0, 0.2);
        }

        .sidebar h4 {
            text-align: center;
            margin-bottom: 20px;
            padding-top: 15px;
            font-weight: bold;
            text-transform: uppercase;
            transition: opacity 0.3s ease-in-out;
        }

        /* Collapsed Sidebar */
        .collapsed .sidebar {
            width: 80px;
        }

        .collapsed .sidebar h4,
        .collapsed .sidebar a span {
            opacity: 0;
            pointer-events: none;
        }

        /* Content Area */
        .content {
            margin-left: 260px;
            padding: 20px;
            transition: margin-left 0.3s;
        }

        .collapsed .content {
            margin-left: 100px;
        }

        /* Sidebar Toggle Button */
        .toggle-btn {
            position: absolute;
            left: 260px;
            top: 70px; /* Adjusted for navbar */
            font-size: 20px;
            cursor: pointer;
            color: #333;
            transition: left 0.3s;
        }

        .collapsed .toggle-btn {
            left: 100px;
        }

        /* Sidebar Hover Effect */
        .collapsed .sidebar:hover {
            width: 250px;
        }

        .collapsed .sidebar:hover h4,
        .collapsed .sidebar:hover a span {
            opacity: 1;
            pointer-events: auto;
        }

        /* Responsive Design */
        @media screen and (max-width: 768px) {
            .sidebar {
                width: 80px;
            }

            .sidebar h4 {
                display: none;
            }

            .sidebar a {
                text-align: center;
                padding: 12px;
            }

            .sidebar a i {
                margin-right: 0;
            }

            .content {
                margin-left: 100px;
            }

            .toggle-btn {
                left: 100px;
            }
        }
    </style>
</head>
<body>

    <!-- Bootstrap Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><b><i>Student Management System</i></b></a>
            <a href="/"><i class="fas fa-sign-out-alt"></i> <span>Logout</span></a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
    </nav>

    <!-- Sidebar -->
    <%@ include file="/static/components/sidebar.jsp" %>
    <div class="content">
        <a href="/addstudent"> <button onclick="document.getElementById('id01').style.display='block'"
            class="w3-button w3-green  w3-large w3-left">Add Student</button></a>
        <h2>Student Dashboard</h2>
        <div class="table-responsive student-table">
            <table class="table table-bordered table-striped table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>Sr.</th>
                        <th>Roll No.</th>
                        <th>Student Name</th>
                        <th>Father Name</th>
                        <th>Caste</th>
                        <th>Mobile No.</th>
                        <th>Branch</th>
                        <th>Semester</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="student" items="${students}" varStatus="status">
                                    <tr>
                                        <td>${status.index + 1}</td>
                                        <td>${student.rollNo}</td>
                                        <td>${student.studentName}</td>
                                        <td>${student.fatherName}</td>
                                        <td>${student.caste}</td>
                                        <td>${student.mobileNo}</td>
                                        <td>${student.branch.code}</td>
                                        <td>${student.semester.name}</td>
                                        <td>
                                            <a href="deletestudent?id=${student.id}" class="btn btn-danger btn-sm">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    
    <script>
        function toggleSidebar() {
            document.body.classList.toggle("collapsed");
        }
    </script>


    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
