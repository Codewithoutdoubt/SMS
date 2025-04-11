<!--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Branch</title>
    
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
            margin-left: 550px;
            margin-right: 500px;
            padding: 30px;
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
    <div class="container mt5">
        <div class="form-container card p-4 mt-4">
            <h2 class="text-center">Add Branch</h2>
            <form action="save" method="post">
                <div class="mb-3">
                    <label class="form-label">Branch Name:</label>
                    <input type="text" class="form-control" name="name" placeholder="Enter Branch Name" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Branch Code:</label>
                    <input type="text" class="form-control" name="code" placeholder="Enter Branch Code" required>
                </div>
                <div class="d-flex justify-content-between">
                    <button type="reset" class="btn btn-secondary">Reset</button>
                    <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Sidebar Toggle Button --
    <span class="toggle-btn" onclick="toggleSidebar()">
        <i class="fas fa-bars"></i>
    </span>

    <!-- Content Area 
    <div class="content">
        <div class="container">
            <h2 class="mt-4"><i class="fas fa-users"></i> User List</h2>
            <div class="table-responsive">
            
                <div class="message text-white fs-3 text-center m-1">${message}</div>
                <table class="table table-bordered table-striped table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th>Username</th>
                            <th>Access</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.username}</td>
                <td>${user.access}</td>
            </tr>
        </c:forEach>
                    </tbody>
                </table>
                
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
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
