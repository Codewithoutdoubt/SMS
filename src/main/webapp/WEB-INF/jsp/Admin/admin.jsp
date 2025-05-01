<%@ include file="/static/components/header.jsp" %>
    <!-- Sidebar -->
    <div class="row">
        <div class="col-md-2 col-lg-2 sidebar">
            <%@ include file="/static/components/sidebar.jsp" %>
            
        </div>
                <!-- Main Content -->
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-2">
                    <div class="row justify-content-between">
                        <div class="col-lg-3">
                            <h2>Student Dashboard</h2>
                        </div>
                        <div class="col-lg-9 pt-3 px-5">
                            <form id="filter-form" class="d-flex filter-section" method="get"
                                action="/filter/Admin/admin">
                                <%@ include file="/static/components/filter.jsp" %>
                        </div>
                        </div>

                        <!-- Student Table -->
                        <div class="card">
                            <table class="table table-striped student-table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Roll Number</th>
                                        <th>Name</th>
                                        <th>Mobile No</th>
                                        <th>Branch Name</th>
                                        <th>Semester</th>
                                        <th>Admission Year</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="student" items="${students}">
                                        <tr>
                                            <td>${student.id}</td>
                                            <td>${student.rollNo}</td>
                                            <td>${student.studentName}</td>
                                            <td>${student.mobileNo}</td>
                                            <td>${student.branch.name}</td>
                                            <td>${student.semester.name}</td>
                                            <td>${student.admissionYear}</td>
                                            <td>
                                                <a href="/report/${student.id}" class="btn btn-danger btn-sm">View
                                                    Report</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                </main>
            </div>
        </div>
    </div>

    <script>
        function toggleSidebar() {
            document.body.classList.toggle("collapsed");
        }

        function fetchFilteredStudents() {
            const branch = document.querySelector('select[name="branchCode"]').value;
            const semester = document.querySelector('select[name="semester"]').value;
            fetch(`/students?branchCode=${branch}&semester=${semester}`)
                .then(response => response.json())
                .then(data => {
                    const tableBody = document.querySelector('.student-table tbody');
                    tableBody.innerHTML = ''; // Clear existing rows
                    data.forEach((student, index) => {
                        const row = `<tr>
                                <td>${index + 1}</td>
                                <td>${student.rollNo}</td>
                                <td>${student.studentName}</td>
                                <td>${student.mobileNo}</td>
                                <td>${student.branch.code}</td>
                                <td>${student.semester.name}</td>
                                <td>${student.admissionYear}</td>
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
                    const branchSelect = document.querySelector('select[name="branchCode"]');
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
                    const semesterSelect = document.querySelector('select[name="semester"]');
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
    </body>

    </html>