<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            width: 50%;
            margin: 0 auto;
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .form-group label {
            width: 150px;
            margin-right: 10px;
        }
        .form-group input, .form-group select {
            flex: 1;
        }
        .form-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="form-container">
            <h2 class="mb-3 text-center">Student Details Form</h2>
            <form action="savestudent" method="post">
                <div class="form-group">
                    <label>Roll No. :</label>
                    <input type="text" class="form-control" name="rollNo" placeholder="Enter Roll No" required>
                </div>
                <div class="form-group">
                    <label>Student Name :</label>
                    <input type="text" class="form-control" name="studentName" placeholder="Enter Student Name" required>
                </div>
                <div class="form-group">
                    <label>Father Name :</label>
                    <input type="text" class="form-control" name="fatherName" placeholder="Enter Father Name" required>
                </div>
                <div class="form-group">
                    <label>Mobile No. :</label>
                    <input type="tel" class="form-control" name="mobileNo" placeholder="Enter Mobile No" required>
                </div>
                <div class="form-group">
                    <label>Email Id :</label>
                    <input type="email" class="form-control" name="email" placeholder="Enter Email Id" required>
                </div>
                <div class="form-group">
                    <label>Address :</label>
                    <input type="text" class="form-control" name="address" placeholder="Enter Address" required>
                </div>
                <div class="form-group">
                    <label>Branch :</label>
                    <select class="form-select" name="branch" required>
                        <option selected disabled>Select Branch</option>
                        <c:forEach var="branch" items="${branches}">
                            <option value="${branch.id}">${branch.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label>Semester :</label>
                    <select class="form-select" name="semester" required>
                        <option selected disabled>Select Semester</option>
                        <c:forEach var="semester" items="${semesters}">
                            <option value="${semester.id}">${semester.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-buttons">
                    <button type="reset" class="btn btn-secondary">Reset</button>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
