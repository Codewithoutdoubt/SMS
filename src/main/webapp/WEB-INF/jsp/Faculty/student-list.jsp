<%@ include file="/static/components/header.jsp" %>

    <div class="row">
        <nav class="col-md-3 col-lg-2 d-md-block bg-light sidebar pt-0" id="sidebar">
            <h4 class="font-weight-bold text-center">Faculty Department</h4>
            <hr>
            <h4 class="pt-0">Filters</h4>
            <form id="filter-form" method="get" action="/filter/Faculty/student-list">
                <div class="mb-3">
                    <label class="form-label">Branch</label>
                    <select name="branchCode" class="form-control h-50">
                        <option value="">All</option>
                        <c:forEach var="branch" items="${branches}">
                            <option value="${branch.code}" <c:if test="${branch.code == param.branchCode}">selected
                                </c:if>
                                >${branch.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label">Semester</label>
                    <select name="semester" class="form-control h-50">
                        <option value="">All</option>
                        <c:forEach var="semester" items="${semesters}">
                            <option value="${semester.name}" <c:if test="${semester.name == param.semester}">selected
                                </c:if>
                                >${semester.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label">Admission Year</label>
                    <select id="academicYear" name="academicYear" class="form-control">
                        <option value="" selected>All</option>
                        <c:forEach var="student" items="${students}">
                            <option value="${student.admissionYear}" <c:if
                                test="${student.admissionYear == param.academicYear}">selected</c:if>
                                >${student.admissionYear}</option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary my-3 w-100">Apply Filters</button>

            </form>
            <a href="/${sessionScope.department.access}" class="d-block pt-1 btn .bg-success.bg-gradient mb-3"
                style="height: 35px !important;">Reset Filters</a>
        </nav>

        <main class="col-md-10 p-4" style="margin-left:270px;margin-top:45px !important;">
            <div class="d-flex justify-content-between mb-3">
                <h2 class="font-weight-bold w-25 my-1">Student List</h2>
                <input type="text" id="rollNoSearch" class="form-control w-25 mt-1 mx-3" placeholder="Type roll number to search...">

            </div>
            <table class="table table-bordered" id="studentTable">
                <thead class="table-primary">
                    <tr>
                        <th>#</th>
                        <th>Roll No</th>
                        <th>Student Name</th>
                        <th>Branch</th>
                        <th>Semester</th>
                        <th>Admission Year</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="student" items="${students}" varStatus="status">
                        <tr>
                            <td>
                                <c:out value="${status.index +1}" />
                            </td>
                            <td class="rollNoCell">
                                <c:out value="${student.rollNo}" />
                            </td>
                            <td>
                                <c:out value="${student.studentName}" />
                            </td>
                            <td>
                                <c:out value="${student.branch.name}" />
                            </td>
                            <td>
                                <c:out value="${student.semester.name}" />
                            </td>
                            <td>
                                <c:out value="${student.admissionYear}" />
                            </td>
                            <td>
                                <a href="<c:url value='/faculty/edit-student-semester?studentId=${student.id}' />"
                                    class="btn btn-primary btn-sm">Edit Semester</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <script>
                
            </script>
        </main>
    </div>

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/filter.js">

    </script>