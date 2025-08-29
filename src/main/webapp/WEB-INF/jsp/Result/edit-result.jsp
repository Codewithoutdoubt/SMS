<%@ include file="/static/components/header.jsp" %>

<body>
    <div class="container mt-5 d-flex justify-content-center">
        <div class="card shadow p-4" style="max-width: 900px; width: 100%;margin-top: 50px;">
            <h2 class="mb-4 text-center">Edit Result</h2>
            <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger" role="alert">
                            ${errorMessage}
                        </div>
                    </c:if>
            <form action="${pageContext.request.contextPath}/result/update" method="post" enctype="multipart/form-data">
                    <input type="hidden" id="branchId" value="${result.student.branch.id}" />
                    <div class="d-flex justify-content-between">
                        <div class="row">
                            <div class="col-md-6 col-lg-6">
                                <div class="mb-3">
                                    <label for="studentRollNo" class="form-label">Student Roll No.:</label>
                                    <input type="text" readonly value="${result.student.rollNo}" class="form-control"
                                        id="studentRollNo" placeholder="Student Roll No">
                                </div>
                                <input type="hidden" name="id" id="id" value="${result.id}" />
                                
                                <div class="mb-3">
                                    <label for="sgpa" class="form-label">SGPA:</label>
                                    <input type="text" step="0.01" class="form-control" id="sgpa" name="sgpa"
                                        placeholder="Enter SGPA" value="${result.sgpa}" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="semesterId" class="form-label">Semester:</label>
                                    <select class="form-select form-control w-100" name="semester.id"
                                        id="semesterSelect" required>
                                        <option value="${result.semester.id}" selected>${result.semester.name}</option>
                                        <c:forEach var="semester" items="${semesters}">
                                            <option value="${semester.id}">${semester.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="resultStatus" class="form-label">Result Status:</label>
                                    <select class="form-control" name="resultStatus" id="" required>
                                        <option value="${result.resultStatus}" selected>${result.resultStatus}</option>
                                        <option value="Regular">Regular</option>
                                        <option value="Ex">Ex</option>
                                    </select>
                                </div>
                            </div>
                            <div class="mb-3 mr-3 pl-3 w-100">
                                <label for="resultImage" class="form-label">Result Image:</label>
                                <c:if test="${not empty result.imagePath}">
                                    <div class="mb-2">
                                        <p>Current Image:</p>
                                        <img src="${pageContext.request.contextPath}${result.imagePath}" alt="Current Result Image" class="img-thumbnail" style="max-width: 200px; cursor: pointer;" onclick="window.open('${pageContext.request.contextPath}${result.imagePath}', '_blank')"/>
                                    </div>
                                </c:if>
                                <input type="file" name="resultImage" id="resultImage" class="form-control w-100 pl-0 py-1" accept="image/*">
                                <small class="form-text text-muted">Upload a new image to replace the existing one. Leave blank to keep the current image.</small>
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
                                    <c:forEach var="subject" items="${result.subjects}">
                                        
                                    </c:forEach>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Update Result</button>
                </form>
        </div>
    </div>

    <script>
        function toggleSidebar() {
            document.body.classList.toggle("collapsed");
        }
    </script>

    <script src="${pageContext.request.contextPath}/static/js/filter.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
