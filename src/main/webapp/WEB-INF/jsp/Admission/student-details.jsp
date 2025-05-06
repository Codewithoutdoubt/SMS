<%@ include file="/static/components/header.jsp" %>
  <div class="container-sd">
    <div class="student-info">
      <div class="d-flex justify-content-between">
      <h2 class="text-center font-weight-bold">Student Details</h2>
      <form action="/editstudent?id=${student.id}" method="get" class="mt-2 mr-1">
        <input type="hidden" name="studentId" value="${student.id}">
        <button type="submit" class="btn btn-primary btn-sm me-2 font-weight-bold" style="font-size: 18px;">Edit</button>
    </form>
  </div>
      <div class="info-grid">
        <div class="info-item">
          <div class="info-label">Name</div>
          <div class="info-value">${student.studentName}</div>
        </div>
        <div class="info-item">
          <div class="info-label">Roll Number</div>
          <div class="info-value">${student.rollNo}</div>
        </div>
        <div class="info-item">
          <div class="info-label">Caste</div>
          <div class="info-value">${student.caste}</div>
        </div>
        <div class="info-item">
          <div class="info-label">Admission Year</div>
          <div class="info-value">${student.admissionYear}</div>
        </div>
        <div class="info-item">
          <div class="info-label">Mobile No</div>
          <div class="info-value">${student.mobileNo}</div>
        </div>
        <div class="info-item">
          <div class="info-label">Email Id</div>
          <div class="info-value">${student.email}</div>
        </div>
        <div class="info-item">
          <div class="info-label">Semester</div>
          <div class="info-value">${student.semester.name}</div>
        </div>
        <div class="info-item">
          <div class="info-label">Branch</div>
          <div class="info-value">${student.branch.name}</div>
        </div>
        <div class="info-item">
          <div class="info-label">Address</div>
          <div class="info-value">${student.address}</div>
        </div>
      </div>
    </div>

    <h2>Document Details</h2>
    <table class="document-table">
      <thead>
        <tr>
          <th>S.No</th>
          <th>Document Name</th>
          <th>Document Number</th>
        </tr>
      </thead>
      <tbody>
        <c:if test="${not empty documents}">
          <tr>
            <td>1</td>
            <td>Aadhar Card</td>
            <td>${documents.aadharNo}</td>
          </tr>
          <tr>
            <td>2</td>
            <td>Caste Certificate</td>
            <td>${documents.casteCertificateNo}</td>
          </tr>
          <tr>
            <td>3</td>
            <td>Income Certificate</td>
            <td>${documents.incomeCertificateNo}</td>
          </tr>
          <tr>
            <td>4</td>
            <td>Residence Certificate</td>
            <td>${documents.residenceCertificateNo}</td>
          </tr>
        </c:if>
        <c:if test="${empty documents}">
          <tr>
            <td colspan="3">No documents found for this student.</td>
          </tr>
        </c:if>
      </tbody>
    </table>
  </div>
</body>
</html>
