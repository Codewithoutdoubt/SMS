<%@ include file="/static/components/header.jsp" %>

    <body>
        <div class="container mt-5 d-flex justify-content-center">
            <div class="card shadow p-4" style="max-width: 700px; width: 100%; margin-top: 50px;">
                <h2 class="mb-4 text-center">Add New Result</h2>
                <form action="/result" method="post">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="studentRollNo" class="form-label">Student Roll No.:</label>
                                <input type="text" readonly value="${result.student.rollNo}" class="form-control"
                                    id="studentRollNo" placeholder="Student Roll No" >
                            </div>
                            <input type="hidden" name="student.id" value="${result.student.id}" />
                            <div class="mb-3">
                                <label for="result" class="form-label">Result:</label>
                                <select class="form-control" name="resultValue" id="" required>
                                    <option value="" selected disabled>Select</option>
                                    <option value="Pass">Pass</option>
                                    <option value="Fail">Fail</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="sgpa" class="form-label">SGPA:</label>
                                <input type="text" step="0.01" class="form-control" id="sgpa" name="sgpa"
                                    placeholder="Enter SGPA" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="semesterId" class="form-label">Semester:</label>
                                <select class="form-select form-control w-100" name="semester.id" required>
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

                            <div class="mb-3">
                                <label for="cgpa" class="form-label">CGPA:</label>
                                <input type="text" step="0.01" class="form-control" id="cgpa" name="cgpa"
                                    placeholder="Enter CGPA" required>
                            </div>

                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Add Result</button>
                </form>
            </div>
        </div>
    </body>

    </html>
