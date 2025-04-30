<%@ include file="/static/components/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/add-student-form.css" />
<!-- Content Area -->
<div class="container-fluid mt-4">
    <div class="container form-container">
        <div class="card">
            <div class="card-header text-center">Student Details Form</div>
            <div class="card-body">
                <form action="savestudent" method="post">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Roll No.</label>
                                <input type="text" class="form-control" name="rollNo" placeholder="Enter Roll No" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Student Name</label>
                                <input type="text" class="form-control" name="studentName" placeholder="Enter Student Name" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Father Name</label>
                                <input type="text" class="form-control" name="fatherName" placeholder="Enter Father Name" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Caste</label>
                                <select class="form-select w-100" name="caste" required>
                                    <option value="" selected disabled>Select Caste</option>
                                    <option value="General">General</option>
                                    <option value="OBC">OBC</option>
                                    <option value="SC">SC</option>
                                    <option value="ST">ST</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Admission Year</label>
                                <input type="text" class="form-control" maxlength="4" name="admissionYear" placeholder="Enter Admission Year (e.g. 2023)">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Mobile No.</label>
                                <input type="tel" maxlength="10" class="form-control" name="mobileNo" placeholder="Enter Mobile No" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email Id</label>
                                <input type="email" class="form-control" name="email" placeholder="Enter Email Id" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Address</label>
                                <input type="text" class="form-control" name="address" placeholder="Enter Address" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Branch</label>
                                <select class="form-select w-100"  name="branch" required>
                                    <option value=""  selected disabled>Select Branch</option>
                                    <c:forEach var="branch" items="${branches}">
                                        <option value="${branch.id}">${branch.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Semester</label>
                                <select class="form-select w-100" name="semester" required>
                                    <option value=""  selected disabled>Select Semester</option>
                                    <c:forEach var="semester" items="${semesters}">
                                        <option value="${semester.id}">${semester.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="text-center">
                        <button type="reset" class="btn btn-secondary me-2">Reset</button>
                        <button type="submit" class="btn btn-primary">Submit</button>
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
