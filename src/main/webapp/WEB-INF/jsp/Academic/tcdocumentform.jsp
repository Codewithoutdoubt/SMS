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
    <hr>
    <form action="/academic/tc/submit" method="post">
        <input type="hidden" name="student.id" value="${student.id}" />
        <c:if test="${not empty tc.id}">
            <input type="hidden" name="id" value="${tc.id}" />
        </c:if>
        <div class="mb-3">
            <label for="StudentRollNo" class="form-label">Roll Number</label>
            <input type="text" class="form-control" id="tcCertificateNo" name="rollNo" placeholder="Student Roll No." readonly value="${student.rollNo}" required>
        </div>
        <div class="mb-3">
            <label for="tcCertificateNo" class="form-label">TC Certificate Number</label>
            <input type="text" class="form-control" id="tcCertificateNo" name="tcCertificateNo" placeholder="Enter TC Certificate Number" value="${tc.tcCertificateNo}" required>
        </div>
        <div class="mb-3">
            <label for="migrationCertificateNo" class="form-label">Migration Certificate Number</label>
            <input type="text" class="form-control" id="migrationCertificateNo" name="migrationCertificateNo" placeholder="Enter Migration Certificate Number" value="${tc.migrationCertificateNo}" required>
        </div>
        <div class="mb-3">
            <label for="diplomaCertificateNo" class="form-label">Diploma Certificate Number</label>
            <input type="text" class="form-control" id="diplomaCertificateNo" name="diplomaCertificateNo" placeholder="Enter Diploma Certificate Number" value="${tc.diplomaCertificateNo}" required>
        </div>
        <button type="submit" class="btn btn-primary">Submit TC Details</button>
    </form>
</div>

</body>
</html>
