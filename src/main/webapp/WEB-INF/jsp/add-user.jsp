<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <style>
        body {
            background-color: rgba(0, 0, 0, 0.761);
        }
        form {
            margin: 0 auto;
            width: 40%;
            margin-top: 10%;
            background: #f3d55da1;
            padding: 35px;
            border-radius: 10px;
        }
        .details {
            display: grid;
            grid-template-columns: 30% 60%;
            margin: 10px;
        }
        label {
            padding-top: 10px;
            font-weight: 700;
        }
        #savebtn {
            width: 50%;
            margin-left: 25%;
            margin-top: 15px;
        }
    </style>
</head>

<body>

    <form action="saveuser" method="post">
        <div class="details">
            <label for="username" class="form-label">Username :</label>
            <input type="text" class="form-control" name="username" id="" aria-describedby="helpId"
                placeholder="Enter Username" />
        </div>
        <div class="details">
            <label for="" class="form-label">Password :</label>
            <input type="password" class="form-control" name="password" id="" placeholder="Enter Password" />
        </div>
        <div class="details">
            <label for="" class="form-label">Access : </label>
            <select class="form-control" name="access" required>
                <option value="" disabled selected>Select Access Level</option>
                <option value="admin">Admin</option>
                <option value="scholarship">Scholarship</option>
                <option value="attendance">Attendance</option>
                <option value="fees">Fees</option>
                <option value="result">Result</option>
            </select>
        </div>
        <input name="" id="savebtn" class="btn btn-primary" type="submit" value="Save" />

        <div class="message text-white fs-3 text-center m-1">${message}</div>
    </form>
</body>

</html>
