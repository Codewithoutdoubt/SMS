<%@ include file="/static/components/header.jsp" %>


    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 col-lg-2  sidebar">
            <h4 class="text-center">Scholarship Department</h4>
            <hr>
            <form id="filter-form" class="ml-1" method="get" action="/filter/Scholarship/scholarship">
                <h4 class="text-left pt-0">Filter Data</h4>
                <%@ include file="/static/components/department-filter.jsp" %>
                    <button type="reset" class="btn btn-primary h-75 w-100 ftr mt-3"><a class="p-0 text-center d-block"
                            href="/scholarship">Reset</a></button>
            </form>
        </div>
    </div>
    <!-- Main Content -->
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
        <div class="d-flex justify-content-between">
            <h4 class="text-left mt-4">Student Details</h4>
            <div class="d-flex justify-content-end mx-4">
                <form method="get" action="/scholarship" class="d-flex align-items-center">
                    <label for="statusFilter" style="font-weight: 700;font-size: 18px;font-family:Verdana, Geneva, Tahoma, sans-serif" class="mt-2 mr-2">Filter by Status:</label>
                    <select id="statusFilter" name="status" class="form-select form-select-sm me-2 h-50">
                        <option value="" ${empty param.status ? 'selected' : '' }>All</option>
                        <option value="Applied" ${param.status=='Applied' ? 'selected' : '' }>Applied</option>
                        <option value="Not Applied" ${param.status=='Not Applied' ? 'selected' : '' }>Not Applied
                        </option>
                    </select>
                    <button type="submit" class="btn btn-primary btn-sm ml-2">Filter</button>
                </form>
            </div>
        </div>
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
                    <c:forEach var="student" items="${students}" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>${student.rollNo}</td>
                            <td>${student.studentName}</td>
                            <td>${student.mobileNo}</td>
                            <td>${student.branch.code}</td>
                            <td>${student.semester.name}</td>
                            <td>${student.caste}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${applicationStatusMap[student.id]}">
                                        <span class="badge py-2">Applied</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-info bg-gradient py-2">Not Applied</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <button class="btn btn-danger btn-sm">
                                    <a href="/scholarship/${student.id}" class="text-white">View</a>
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