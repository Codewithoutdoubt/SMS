<%@ include file="/static/components/header.jsp" %>

        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-8 mt-5">
                    <div class="card p-4 shadow">
                        <h2 class="text-center mb-4">Document Upload Details</h2>

                        <form action="/documents/save" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="studentId" value="${students.id}" />
                            <div class="row mb-3">
                                <label for="profileImage" class="col-sm-4 col-form-label">Profile Image</label>
                                <div class="col-sm-8">
                                    <input type="file" class="form-control " id="profileImage" name="profileImage" accept="image/*" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="aadharNo" class="col-sm-4 col-form-label">Aadhar No.</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="aadharNo" maxlength="12" name="aadharNo"
                                            placeholder="Enter Aadhar No." required>
                                        <input type="file" class="form-control ml-3" id="aadharImage" name="aadharImage" accept="image/*" style="width: 40px;">
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="10thMarksheet" class="col-sm-4 col-form-label">10th Marksheet</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="10thMarksheetNo"
                                            name="10thMarksheetNo" placeholder="Enter 10th Marksheet No." required>
                                        <input type="file" class="form-control ml-3" id="10thMarksheetImage" name="10thMarksheetImage" accept="image/*" style="width: 40px;">
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="12thMarksheet" class="col-sm-4 col-form-label">12th Marksheet</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="12thMarksheetNo"
                                            name="12thMarksheetNo" placeholder="Enter 12th Marksheet No." required>
                                        <input type="file" class="form-control ml-3" id="12thMarksheetImage" name="12thMarksheetImage" accept="image/*" style="width: 40px;">
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="aadharNo" class="col-sm-4 col-form-label">Transfer Certificate</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="transferCertificate"
                                            name="transferCertificate" placeholder="Enter Transfer Certificate No." required>
                                        <input type="file" class="form-control ml-3" id="transferCertificateImage" name="transferCertificateImage" accept="image/*" style="width: 40px;">
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="casteCertificate" class="col-sm-4 col-form-label">Caste Certificate No.</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="casteCertificate"
                                            name="casteCertificateNo" placeholder="Enter Caste Certificate No." required>
                                        <input type="file" class="form-control ml-3" id="casteCertificateImage" name="casteCertificateImage" accept="image/*" style="width: 40px;">
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="incomeCertificateNo" class="col-sm-4 col-form-label">Income Certificate No.</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="incomeCertificate"
                                            name="incomeCertificateNo" placeholder="Enter Income Certificate No." required>
                                        <input type="file" class="form-control ml-3" id="incomeCertificateImage" name="incomeCertificateImage" accept="image/*" style="width: 40px;">
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="residenceCertificateNo" class="col-sm-4 col-form-label">Residence Certificate No.</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="residenceCertificate"
                                            name="residenceCertificateNo" placeholder="Enter Residence Certificate No."
                                            required>
                                        <input type="file" class="form-control ml-3" id="residenceCertificateImage" name="residenceCertificateImage" accept="image/*" style="width: 40px;">
                                    </div>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary w-100">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            document.getElementById('sameAsProfile').addEventListener('change', function () {
                var profileImage = document.getElementById('profileImage');
                var aadharImage = document.getElementById('aadharImage');
                var casteCertificateImage = document.getElementById('casteCertificateImage');
                var incomeCertificateImage = document.getElementById('incomeCertificateImage');
                var residenceCertificateImage = document.getElementById('residenceCertificateImage');

                if (this.checked) {
                    if (profileImage.files.length > 0) {
                        var file = profileImage.files[0];
                        var fileList = new DataTransfer();
                        fileList.items.add(file);

                        aadharImage.files = fileList.files;
                        casteCertificateImage.files = fileList.files;
                        incomeCertificateImage.files = fileList.files;
                        residenceCertificateImage.files = fileList.files;
                    }
                } else {
                    aadharImage.value = '';
                    casteCertificateImage.value = '';
                    incomeCertificateImage.value = '';
                    residenceCertificateImage.value = '';
                }
            });
        </script>
    </body>

    </html>

