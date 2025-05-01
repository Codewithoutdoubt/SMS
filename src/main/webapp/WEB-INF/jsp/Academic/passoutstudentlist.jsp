<%@ include file="/static/components/header.jsp" %>

    <div class="row">
        <div class="col-md-2 sidebar">
            <%@ include file="/static/components/sidebar-academic.jsp" %>
        </div>
        <main class="col-md-10 ms-sm-auto col-lg-10 px-md-2">
            <div class="row justify-content-between">
                <div class="col-lg-3">
                    <h2>Academic Dashboard</h2>
                </div>
                <div class="col-lg-6 pt-3 px-5 d-flex">
                    <h4 class="mt-2 ml-5" style="font-weight: 600;">Filter by Roll Number</h4>
                    <form action="/academic/passoutstudents" method="get" class="mb-3">
                        <div class="input-group">
                            <input type="text" name="rollNo" class="form-control mx-3" placeholder="Enter Roll Number"
                                value="${rollNo != null ? rollNo : ''}">
                            <button class="btn btn-primary" type="submit">Filter</button>
                        </div>
                    </form>
                </div>
            </div>
            <!-- <h2 class="mb-4">Passout Students with TC Documents Submitted</h2> -->
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
                                <form action="/academic/tc/edit" method="get">
                                    <input type="hidden" name="studentId" value="${tc.student.id}" />
                                    <button type="submit" class="btn btn-primary">Edit Details</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>
    </div>
    </div>

    </body>

    </html>