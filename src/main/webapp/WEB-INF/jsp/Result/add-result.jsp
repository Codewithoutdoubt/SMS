<%@ include file="/static/components/header.jsp" %>

    <body>
        <div class="container mt-5 d-flex justify-content-center">
            <div class="card shadow p-4" style="max-width: 700px; width: 100%; margin-top: 50px;">
                <h2 class="mb-4 text-center">Add Result</h2>
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger" role="alert">
                        ${errorMessage}
                    </div>
                </c:if>
                <form action="${pageContext.request.contextPath}/result" method="post">
                    <c:if
                        test="${result.student != null && result.student.branch != null && result.student.branch.id != null}">
                        <input type="hidden" id="branchId" value="${result.student.branch.id}" />
                    </c:if>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="studentRollNo" class="form-label">Student Roll No.:</label>
                                <input type="text" readonly value="${result.student.rollNo}" class="form-control"
                                    id="studentRollNo" placeholder="Student Roll No">
                            </div>
                            <input type="hidden" name="student.id" value="${result.student.id}" />

                            <div class="mb-3">
                                <label for="sgpa" class="form-label">SGPA:</label>
                                <input type="text" step="0.01" class="form-control" id="sgpa" name="sgpa"
                                    placeholder="Enter SGPA" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="semesterId" class="form-label">Semester:</label>
                                <select class="form-select form-control w-100" name="semester.id" id="semesterSelect"
                                    required>
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
                    </div>
                    <div class="mb-3">
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
                    <button type="submit" class="btn btn-primary w-100">Add Result</button>
                </form>
            </div>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const semesterSelect = document.getElementById('semesterSelect');
                const branchIdInput = document.getElementById('branchId');
                const subjectsTableBody = document.getElementById('subjectsTableBody');

                semesterSelect.addEventListener('change', function () {
                    const semesterId = this.value;
                    const branchId = branchIdInput ? branchIdInput.value : null;

                    if (!branchId) {
                        alert('Branch ID is not available.');
                        return;
                    }

                    if (!semesterId) {
                        subjectsTableBody.innerHTML = '';
                        return;
                    }

fetch(window.location.origin + '${pageContext.request.contextPath}' + '/result/subjects?branchId=' + branchId + '&semesterId=' + semesterId)
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok');
                            }
                            return response.json();
                        })
                        .then(subjects => {
                            subjectsTableBody.innerHTML = '';
                            if (subjects.length === 0) {
                                subjectsTableBody.innerHTML = '<tr><td colspan="3" class="text-center">No subjects found for selected semester and branch.</td></tr>';
                                return;
                            }
                            subjects.forEach((subject, index) => {
                                const row = document.createElement('tr');

                                const srNoCell = document.createElement('td');
                                srNoCell.textContent = index + 1;
                                row.appendChild(srNoCell);

                                const nameCell = document.createElement('td');
                                nameCell.textContent = subject.subjectName;
                                row.appendChild(nameCell);

                                const passFailCell = document.createElement('td');
                                passFailCell.innerHTML = `
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="subjectResults[${index}].passed" id="pass-${subject.id}" value="true" required>
                                        <label class="form-check-label" for="pass-${subject.id}">Pass</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="subjectResults[${index}].passed" id="fail-${subject.id}" value="false">
                                        <label class="form-check-label" for="fail-${subject.id}">Fail</label>
                                    </div>
                                    <input type="hidden" name="subjectResults[${index}].subject.id" value="${subject.id}" />
                                `;
                                row.appendChild(passFailCell);

                                subjectsTableBody.appendChild(row);
                            });
                        })
                        .catch(error => {
                            console.error('Error fetching subjects:', error);
                            subjectsTableBody.innerHTML = '<tr><td colspan="3" class="text-center text-danger">Error loading subjects.</td></tr>';
                        });
                });
            });
        </script>
    </body>

    </html>
