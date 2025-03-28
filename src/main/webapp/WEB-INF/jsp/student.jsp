<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Dashboard</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
    }

    /* Sidebar Styling */
    .sidebar {
        width: 250px;
        height: calc(100vh - 56px);
        background: linear-gradient(135deg, #232526, #414345);
        color: white;
        position: absolute;
        top: 56px;
        left: 0;
        transition: width 0.3s ease-in-out;
        padding-top: 20px;
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

    .sidebar a:hover {
        background: rgba(255, 255, 255, 0.2);
    }

    .content {
        margin-left: 260px;
        padding: 20px;
        transition: margin-left 0.3s;
    }

    .collapsed .sidebar {
        width: 80px;
    }

    .collapsed .content {
        margin-left: 100px;
    }

    .toggle-btn {
        position: absolute;
        left: 260px;
        top: 70px;
        font-size: 20px;
        cursor: pointer;
        color: #333;
        transition: left 0.3s;
    }

    .collapsed .toggle-btn {
        left: 100px;
    }

    .student-table {
        margin-top: 20px;
    }

    .table th, .table td {
        text-align: center;
    }

    /* Responsive Design */
    @media screen and (max-width: 768px) {
        .sidebar {
            width: 80px;
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
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Student Management System</a>
        </div>
    </nav>

    <div class="sidebar">
        <h4>Admin Menu</h4>
        <a href="/adduser"><i class="fas fa-user-plus"></i> <span>Add User</span></a>
        <a href="/addstudent"><i class="fas fa-user-graduate"></i> <span>Add Student</span></a>
        <a href="/showstudents"><i class="fas fa-user-graduate"></i> <span>Student List</span></a>
        <a href="/branches/list"><i class="fas fa-list"></i> <span>Branch List</span></a>
        <a href="/scholarship"><i class="fas fa-award"></i> <span>Scholarship</span></a>
        <a href="/"><i class="fas fa-sign-out-alt"></i> <span>Logout</span></a>
    </div>

    <span class="toggle-btn" onclick="toggleSidebar()">
        <i class="fas fa-bars"></i>
    </span>

    <div class="content">
        <h2>Student Dashboard</h2>
        <div class="table-responsive student-table">
            <table class="table table-bordered table-striped table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>Sr.</th>
                        <th>Roll No.</th>
                        <th>Student Name</th>
                        <th>Father Name</th>
                        <th>Mobile No.</th>
                        <th>Branch</th>
                        <th>Semester</th>
                        <th>Admission Year</th>
                        <th>Edit</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="student" items="${students}" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>${student.rollNo}</td>
                            <td>${student.studentName}</td>
                            <td>${student.fatherName}</td>
                            <td>${student.mobileNo}</td>
                            <td>${student.branch.name}</td>
                            <td>${student.semester.name}</td>
                            <td>${student.admissionYear}</td>
                            <td><a href="editstudent?id=${student.rollNo}" class="btn btn-warning">Edit</a></td>
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
</body>
</html>
