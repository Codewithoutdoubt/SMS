<!--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add User</title>
    
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

/* Content Area */
.content {
            margin-left: 550px;
            margin-right: 350px;
            padding: 20px;
            transition: margin-left 0.3s;
        }

        .collapsed .content {
            margin-left: 100px;
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
    <div class="sidebar">
        <h4>Admin Menu</h4>
        <a href="Web-page.html"><i class="fas fa-dashboard"></i> <span>Dashboard</span></a>
        
        <a href="/users"><i class="fas fa-user"></i><span>User</span></a>
 
         <a href=""><i class="fas fa-user-graduate"></i><span>Student</span></a>
        
        <a href="/"><i class="fas fa-list"></i> <span>Branch</span></a>

        <a href=""><i class="fas fa-list"></i><span>Semester</span></a>

        <a href="/scholarship"><i class="fas fa-award"></i> <span>Scholarship</span></a>

        <a href="/"><i class="fas fa-users"></i><span>Attendance</span></a>

        <a href="/"><i class="fas fa-book"></i><span>Exam</span></a>

        <a href="/"><i class="fas fa-diamond"></i><span>Fees</span></a>

    </div>
<!-- Content Area -->
<div class="content">
    <div class="container mt-5">
        <div class="card">
            <h3 class="text-center mb-4"><i class="fas fa-user-plus"></i> Add User</h3>
            <form action="/saveuser" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label">Username:</label>
                    <input type="text" class="form-control" name="username" placeholder="Enter Username" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" class="form-control" name="password" placeholder="Enter Password" required>
                </div>
                <div class="mb-3">
                    <label for="access" class="form-label">Access Level:</label>
                    <select class="form-control" name="access" required>
                        <option value="" disabled selected>Select Access Level</option>
                        <option value="admin">Admin</option>
                        <option value="scholarship">Scholarship</option>
                        <option value="attendance">Attendance</option>
                        <option value="fees">Fees</option>
                        <option value="result">Result</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Save User</button>
            </form>
        </div>
    </div>
</div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
