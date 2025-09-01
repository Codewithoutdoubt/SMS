<%@ include file="/static/components/header.jsp" %>
    <div class="document-form-container">
        <div class="document-form-card">
            <h2 class="document-form-title">Edit Document Details</h2>
            <form id="documentForm" method="post" action="/documents/update-document" class="document-form">
                        <input type="hidden" name="documentId" value="${document.id}">
                        <input type="hidden" name="studentId" value="${document.student.id}">
                        <div class="row mb-3">
                            <label for="aadharNo" class="col-sm-4 col-form-label">Aadhar No.</label>
                            <div class="col-sm-8">
                                <input type="text" value="${document.aadharNo}" maxlength="12" class="form-control" name="aadharNo"
                                    placeholder="Enter Aadhar No." required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="casteCertificate" class="col-sm-4 col-form-label">Caste Certificate No.</label>
                            <div class="col-sm-8">
                                <input type="text" value="${document.casteCertificateNo}" class="form-control"
                                    name="casteCertificateNo" placeholder="Enter Caste Certificate No." required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="incomeCertificate" class="col-sm-4 col-form-label">Income Certificate
                                No.</label>
                            <div class="col-sm-8">
                                <input type="text" value="${document.incomeCertificateNo}" class="form-control"
                                    name="incomeCertificateNo" placeholder="Enter Income Certificate No." required>
                            </div>
                        </div>
                                                <div class="row mb-3">
                            <label for="residenceCertificate" class="col-sm-4 col-form-label">Residence Certificate
                                No.</label>
                            <div class="col-sm-8">
                                <input type="text" value="${document.residenceCertificateNo}" class="form-control"
                                    name="residenceCertificateNo" placeholder="Enter Residence Certificate No." required>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="tenthMarksheetNo" class="col-sm-4 col-form-label">10th Marksheet No.</label>
                            <div class="col-sm-8">
                                <input type="text" value="${document.tenthMarksheetNo}" class="form-control"
                                    name="tenthMarksheetNo" placeholder="Enter 10th Marksheet No." required>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="twelfthMarksheetNo" class="col-sm-4 col-form-label">12th Marksheet No.</label>
                            <div class="col-sm-8">
                                <input type="text" value="${document.twelfthMarksheetNo}" class="form-control"
                                    name="twelfthMarksheetNo" placeholder="Enter 12th Marksheet No." required>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="transferCertificateNo" class="col-sm-4 col-form-label">Transfer Certificate
                                No.</label>
                            <div class="col-sm-8">
                                <input type="text" value="${document.transferCertificateNo}" class="form-control"
                                    name="transferCertificateNo" placeholder="Enter Transfer Certificate No." required>
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
