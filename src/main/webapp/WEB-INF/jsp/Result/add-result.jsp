<%@ include file="/static/components/header.jsp" %>

    <body>
        <div class="container mt-5 d-flex justify-content-center">
            <div class="card shadow p-4" style="max-width: 1000px; width: 100%; margin-top: 50px;">
                <h2 class="mb-4 text-center">Add Result</h2>
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger" role="alert">
                        ${errorMessage}
                    </div>
                </c:if>
                <form action="${pageContext.request.contextPath}/result/save" method="post" enctype="multipart/form-data">
                    <input type="hidden" id="branchId" value="${student.branch.id}" />
                    <div class="d-flex justify-content-between">
                        <div class="row">
                            <div class="col-md-6 col-lg-6">
                                <div class="mb-3">
                                    <label for="studentRollNo" class="form-label">Student Roll No.:</label>
                                    <input type="text" readonly value="${student.rollNo}" class="form-control"
                                        id="studentRollNo" placeholder="Student Roll No">
                                </div>
                                <input type="hidden" name="student.id" value="${student.id}" />

                                <div class="mb-3">
                                    <label for="sgpa" class="form-label">SGPA:</label>
                                    <input type="text" step="0.01" class="form-control" id="sgpa" name="sgpa"
                                        placeholder="Enter SGPA" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="semesterId" class="form-label">Semester:</label>
                                    <select class="form-select form-control w-100" name="semester.id"
                                        id="semesterSelect" required>
                                        <option value="" selected disabled>Select Semester</option>
                                        <c:forEach var="semester" items="${semesters}">
                                            <option value="${semester.id}">${semester.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="resultStatus" class="form-label">Result Status:</label>
                                    <select class="form-control" name="resultStatus" id="" required>
                                        <option value="" selected disabled>Select</option>
                                        <option value="Regular">Regular</option>
                                        <option value="Ex">Ex</option>
                                    </select>
                                </div>
                            </div>
                            <div class="mb-3 mr-3 pl-3 w-100">
                                <label for="resultImage" class="form-label">Result Image:</label>
                                <input type="file" name="resultImage" id="resultImage" class="form-control w-100 pl-0 py-1" accept="image/*" required>
                               
                            </div>
                        </div>
                        
                        <div class="mb-3 col-md-6 col-lg-6">
                            <label class="form-label">Subjects:</label>
                            <table class="table table-bordered" id="subjectsTable">
                                <thead>
                                    <tr>
                                        <th>Sr. No.</th>
                                        <th>Subject Name</th>
                                        <th>Pass/Fail</th>
                                    </tr>
                                </thead>
                                <tbody id="subjectsTableBody">
                                    <!-- Subjects will be dynamically loaded here -->

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Add Result</button>
                </form>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/static/js/filter.js"></script>
    </body>

    </html>