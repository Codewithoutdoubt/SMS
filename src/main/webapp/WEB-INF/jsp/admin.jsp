<%@ include file="/static/components/header.jsp" %>
    <!-- Sidebar -->
    <div class="row">
        <div class="col-md-2 sidebar">
            <%@ include file="/static/components/sidebar.jsp" %>
        </div>
        <div class="col-md-10">
    <h2>Student Dashboard</h2>
    <div class="mb-3">
        <label for="filter" class="form-label">Filter Students:</label>
        <input type="text" class="form-control" id="filter" placeholder="Enter roll number..." onkeyup="fetchFilteredStudents()">
    </div>
    <div class="mb-3">
        <label for="branch" class="form-label">Branch:</label>
        <select class="form-control" id="branch" onchange="fetchFilteredStudents()">
            <option value="">Select Branch</option>
            <!-- Options will be populated here -->
        </select>
    </div>
    <div class="mb-3">
        <label for="semester" class="form-label">Semester:</label>
        <select class="form-control" id="semester" onchange="fetchFilteredStudents()">
            <option value="">Select Semester</option>
            <!-- Options will be populated here -->
        </select>
    </div>
    <div class="table-responsive student-table">
        <table class="table table-bordered table-striped table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>Sr.</th>
                    <th>Roll No.</th>
                    <th>Student Name</th>
                    <th>Father Name</th>
                    <th>Caste</th>
                    <th>Mobile No.</th>
                    <th>Branch</th>
                    <th>Semester</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${students}" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td>${student.rollNo}</td>
                                    <td>${student.studentName}</td>
                                    <td>${student.fatherName}</td>
                                    <td>${student.caste}</td>
                                    <td>${student.mobileNo}</td>
                                    <td>${student.branch.code}</td>
                                    <td>${student.semester.name}</td>
                                    <td>
                                        <a href="deletestudent?id=${student.id}" class="btn btn-danger btn-sm">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script>
    function toggleSidebar() {
        document.body.classList.toggle("collapsed");
    }

    function fetchFilteredStudents() {
        const filter = document.getElementById('filter').value;
        const branch = document.getElementById('branch').value;
        const semester = document.getElementById('semester').value;
        fetch(`/students?branchCode=${branch}&semester=${semester}&cast=&status=&filter=${filter}`)
            .then(response => response.json())
            .then(data => {
                const tableBody = document.querySelector('.student-table tbody');
                tableBody.innerHTML = ''; // Clear existing rows
                data.forEach((student, index) => {
                    const row = `<tr>
                                    <td>${index + 1}</td>
                                    <td>${student.rollNo}</td>
                                    <td>${student.studentName}</td>
                                    <td>${student.fatherName}</td>
                                    <td>${student.caste}</td>
                                    <td>${student.mobileNo}</td>
                                    <td>${student.branch.code}</td>
                                    <td>${student.semester.name}</td>
                                    <td>
                                        <a href="deletestudent?id=${student.id}" class="btn btn-danger btn-sm">Delete</a>
                                    </td>
                                </tr>`;
                    tableBody.innerHTML += row;
                });
            })
            .catch(error => console.error('Error fetching filtered students:', error));
    }

    function populateDropdowns() {
        // Fetch branches
        fetch('/branches')
            .then(response => response.json())
            .then(branches => {
                const branchSelect = document.getElementById('branch');
                branches.forEach(branch => {
                    const option = document.createElement('option');
                    option.value = branch.code; // Assuming branch has a 'code' property
                    option.textContent = branch.name; // Assuming branch has a 'name' property
                    branchSelect.appendChild(option);
                });
            })
            .catch(error => console.error('Error fetching branches:', error));

        // Fetch semesters
        fetch('/semesters')
            .then(response => response.json())
            .then(semesters => {
                const semesterSelect = document.getElementById('semester');
                semesters.forEach(semester => {
                    const option = document.createElement('option');
                    option.value = semester.name; // Assuming semester has a 'name' property
                    option.textContent = semester.name; // Assuming semester has a 'name' property
                    semesterSelect.appendChild(option);
                });
            })
            .catch(error => console.error('Error fetching semesters:', error));
    }

    // Call populateDropdowns on page load
    window.onload = populateDropdowns;
</script>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
