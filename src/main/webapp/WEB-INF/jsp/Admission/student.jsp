n  <%@ include file="/static/components/header.jsp" %>
    <!-- Sidebar -->
    <div class="row">
        <div class="col-md-2 sidebar">
            <h4 class="text-center">Admission Department</h4>
            <hr>
            <form id="filter-form" class="filter-section" method="get" action="/filter/Admission/student">
                <h4 class="text-left pt-0">Filter Data</h4>
                <%@ include file="/static/components/department-filter.jsp" %>
                    <button type="reset" class="btn btn-primary h-75 w-100 ftr mt-3"><a class="p-0 text-center d-block"
                            href="/admission">Reset</a></button>
        </div>
        </form>
    </div>
    <div class="col-md-10 col-lg-10">
        <div class="container-fluid">
            <!-- Main Content -->
            <main class="px-md-1">
                <!-- Student Table -->
                 <div class="d-flex justify-content-between">
                    <h2 class="text-center font-weight-bold">Student List</h2>
                    <button type="button" class="btn btn-primary my-2" data-bs-toggle="modal"
                    data-bs-target="#addStudentModal">
                    <a href="/addstudent">Add Student</a>
                    </button>
                 </div>
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
                                        <a href="editstudent?id=${student.id}" class="btn btn-primary btn-sm me-2">Edit</a>
                                        <a href="deletestudent?id=${student.id}"
                                            class="btn btn-danger btn-sm">Delete</a>
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