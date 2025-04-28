<%@ include file="/static/components/header-placement.jsp" %>

<div class="container">
    <div class="d-flex justify-content-between align-items-center">
        <h2 style="font-weight: 600;"><i class="fas fa-list"></i> Student Placement History :</h2>
        <a href="/placement/add/${student.id}"> <button class="w3-button w3-green w3-large w3-left">Add Placement</button></a>
    </div>
    <div class="table-responsive">
        <table class="table table-bordered table-striped table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>Sr.</th>
                    <th>Student Roll No.</th>
                    <th>Company Name</th>
                    <th>Package (LPA)</th>
                    <th>Selected Year</th>
                    <th>Edit</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="placement" items="${placements}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${student.rollNo}</td>
                        <td>${placement.companyName}</td>
                        <td>${placement.packageAmount}</td>
                        <td>${placement.selectedYear}</td>
                        <td><a href="/placement/edit/${placement.id}" class="btn btn-warning py-0">Edit</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
