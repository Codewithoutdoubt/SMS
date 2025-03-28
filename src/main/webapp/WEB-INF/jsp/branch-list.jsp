<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Branch List</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
    }
    .sidebar {
        width: 250px;
        height: calc(100vh - 56px);
        background: linear-gradient(135deg, #232526, #414345);
        color: white;
        position: absolute;
        top: 56px;
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
    .sidebar a:hover {
        background: rgba(255, 255, 255, 0.2);
    }
    .content {
        margin-left: 260px;
        padding: 20px;
        transition: margin-left 0.3s;
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
    <div class="content">
        <h2 class="mt-4"><i class="fas fa-list"></i> Branch List</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Branch Name</th>
                        <th>Branch Code<th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="branch" items="${branchList}">
                        <tr>
                            <td>${branch.id}</td>
                            <td>${branch.name}</td>
                            <td>${branch.code}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
