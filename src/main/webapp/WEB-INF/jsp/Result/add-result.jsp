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
<form action="/result" method="post">
    <c:if test="${result.student != null && result.student.branch != null}">
        <input type="hidden" id="branchId" value="${result.student.branch.id}" />
    </c:if>
    <div class="row">
        <div class="col-md-6">
            <div class="mb-3">
                <label for="studentRollNo" class="form-label">Student Roll No.:</label>
                <input type="text" readonly value="${result.student.rollNo}" class="form-control"
                    id="studentRollNo" placeholder="Student Roll No" >
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
                <select class="form-select form-control w-100" name="semester.id" id="semesterSelect" required>
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
                <c:forEach var="subject" items="${subjects}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td>${subject.name}</td>
                        <td>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio"
                                    name="subjectResults[${loop.index}].passed"
                                    id="pass-${subject.id}" value="true" required>
                                <label class="form-check-label" for="pass-${subject.id}">Pass</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio"
                                    name="subjectResults[${loop.index}].passed"
                                    id="fail-${subject.id}" value="false">
                                <label class="form-check-label" for="fail-${subject.id}">Fail</label>
                            </div>
                            <input type="hidden" name="subjectResults[${loop.index}].subject.id"
                                value="${subject.id}" />
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <button type="submit" class="btn btn-primary w-100">Add Result</button>
</form>

<script>
document.getElementById('semesterSelect').addEventListener('change', function() {
    const semesterId = this.value;
    const branchId = document.getElementById('branchId').value;
    console.log('Selected semesterId:', semesterId);
    console.log('Using branchId:', branchId);
    if (!semesterId || !branchId) {
        console.log('Missing semesterId or branchId, aborting fetch.');
        return;
    }
    fetch(`/result/subjects?branchId=${branchId}&semesterId=${semesterId}`)
        .then(response => {
            console.log('Fetch response status:', response.status);
            return response.json();
        })
        .then(subjects => {
            console.log('Subjects received:', subjects);
            const tbody = document.getElementById('subjectsTableBody');
            tbody.innerHTML = '';
            subjects.forEach((subject, index) => {
                const tr = document.createElement('tr');

                const tdIndex = document.createElement('td');
                tdIndex.textContent = index + 1;
                tr.appendChild(tdIndex);

                const tdName = document.createElement('td');
                tdName.textContent = subject.subjectName;
                tr.appendChild(tdName);

                const tdPassFail = document.createElement('td');

                const passDiv = document.createElement('div');
                passDiv.className = 'form-check form-check-inline';
                const passInput = document.createElement('input');
                passInput.className = 'form-check-input';
                passInput.type = 'radio';
                passInput.name = `subjectResults[${index}].passed`;
                passInput.id = `pass-${subject.id}`;
                passInput.value = 'true';
                passInput.required = true;
                const passLabel = document.createElement('label');
                passLabel.className = 'form-check-label';
                passLabel.htmlFor = `pass-${subject.id}`;
                passLabel.textContent = 'Pass';
                passDiv.appendChild(passInput);
                passDiv.appendChild(passLabel);

                const failDiv = document.createElement('div');
                failDiv.className = 'form-check form-check-inline';
                const failInput = document.createElement('input');
                failInput.className = 'form-check-input';
                failInput.type = 'radio';
                failInput.name = `subjectResults[${index}].passed`;
                failInput.id = `fail-${subject.id}`;
                failInput.value = 'false';
                const failLabel = document.createElement('label');
                failLabel.className = 'form-check-label';
                failLabel.htmlFor = `fail-${subject.id}`;
                failLabel.textContent = 'Fail';
                failDiv.appendChild(failInput);
                failDiv.appendChild(failLabel);

                tdPassFail.appendChild(passDiv);
                tdPassFail.appendChild(failDiv);

                const hiddenInput = document.createElement('input');
                hiddenInput.type = 'hidden';
                hiddenInput.name = `subjectResults[${index}].subject.id`;
                hiddenInput.value = subject.id;

                tdPassFail.appendChild(hiddenInput);

                tr.appendChild(tdPassFail);

                tbody.appendChild(tr);
            });
        })
        .catch(error => {
            console.error('Error fetching subjects:', error);
        });
});
</script>
            </div>
        </div>
    </body>

    </html>
