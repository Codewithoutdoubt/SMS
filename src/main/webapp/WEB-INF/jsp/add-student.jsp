<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student</title>
    
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
            height: calc(120vh - 80px); /* Adjusted to start after navbar */
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
            padding: 30px;
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
            <a href="index.html"><i class="fas fa-sign-out-alt"></i> <span>Logout</span></a>            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
    </nav>

    <!-- Sidebar -->
    <%@ include file="/static/components/sidebar.jsp" %>
<!-- Content Area -->
<div class="content">
    <div class="container form-container">
        <div class="card">
            <div class="card-header text-center">Student Details Form</div>
            <div class="card-body">
                <form action="savestudent" method="post">
                    <div class="mb-3">
                        <label class="form-label">Roll No.</label>
                        <input type="text" class="form-control" name="rollNo" placeholder="Enter Roll No" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" name="studentName" placeholder="Enter Student Name" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Father Name</label>
                        <input type="text" class="form-control" name="fatherName" placeholder="Enter Father Name" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Caste</label>
                        <select class="form-select" name="caste" required>
                            <option value="" selected disabled>Select Caste</option>
                            <option value="General">General</option>
                            <option value="OBC">OBC</option>
                            <option value="SC">SC</option>
                            <option value="ST">ST</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Admission Year</label>
                        <input type="text" class="form-control" name="admissionYear" placeholder="Enter Admission Year (e.g. 2023)">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Mobile No.</label>
                        <input type="tel" class="form-control" name="mobileNo" placeholder="Enter Mobile No" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email Id</label>
                        <input type="email" class="form-control" name="email" placeholder="Enter Email Id" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Address</label>
                        <input type="text" class="form-control" name="address" placeholder="Enter Address" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Branch</label>
                        <select class="form-select"  name="branch" required>
                            <option value=""  selected disabled>Select Branch</option>
                            <c:forEach var="branch" items="${branches}">
                                <option value="${branch.id}">${branch.name}</option>
                            </c:forEach>
                        </select>
                    
                        <label class="form-label">Semester</label>
                        <select class="form-select" name="semester" required>
                            <option value=""  selected disabled>Select Semester</option>
                            <c:forEach var="semester" items="${semesters}">
                                <option value="${semester.id}">${semester.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="text-center">
                        <button type="reset" class="btn btn-secondary me-2">Reset</button>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Sidebar Toggle Script -->
<script>
    function toggleSidebar() {
        document.body.classList.toggle("collapsed");
    }
</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
