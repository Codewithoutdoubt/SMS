<%@ include file="/static/components/header.jsp" %>

<div class="row">
    <div class="col-md-2 col-lg-2  sidebar">
        <h4 class="text-center">Admission Department</h4>
        <hr>
        <form id="filter-form" class="ml-1" method="get" action="/filter/Faculty/student-list">
            <h4 class="text-left pt-0">Filter Data</h4>
            <%@ include file="/static/components/department-filter.jsp" %>
                <button type="reset" class="btn btn-primary h-75 w-100 ftr mt-3"><a class="p-0 text-center d-block"
                        href="/faculty">Reset</a></button>
        </form>
    </div>
</div>

        <main class="col-md-10 p-4" style="margin-left:270px;margin-top:45px !important;">
            <div class="d-flex justify-content-between mb-3">
                <h2 class="font-weight-bold w-25 my-1">Student List</h2>

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