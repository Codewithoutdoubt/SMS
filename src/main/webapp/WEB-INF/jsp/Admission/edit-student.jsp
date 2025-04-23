<%@ include file="/static/components/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/add-student-form.css" />
<!-- Content Area -->
<div class="container-fluid mt-3">
    <div class="container form-container">
        <div class="card">
            <div class="card-header text-center">Edit Student Details Form</div>
            <div class="card-body">
                <form action="updatestudent" method="post">
                    <input type="hidden" name="id" value="${student.id}" />
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Roll No.</label>
                                <input type="text" class="form-control" name="rollNo" placeholder="Enter Roll No" value="${student.rollNo}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Student Name</label>
                                <input type="text" class="form-control" name="studentName" placeholder="Enter Student Name" value="${student.studentName}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Father Name</label>
                                <input type="text" class="form-control" name="fatherName" placeholder="Enter Father Name" value="${student.fatherName}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Caste</label>
                                <select class="form-select w-100" name="caste" required>
                                    <option value="" disabled>Select Caste</option>
                                    <option value="General" ${student.caste == 'General' ? 'selected' : ''}>General</option>
                                    <option value="OBC" ${student.caste == 'OBC' ? 'selected' : ''}>OBC</option>
                                    <option value="SC" ${student.caste == 'SC' ? 'selected' : ''}>SC</option>
                                    <option value="ST" ${student.caste == 'ST' ? 'selected' : ''}>ST</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Admission Year</label>
                                <input type="text" class="form-control" maxlength="4" name="admissionYear" placeholder="Enter Admission Year (e.g. 2023)" value="${student.admissionYear}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Mobile No.</label>
                                <input type="tel" class="form-control" maxlength="10" name="mobileNo" placeholder="Enter Mobile No" value="${student.mobileNo}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email Id</label>
                                <input type="email" class="form-control" name="email" placeholder="Enter Email Id" value="${student.email}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Address</label>
                                <input type="text" class="form-control" name="address" placeholder="Enter Address" value="${student.address}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Branch</label>
                                <select class="form-select w-100" name="branchId" required>
                                    <option value="" disabled>Select Branch</option>
                                    <c:forEach var="branch" items="${branches}">
                                        <option value="${branch.id}" ${branch.id == student.branch.id ? 'selected' : ''}>${branch.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Semester</label>
                                <select class="form-select w-100" name="semesterId" required>
                                    <option value="" disabled>Select Semester</option>
                                    <c:forEach var="semester" items="${semesters}">
                                        <option value="${semester.id}" ${semester.id == student.semester.id ? 'selected' : ''}>${semester.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="text-center">
                        <button type="reset" class="btn btn-secondary me-2">Reset</button>
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Sidebar Toggle Script -->
<script>
    function toggleSidebar() {
        document.body.classList.toggle("collapsed");
    }
</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
