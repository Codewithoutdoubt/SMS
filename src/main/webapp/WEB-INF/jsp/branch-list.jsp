<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Branch List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Branch List</h2>
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Branch Name</th>
                    <th>Branch Code</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%-- Loop through the branch list from request attribute --%>
                <c:forEach var="branch" items="${branchList}">
                    <tr>
                        <td>${branch.id}</td>
                        <td>${branch.name}</td>
                        <td>${branch.code}</td>
                        <td>
                            <a href="editBranch.jsp?id=${branch.id}" class="btn btn-warning btn-sm">Edit</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="addBranch.jsp" class="btn btn-primary">Add New Branch</a>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
