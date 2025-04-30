<%@ include file="/static/components/header.jsp" %>
    <!-- Sidebar -->
    <div class="row">
        <div class="col-md-2 col-lg-2  sidebar">
            <h4 class="text-center">${department.name}</h4>
            <hr>
            <form id="filter-form" class="ml-3" method="get" action="/filter/Fees/fees">
                <h4 class="text-left pt-0">Filter Data</h4>
                <%@ include file="/static/components/department-filter.jsp" %>
                    <button type="reset" class="btn btn-primary h-75 w-100 ftr mt-3"><a class="p-0 text-center d-block"
                            href="/fees">Reset</a></button>
            </form>
        </div>
    </div>
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-1">    
                <!-- Student Table -->
                    <h2 class="font-weight-bold mt-3">Student List</h2>
                <div class="card">
                    <table class="students-table p-3 table table-striped student-table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Roll Number</th>
                                <th>Name</th>
                                <th>Mobile No</th>
                                <th>Branch Name</th>
                                <th>Semester</th>
                                <th style="width: 35px;">Admission Year</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="student" items="${students}">
                                <tr style="padding: 0px !important;">
                                    <td>${student.id}</td>
                                    <td>${student.rollNo}</td>
                                    <td>${student.studentName}</td>
                                    <td>${student.mobileNo}</td>
                                    <td>${student.branch.name}</td>
                                    <td>${student.semester.name}</td>
                                    <td>${student.admissionYear}</td>
                                    <td class="d-flex mb-1">

                                        <a href="fees/${student.id}"
                                            class="btn btn-primary mt-0  h-50 ml-2 btn-sm">View</a>
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

        // Check for error message from controller
        const errorMessage = '${error}'; // Assuming error is passed from controller
        if (errorMessage && errorMessage.trim() !== '') {
            alert(errorMessage);
        }

    </script>
    </body>

    </html>