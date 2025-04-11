<%@ include file="/static/components/header.jsp" %>

    <div class="container-fluid">
        <div class="row">
            <nav class="col-md-3 col-lg-2 d-md-block bg-light p-3"></nav>
                <!-- Sidebar -->
                <%@ include file="/static/components/sidebar.jsp" %>
            <!-- Main Content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="text-center mt-4">Scholarship Details</h2>
                    <div class="search-box">
                        <form id="searchForm" class="d-flex">
                            <input type="text" id="rollNoSearch" class="form-control" placeholder="Search by Roll Number">
                            <button type="submit" class="btn btn-primary ms-2">Search</button>
                        </form>
                    </div>
                </div>

                <!-- Scholarship Table -->
                <div class="card p-4">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Sr. No</th>
                                <th>Name</th>
                                <th>Roll Number</th>
                                <th>Branch</th>
                                <th>Semester</th>
                                <th>Application No.</th>
                                <th>Academic Year</th>
                                <th>Status</th>
                                <th>Amount</th>
                            </tr>
                        </thead>
                        <tbody id="scholarship-table">
                            <c:forEach var="scholarship" items="${scholarships}" varStatus="loop">
                                <tr style="display: none;">
                                    <td>${loop.index + 1}</td>
                                    <td>${scholarship.student.studentName}</td>
                                    <td>${scholarship.student.rollNo}</td>
                                    <td>${scholarship.student.branch.code}</td>
                                    <td>${scholarship.student.semester.name}</td>
                                    <td>${scholarship.applicationNo}</td>
                                    <td>${scholarship.academicYear}</td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <span class="badge rounded-pill 
                                                ${scholarship.applicationStatus == 'Approved' ? 'bg-success' : 
                                                  scholarship.applicationStatus == 'Payment Processed' ? 'bg-primary' :
                                                  scholarship.applicationStatus == 'Hold' ? 'bg-secondary' :
                                                  scholarship.applicationStatus == 'Sension' ? 'bg-info text-dark' :
                                                  scholarship.applicationStatus == 'Submitted' ? 'bg-light text-dark' :
                                                  scholarship.applicationStatus == 'Pending' ? 'bg-warning text-dark' : 'bg-danger'} 
                                                p-2" style="min-width: 120px; font-size: 0.85rem; box-shadow: 0 2px 4px rgba(0,0,0,0.1);">
                                                <c:choose>
                                                    <c:when test="${scholarship.applicationStatus == 'Approved'}">
                                                        <i class="bi bi-check-circle-fill me-1"></i> Approved
                                                    </c:when>
                                                    <c:when test="${scholarship.applicationStatus == 'Payment Processed'}">
                                                        <i class="bi bi-currency-dollar me-1"></i> Payment Processed
                                                    </c:when>
                                                    <c:when test="${scholarship.applicationStatus == 'Hold'}">
                                                        <i class="bi bi-pause-fill me-1"></i> Hold
                                                    </c:when>
                                                    <c:when test="${scholarship.applicationStatus == 'Sension'}">
                                                        <i class="bi bi-exclamation-triangle-fill me-1"></i> Sension
                                                    </c:when>
                                                    <c:when test="${scholarship.applicationStatus == 'Submitted'}">
                                                        <i class="bi bi-send-fill me-1"></i> Submitted
                                                    </c:when>
                                                    <c:when test="${scholarship.applicationStatus == 'Pending'}">
                                                        <i class="bi bi-hourglass-split me-1"></i> Pending
                                                    </c:when>
                                                    <c:otherwise>
                                                        <i class="bi bi-x-circle-fill me-1"></i> Rejected
                                                    </c:otherwise>
                                                </c:choose>
                                            </span>
                                        </div>
                                    </td>
                                    <td>${scholarship.entitlementAmount}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <script>
                        document.getElementById('searchForm').addEventListener('submit', function(e) {
                            e.preventDefault();
                            const rollNo = document.getElementById('rollNoSearch').value.trim().toLowerCase();
                            const rows = document.querySelectorAll('#scholarship-table tr');
                            
                            if (rollNo === '') {
                                // If search is empty, keep all rows hidden
                                rows.forEach(row => row.style.display = 'none');
                                return;
                            }
                            
                            let found = false;
                            rows.forEach(row => {
                                const rowRollNo = row.cells[2].textContent.toLowerCase();
                                if (rowRollNo.includes(rollNo)) {
                                    row.style.display = '';
                                    found = true;
                                } else {
                                    row.style.display = 'none';
                                }
                            });
                            
                            if (!found) {
                                alert('No scholarships found for roll number: ' + rollNo);
                            }
                        });
                    </script>
                </div>
            </main>
        </div>
    </div>

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>