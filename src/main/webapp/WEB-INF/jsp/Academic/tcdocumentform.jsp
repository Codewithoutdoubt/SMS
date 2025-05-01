<%@ include file="/static/components/header.jsp" %>

<style>
    body {
        background: #f8f9fa;
    }
    .form-container {
        
        background: white;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        margin-top: 5%;
        max-width: 600px;
        margin-left: auto;
        margin-right: auto;
    }
    h2 {
        color: #007bff;
        font-weight: 700;
        margin-bottom: 30px;
        text-align: center;
    }
    .form-label {
        font-weight: 600;
        color: #495057;
    }
    .btn-primary {
        background-color: #007bff;
        border: none;
        padding: 10px 25px;
        font-size: 16px;
        border-radius: 8px;
        transition: background-color 0.3s ease;
        width: 100%;
    }
    .btn-primary:hover {
        background-color: #0056b3;
    }
</style>

<div class="form-container">
    <h2>Submit TC Document Details</h2>
    <form action="/academic/tc/submit" method="post">
        <input type="hidden" name="student.id" value="${param.studentId}" />
        <div class="mb-3">
            <label for="tcCertificateNo" class="form-label">TC Certificate Number</label>
            <input type="text" class="form-control" id="tcCertificateNo" name="tcCertificateNo" placeholder="Enter TC Certificate Number" required>
        </div>
        <div class="mb-3">
            <label for="migrationCertificateNo" class="form-label">Migration Certificate Number</label>
            <input type="text" class="form-control" id="migrationCertificateNo" name="migrationCertificateNo" placeholder="Enter Migration Certificate Number" required>
        </div>
        <div class="mb-3">
            <label for="diplomaCertificateNo" class="form-label">Diploma Certificate Number</label>
            <input type="text" class="form-control" id="diplomaCertificateNo" name="diplomaCertificateNo" placeholder="Enter Diploma Certificate Number" required>
        </div>
        <button type="submit" class="btn btn-primary">Submit TC Details</button>
    </form>
</div>

</body>
</html>
