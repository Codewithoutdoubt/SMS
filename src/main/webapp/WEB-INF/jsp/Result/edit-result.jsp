<%@ include file="/static/components/header-result.jsp" %>

<body>
    <div class="container mt-5 d-flex justify-content-center">
        <div class="card shadow p-4" style="max-width: 700px; width: 100%;">
            <h2 class="mb-4 text-center">Edit Result</h2>
            <form action="/result/update/${result.id}" method="post">
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label">Student Roll No.:</label>
                            <input type="text" readonly class="form-control" value="${result.student.rollNo}" placeholder="Student Roll No">
                        </div>
                        <input type="hidden" name="studentId" value="${result.student.id}" />
                        <div class="mb-3">
                            <label class="form-label">Result:</label>
                            <input type="text" class="form-control" name="resultValue" value="${result.resultValue}" placeholder="Enter Result" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">SGPA:</label>
                            <input type="number" step="0.01" class="form-control" name="sgpa" value="${result.sgpa}" placeholder="Enter SGPA" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="semesterId" class="form-label">Semester:</label>
                            <select class="form-select form-control w-100" name="semester.id" required>
                                <option value="" disabled selected>${result.semester.name}</option>
                                <c:forEach var="semester" items="${semesters}">
                                    <option value="${semester.id}">${semester.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Result Status:</label>
                            <input type="text" class="form-control" name="resultStatus" value="${result.resultStatus}" placeholder="Enter Result Status" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">CGPA:</label>
                            <input type="number" step="0.01" class="form-control" name="cgpa" value="${result.cgpa}" placeholder="Enter CGPA" required>
                        </div>
                                                
                    </div>
                </div>
                <button type="submit" class="btn btn-primary w-100">Save</button>
                <button type="reset" class="btn btn-secondary w-100 mt-2">Reset</button>
            </form>
        </div>
    </div>

    <script>
        function toggleSidebar() {
            document.body.classList.toggle("collapsed");
        }
    </script>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
