<%@ include file="/static/components/header.jsp" %>

        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-8 mt-5">
                    <div class="card p-4 shadow">
                        <h2 class="text-center mb-4">Document Upload Details</h2>

                        <!-- ✅ Fixed Form -->
                        <form action="/documents/save" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="studentId" value="${students.id}" />
                            <div class="row mb-3">
                                <label for="aadharNo" class="col-sm-4 col-form-label">Profile id :</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="aadharNo" name="profileId"
                                        placeholder="Enter Profile Id" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="aadharNo" class="col-sm-4 col-form-label">Aadhar No.</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="aadharNo" maxlength="12" name="aadharNo"
                                        placeholder="Enter Aadhar No." required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="casteCertificate" class="col-sm-4 col-form-label">Caste Certificate
                                    No.</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="casteCertificate"
                                        name="casteCertificateNo" placeholder="Enter Caste Certificate No." required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="incomeCertificateNo" class="col-sm-4 col-form-label">Income Certificate
                                    No.</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="incomeCertificate"
                                        name="incomeCertificateNo" placeholder="Enter Income Certificate No." required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="residenceCertificateNo" class="col-sm-4 col-form-label">Residence
                                    Certificate No.</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="residenceCertificate"
                                        name="residenceCertificateNo" placeholder="Enter Residence Certificate No."
                                        required>
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
