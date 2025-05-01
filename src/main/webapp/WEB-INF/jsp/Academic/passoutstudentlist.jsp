<%@ include file="/static/components/header.jsp" %>

    <div class="row">
        <div class="col-md-2 sidebar">
            <%@ include file="/static/components/sidebar-academic.jsp" %>
        </div>
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-2">
            <h2 class="mb-4">Passout Students with TC Documents Submitted</h2>
            <table class="table table-striped table-bordered">
                <thead class="table-primary">
                    <tr>
                        <th>#</th>
                        <th>Roll Number</th>
                        <th>Student Name</th>
                        <th>TC Certificate No</th>
                        <th>Migration Certificate No</th>
                        <th>Diploma Certificate No</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="tc" items="${tcList}" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>${tc.student.rollNo}</td>
                            <td>${tc.student.studentName}</td>
                            <td>${tc.tcCertificateNo}</td>
                            <td>${tc.migrationCertificateNo}</td>
                            <td>${tc.diplomaCertificateNo}</td>
                            <td>
                                <a href="/academicreport/${tc.student.id}" class="btn btn-info btn-sm">View Report</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
    </div>
    </div>

    </body>

    </html>