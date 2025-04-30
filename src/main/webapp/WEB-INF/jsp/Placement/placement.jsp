<%@ include file="/static/components/header.jsp" %>
    <!-- Sidebar -->
    <div class="container-fluid mt-5">
        <div class="row justify-content-between">
            <div class="col-lg-3">
                <h2 class="text-center font-weight-bold mx-2" style="text-align: left !important;">Student List</h2>
            </div>
            <div class="col-lg-9 pt-3 filter">
                <form id="filter-form" class="d-flex filter-section" method="get" action="/filter/Placement/placement">
                    <%@ include file="/static/components/filter.jsp" %>
            </div>
        </div>
        <!-- Main Content -->
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
                            <th>Company Name</th>
                            <th>Package</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="sp" items="${studentPlacements}">
                            <tr>
                                <td>${sp.student.id}</td>
                                <td>${sp.student.rollNo}</td>
                                <td>${sp.student.studentName}</td>
                                <td>${sp.student.mobileNo}</td>
                                <td>${sp.student.branch.name}</td>
                                <td>${sp.student.semester.name}</td>
                                <td>${sp.student.admissionYear}</td>
                                <td>${sp.companyName}</td>
                                <td>${sp.packageAmount}</td>

                                <td class="d-flex mb-1">
                                    <a href="/placement/${sp.student.id}"
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


    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const dropdown = document.querySelector('select[name="academicYear"]');
            if (!dropdown) return;
            const seen = new Set();
            for (let i = dropdown.options.length - 1; i >= 0; i--) {
                const option = dropdown.options[i];
                if (option.value !== "" && seen.has(option.value)) {
                    dropdown.remove(i);
                } else {
                    seen.add(option.value);
                }
            }
        });

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