<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
    if (session.getAttribute("department") == null || ((com.sms.entity.Department)session.getAttribute("department")).getUsername() == null) {
        response.sendRedirect("/loginpage");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${department.name}</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <!--w3school CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
</head>
<body>

    <!-- Bootstrap Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><b><i>Student Management System</i></b></a>
            <div>
            <a href="/result" onmouseover="return false;" style="color: rgb(255, 255, 255); font-weight: 800;font-size: 16px;"><span>Home</span></a>
            <a href="/logout" style="color: rgb(255, 255, 255); font-weight: 800;font-size: 16px;margin-left: 15px;"><i class="fas fa-sign-out-alt"></i> <span>Logout</span></a>
            <span style="color: white; font-weight: 600; margin-left: 20px;" class="log-id">
                Logged in as: <c:out value="${sessionScope.department.username}" default="Guest"/>
            </span>
            </div>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
    </nav> 

    <!-- Add Placement Department Link -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mt-2">
        <div class="container-fluid">
            <a class="navbar-brand" href="/placement"><b><i>Placement Department</i></b></a>
        </div>
    </nav>
