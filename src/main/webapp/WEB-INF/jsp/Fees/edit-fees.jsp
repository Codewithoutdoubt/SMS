<%@ include file="/static/components/header.jsp" %>

<!-- Content Area -->
<div class="container d-flex justify-content-center mt-5">
    <div class="shadow p-4" style="max-width: 700px; width: 100%;">
        <h2 class="text-center">Edit Fees</h2>
        <hr style="border: solid 1px; margin-bottom: 0px;">
        <form action="/fees/update/${fee.id}" method="post" class="p-4 rounded">
            <input type="hidden" name="studentId" value="${fee.student.id}" />
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="year" class="form-label d-block">Year</label>
                    <select class="form-control form-select-lg" name="year" id="year" required>
                        <option value="" disabled>Select one</option>
                        <option value="1st Year" ${fee.year == "1st Year" ? 'selected' : ''}>1st Year</option>
                        <option value="2nd Year" ${fee.year == "2nd Year" ? 'selected' : ''}>2nd Year</option>
                        <option value="3rd Year" ${fee.year == "3rd Year" ? 'selected' : ''}>3rd Year</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label for="date" class="form-label">Date:</label>
                    <input type="date" class="form-control" id="date" name="date" value="${fee.date}" required>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="feeReceiptNo" class="form-label">Receipt No. :</label>
                    <input type="text" class="form-control" id="feeReceiptNo" name="feeReceiptNo" value="${fee.feeReceiptNo}" required>
                </div>
                <div class="col-md-6">
                    <label for="amount" class="form-label">Amount:</label>
                    <input type="text" class="form-control" id="amount" name="amount" value="${fee.amount}" required>
                </div>
            </div>
            <div class="mb-3">
                <label for="feeType" class="form-label d-block">Fee Type:</label>
                <select class="form-control form-select-lg" name="feeType" id="feeType" required>
                    <option value="" disabled>Select one</option>
                    <option value="Admissin Fees" ${fee.feeType == 'Admissin Fees' ? 'selected' : ''}>Admissin Fees</option>
                    <option value="Exam Fees" ${fee.feeType == 'Exam Fees' ? 'selected' : ''}>Exam Fees</option>
                </select>
            </div>
            <div class="mt-1">
                <button type="submit" class="btn btn-primary p-2 w-100">Save</button>
                <button type="reset" class="d-block w-100 btn-secondary p-2 mt-2">Reset</button>
            </div>
        </form>
    </div>

    <!-- Sidebar Toggle Script -->
    <script>
        function toggleSidebar() {
            document.body.classList.toggle("collapsed");
        }
    </script>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</div>
