<%@ include file="/static/components/header-fees.jsp" %>

    <!-- Content Area -->
    <div class="container d-flex justify-content-center mt-5">
        <div class="shadow p-4" style="max-width: 700px; width: 100%;">
            <h2 class="text-center">Add Fees</h2>
            <hr style="border: solid 1px; margin-bottom: 0px;">
            <form action="/fees" method="post" class="p-4 rounded ">
                <div class="row mb-3">
                    <div class="col-md-6">
                        <input type="hidden" name="student.id" value="${student.id}">
                        <label for="" class="form-label d-block">Year</label>
                        <select class="form-control form-select-lg" name="year" id="" required>
                            <option value="" selected disabled>Select one</option>
                            <option value="1st Year">1st Year</option>
                            <option value="2nd Year">2nd Year</option>
                            <option value="3rd Year">3rd Year</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label for="date" class="form-label">Date:</label>
                        <input type="date" class="form-control" id="date" name="date" placeholder="Enter Date" required>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="feeReceiptNo" class="form-label">Receipt No. :</label>
                        <input type="text" class="form-control" id="feeReceiptNo" name="feeReceiptNo"
                            placeholder="Enter Receipt no." required>
                    </div>
                    <div class="col-md-6">
                        <label for="amount" class="form-label">Amount:</label>
                        <input type="text" class="form-control" id="amount" name="amount" placeholder="Enter Amount"
                            required>
                    </div>
                </div>
                <div class="mb-3">
                    <div class="mb-3">
                        <label for="feeType" class="form-label d-block">Fee Type:</label>
                        <select class="form-control form-select-lg" name="feeType" id="" required>
                            <option value="" selected disabled>Select one</option>
                            <option value="Admissin Fees">Admissin Fees</option>
                            <option value="Exam Fees">Exam Fees</option>
                        </select>
                    </div>

                </div>
                <div class="mt-1">
                    <button type="submit" class="btn btn-primary p-2 w-100">Submit</button>
                    <button type="reset" class=" d-block w-100 btn-secondary p-2 mt-2">Reset</button>
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

        </body>

        </html>