<%@ include file="/static/components/header-scholarship.jsp" %>
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card p-4 shadow">
                    <h2 class="text-center mb-4">Submit Application Details</h2>
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger" role="alert">
                            ${errorMessage}
                        </div>
                    </c:if>
                    <form id="applicationForm" action="save" method="post">
                        <input type="hidden" name="studentId"  value="${studentId}">
                        <div class="row mb-3">
                            <label for="appNo" class="col-sm-4 col-form-label">Application No.</label>
                            <div class="col-sm-8">
                                <input type="text" name="ApplicationNo" class="form-control" id="appNo" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="appType" class="col-sm-4 col-form-label">Application Type</label>
                            <div class="col-sm-8">
                                <select class="form-control" name="ApplicationType" id="status" required>
                                    <option value="" selected disabled>Select Application Type</option>
                                    <option value="Fresh">Fresh</option>
                                    <option value="Renewal">Renewal</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="academicYear" class="col-sm-4 col-form-label">Application Year</label>
                            <div class="col-sm-8">
                                <input type="text" name="AcademicYear" class="form-control" id="academicYear" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="scholarId" class="col-sm-4 col-form-label">Scholar Id</label>
                            <div class="col-sm-8">
                                <input type="text" name="ScholarId" class="form-control" id="scholarId" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="entitlement" class="col-sm-4 col-form-label">Entitlement Amount</label>
                            <div class="col-sm-8">
                                <input type="text" name="EntitlementAmount" class="form-control" id="entitlement" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="status" class="col-sm-4 col-form-label">Application Status</label>
                            <div class="col-sm-8">
                                <select class="form-control" name="applicationStatus" id="status" required>
                                    <option value="" selected disabled>Select Application Status</option>
                                    <option value="Approved">Approved</option>
                                    <option value="Hold">Hold</option>
                                    <option value="Payment Processed">Payment Processed</option>
                                    <option value="Pending">Pending</option>
                                    <option value="Rejected">Rejected</option>
                                    <option value="Sension">Sension</option>
                                    <option value="Submitted">Submitted</option>
                                </select>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
