<%@ include file="/static/components/header-scholarship.jsp" %>

    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-3 col-lg-2 d-md-block bg-light sidebar pt-0" id="sidebar">
                <h5 class="font-weight-bold text-center">Scholarship Department</h5>
                <hr>
                <h4 class="pt-0">Filters</h4>
                <form id="filter-form" method="get" action="/scholarship">
                    <div class="mb-3">
                        <label class="form-label">Branch</label>
                        <select name="branchCode" class="form-control h-50">
                            <option value="">All</option>
                            <c:forEach var="branch" items="${branches}">
                                <option value="${branch.code}" 
                                    <c:if test="${branch.code == param.branchCode}">selected</c:if>
                                >${branch.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Semester</label>
                        <select name="semester" class="form-control h-50">
                            <option value="">All</option>
                            <c:forEach var="semester" items="${semesters}">
                                <option value="${semester.name}" 
                                    <c:if test="${semester.name == param.semester}">selected</c:if>
                                >${semester.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Caste</label>
                        <select name="cast" class="form-control h-50">
                            <option value="">All</option>
                            <option value="General" <c:if test="${param.cast == 'General'}">selected</c:if>>General</option>
                            <option value="OBC" <c:if test="${param.cast == 'OBC'}">selected</c:if>>OBC</option>
                            <option value="SC" <c:if test="${param.cast == 'SC'}">selected</c:if>>SC</option>
                            <option value="ST" <c:if test="${param.cast == 'ST'}">selected</c:if>>ST</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Application Status</label>
                        <select name="status" class="form-control h-50">
                            <option value="">All</option>
                            <option value="Applied" <c:if test="${param.status == 'Applied'}">selected</c:if>>Applied</option>
                            <option value="Not Applied" <c:if test="${param.status == 'Not Applied'}">selected</c:if>>Not Applied</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary my-3 w-100">Apply Filters</button>

                </form>
                <a href="/scholarship" class="d-block pt-1 btn .bg-success.bg-gradient mb-3" style="height: 35px !important;">Reset Filters</a>
            </nav>

            <!-- Main Content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <h4 class="text-left mt-4">Student Details</h4>

                <!-- Student Table -->
                <div class="card">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Roll Number</th>
                                <th>Name</th>
                                <th>Mobile No</th>
                                <th>Branch Code</th>
                                <th>Semester</th>
                                <th>Cast</th>
                                <th>Apply Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="student-table">
                            <c:forEach var="student" items="${students}">
                                <tr>
                                    <td>${student.id}</td>
                                    <td>${student.rollNo}</td>
                                    <td>${student.studentName}</td>
                                    <td>${student.mobileNo}</td>
                                    <td>${student.branch.code}</td>
                                    <td>${student.semester.name}</td>
                                    <td>${student.caste}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty student.scholarships}">
                                                <span class="badge bg-success">Applied</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge .bg-info .bg-gradient">Not Applied</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <button class="btn btn-danger btn-sm">
                                            <a href="scholarship/${student.id}" class="text-white">View</a>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
