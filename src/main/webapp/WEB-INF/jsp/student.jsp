<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Dashboard</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style>
.active { background-color: white; 
color:wheat;font-weight:bold;
width: 185px;border-top-right-radius: 5px;
}
body { margin: 0; padding: 0; }
.sidebar { padding: 25px 10px; box-shadow: 1px 2px 4px;border:solid 1px; align-items: center;margin-top: 15% }
.sidebar button { display: block; width: 90%; background-color: rgb(84, 126, 232); margin: 5px 0px; border: 1px solid wheat; border-radius: 10px; }
.student { display: grid; grid-template-columns: 12% 88%; }
.student-table { padding: 5px 10px; margin: 0px 5px; }
.student-table th, .student-table td { border: solid 1px; padding: 5px 5px; font-size: 14px; }
.btn { height: 30px; margin-top: -5px; padding-top: 2px; }
hr{border: solid 2px wheat;
}
</style>
</head>
<body>
    <div class="navbar bg-dark p-0">
        <nav class="nav justify-content-center">
            <a class="nav-link active" href="#">Students Dashboard</a>
            <a class="nav-link text-light" href="addstudent">Add Student</a>
        </nav>
        <form action="searchstudent" method="post">
            <input type="text" placeholder="Search" id="ssearch">
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
    <div class="student">
        <div class="sidebar">
            <div class="branch">
                <h3>Filter by</h3>
                <hr>
                <h4>Branch</h4>
                <button>CSE</button>
                <button>ET</button>
                <button>ME</button>
                <button>CE</button>
                <button>Electrical</button>
            </div>
            <div class="semester">
                <h4>Semester</h4>
                <button>1st</button>
                <button>2nd</button>
                <button>3rd</button>
                <button>4th</button>
                <button>5th</button>
            </div>
        </div>
        <div class="student-table table-striped">
            <table>
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
						
                        <td><a href="editstudent?id=${student.rollNo}" class="btn btn-warning mt-1">Edit</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>
