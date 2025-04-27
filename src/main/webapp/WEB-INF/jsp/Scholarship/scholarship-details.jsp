<%@ include file="/static/components/header-scholarship.jsp" %>
    <div class="container-fluid">
        <div class="row">
            <!-- Main Content -->
            <main class="col-md-12 px-md-4">
                <div class="d-flex justify-content-between">
                    <h4 class="text-left mt-4">Student Details</h4>
                    <div class="d-flex">
                        <form action="/documents/add" method="post">
                            <input type="hidden" name="studentId" value="${student.id}" />
                            <button type="submit" class="text-left mb-2 mt-3 mx-1 btn btn-primary" ${empty student.documents ? '' : 'disabled'}>
                                <i class="fas fa-upload mx-2" style="color: #ffffff;"></i>Upload Document
                                Details
                            </button>
                        </form>

                        <form action="/documents/editdocument" method="post">
                            <c:forEach var="document" items="${student.documents}">
                                <input type="hidden" name="documentId" value="${document.id}" />
                            </c:forEach>
                            <button type="submit" class="text-left mb-2 mt-3 btn btn-primary" ${empty student.documents
                                ? 'disabled' : '' }>
                                <i class="fas fa-edit mx-2" style="color: #ffffff;"></i>Edit Documents</button>
                        </form>

                    </div>
                </div>

                <!-- Student Details -->
                <div class="card p-4">
                    <div class="row mb-2">
                        <div class="col-md-3"><strong>Profile Id:</strong></div>
                        <div class="col-md-3">
                            <c:forEach var="document" items="${student.documents}">
                                <c:out value="${document.profileId}" />
                            </c:forEach>
                        </div>
                        <div class="col-md-3"><strong>Roll No.:</strong></div>
                        <div class="col-md-3">
                            <c:out value="${student.rollNo}" />
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-3"><strong>Name:</strong></div>
                        <div class="col-md-3">
                            <c:out value="${student.studentName}" />
                        </div>
                        <div class="col-md-3"><strong>Father Name:</strong></div>
                        <div class="col-md-3">
                            <c:out value="${student.fatherName}" />
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-3"><strong>Branch:</strong></div>
                        <div class="col-md-3">
                            <c:out value="${student.branch.name}" />
                        </div>
                        <div class="col-md-3"><strong>Semester:</strong></div>
                        <div class="col-md-3">
                            <c:out value="${student.semester.name}" />
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-3"><strong>Mobile No:</strong></div>
                        <div class="col-md-3">
                            <c:out value="${student.mobileNo}" />
                        </div>
                        <div class="col-md-3"><strong>Admission Year</strong></div>
                        <div class="col-md-3">
                            <c:out value="${student.admissionYear}" />
                        </div>
                    </div>
                    <div class="row mb-2">

                        <div class="col-md-3"><strong>Aadhar No.:</strong></div>
                        <div class="col-md-3">
                            <c:forEach var="document" items="${student.documents}">
                                <c:out value="${document.aadharNo}" />
                            </c:forEach>
                        </div>
                        <div class="col-md-3"><strong>Income Certificate No.:</strong></div>
                        <div class="col-md-3">
                            <c:forEach var="document" items="${student.documents}">
                                <c:out value="${document.incomeCertificateNo}" />
                            </c:forEach>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-3"><strong>Caste Certificate No.:</strong></div>
                        <div class="col-md-3">
                            <c:forEach var="document" items="${student.documents}">
                                <c:out value="${document.casteCertificateNo}" />
                            </c:forEach>
                        </div>
                        <div class="col-md-3"><strong>Caste:</strong></div>
                        <div class="col-md-3">
                            <c:out value="${student.caste}" />
                        </div>
                    </div>

                    <div class="row mb-2">
                        <div class="col-md-3"><strong>Residence Certificate No.:</strong></div>
                        <div class="col-md-3">
                            <c:forEach var="document" items="${student.documents}">
                                <c:out value="${document.residenceCertificateNo}" />
                            </c:forEach>
                        </div>
                        <div class="col-md-3"><strong>Address:</strong></div>
                        <div class="col-md-3">
                            <c:out value="${student.address}" />
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-between">
                    <h4 class="text-center mt-4">Scholarship Details</h4>
                    <form action="/scholarship/addapplication" method="get">
                        <input type="hidden" name="studentId" value="${student.id}" />
                        <button type="submit" class="text-left mb-2 mt-3 mx-1 btn btn-primary">
                            <i class="fas fa-upload mx-2" style="color: #ffffff;"></i>Add Application
                        </button>
                    </form>
                </div>
                <!-- Student Table -->
                <div class="card p-4">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Application No.</th>
                                <th>Application Type</th>
                                <th>Academic Year</th>
                                <th>Scholar Id</th>
                                <th>Entitlement Amount</th>
                                <th>App. Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="scholarship" items="${scholarships}" varStatus="loop">
                                <tr>
                                    <td>${loop.index + 1}</td>
                                    <td>${scholarship.applicationNo}</td>
                                    <td>${scholarship.applicationType}</td>
                                    <td>${scholarship.academicYear}</td>
                                    <td>${scholarship.scholarId}</td>
                                    <td>${scholarship.entitlementAmount}</td>
                                    <td>${scholarship.applicationStatus}</td>
                                    <td>
                                        <div class="d-flex gap-2">
                                            <a href="/scholarship/update/${scholarship.scholarshipId}"
                                                class="btn btn-primary btn-sm">Edit</a>
                                            <form action="/scholarship/delete/${scholarship.scholarshipId}"
                                                method="post"
                                                onsubmit="return confirm('Are you sure you want to delete this application?')">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <button type="submit" class="btn btn-danger btn-sm ml-2">Delete</button>
                                            </form>
                                        </div>
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