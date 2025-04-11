<!--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users Data</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="w3-css">
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
        .dropdown-content {
display:none;
position:absolute;
background-color:#0000FF;
min-width:150px;
}
.dropdown-content a {
color:#000000;
padding:12px 16px;
text-decoration:none;
display:block;
text-align:left;
}
.dropdown-content a:hover {
background-color:#9900CC;}
.dropdown:hover .dropdown-content {
display:block;}
/* Content Area */
.content {
            margin-left: 230px;
            margin-right: 200px;
            
            padding: 50px;
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
            <a href="index.html"><i class="fas fa-sign-out-alt"></i> <span>Logout</span></a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
    </nav>

    <!-- Sidebar -->
    <%@ include file="/static/components/sidebar.jsp" %>
    <!-- Content Area -->
    <div class="content">                
        <div class="container mt-1">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="mb-0">
                    <i class="fas fa-users mr-2"></i>User Management
                </h2>
                <a href="addUser" class="btn btn-success">
                    <i class="fas fa-plus mr-2"></i>Add New User
                </a>
            </div>

            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0">
                        <i class="fas fa-list mr-2"></i>User List
                    </h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0">
                            <thead class="thead-light">
                                <tr>
                                    <th class="text-center" style="width: 10%">#</th>
                                    <th style="width: 40%">Username</th>
                                    <th class="text-center" style="width: 30%">Access Level</th>
                                    <th class="text-center" style="width: 20%">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" items="${users}" varStatus="loop">
                                    <tr>
                                        <td class="text-center">${loop.index + 1}</td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div class="avatar mr-3">
                                                    <i class="fas fa-user-circle fa-2x text-primary"></i>
                                                </div>
                                                <div>
                                                    <h6 class="mb-0">${user.username}</h6>
                                                    <small class="text-muted">Last active: Today</small>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <span class="badge badge-pill ${user.access == 'admin' ? 'badge-primary' : 'badge-secondary'} p-2">
                                                <i class="fas ${user.access == 'admin' ? 'fa-shield-alt' : 'fa-user'} mr-1"></i>
                                                ${user.access}
                                            </span>
                                        </td>
                                        <td class="text-center">
                                            <form action="${pageContext.request.contextPath}/delete/${user.id}" method="post" onsubmit="return confirm('Are you sure you want to delete this user?');">
                                                <button type="submit" class="btn btn-danger">Delete</button>
                                            </form>
                            
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer bg-light">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="text-muted">
                            Showing ${users.size()} of ${users.size()} users
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>

</div></div>
    
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
