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
      
      <!-- Profile Image Section - Enhanced -->
      <div class="profile-section">
        <div class="profile-image-container">
          <div class="profile-image-wrapper">
            <c:if test="${not empty documents.profileImage}">
              <img src="${pageContext.request.contextPath}/documents/image/profile/${student.id}" 
                   alt="Profile Image" class="profile-img">
            </c:if>
            <div class="profile-overlay">
              <button class="view-image-btn" onclick="viewProfileImage('${student.id}')">
                <i class="fas fa-search-plus"></i> View Full Size
              </button>
            </div>
          </div>
        </div>
        
        <div class="student-basic-info">
          <h3 class="student-name">${student.studentName}</h3>
          <p class="student-roll">Roll No: ${student.rollNo}</p>
          <p class="student-branch">${student.branch.name}</p>
          <p class="student-semester">Semester: ${student.semester.name}</p>
        </div>
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
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <c:if test="${not empty documents}">
          <tr>
            <td>1</td>
            <td>Aadhar Card</td>
            <td>${documents.aadharNo}</td>
            <td>
              <c:if test="${not empty documents.aadharImage}">
                <button class="btn btn-primary btn-sm" onclick="viewImage('aadhar', '${student.id}')">View Image</button>
              </c:if>
            </td>
          </tr>
          <tr>
            <td>2</td>
            <td>Caste Certificate</td>
            <td>${documents.castCertificateNo}</td>
            <td>
              <c:if test="${not empty documents.castCertificateImage}">
                <button class="btn btn-primary btn-sm" onclick="viewImage('caste', '${student.id}')">View Image</button>
              </c:if>
            </td>
          </tr>
          <tr>
            <td>3</td>
            <td>Income Certificate</td>
            <td>${documents.incomeCertificateNo}</td>
            <td>
              <c:if test="${not empty documents.incomeCertificateImage}">
                <button class="btn btn-primary btn-sm" onclick="viewImage('income', '${student.id}')">View Image</button>
              </c:if>
            </td>
          </tr>
          <tr>
            <td>4</td>
            <td>Residence Certificate</td>
            <td>${documents.residenceCertificateNo}</td>
            <td>
              <c:if test="${not empty documents.residenceCertificateImage}">
                <button class="btn btn-primary btn-sm" onclick="viewImage('residence', '${student.id}')">View Image</button>
              </c:if>
            </td>
          </tr>
          <tr>
            <td>5</td>
            <td>10th Marksheet</td>
            <td>${documents.tenthMarksheetNo}</td>
            <td>
              <c:if test="${not empty documents.tenthMarksheetImage}">
                <button class="btn btn-primary btn-sm" onclick="viewImage('tenth', '${student.id}')">View Image</button>
              </c:if>
            </td>
          </tr>
          <tr>
            <td>6</td>
            <td>12th Marksheet</td>
            <td>${documents.twelfthMarksheetNo}</td>
            <td>
              <c:if test="${not empty documents.twelfthMarksheetImage}">
                <button class="btn btn-primary btn-sm" onclick="viewImage('twelfth', '${student.id}')">View Image</button>
              </c:if>
            </td>
          </tr>
          <tr>
            <td>7</td>
            <td>Transfer Certificate</td>
            <td>${documents.transferCertificateNo}</td>
            <td>
              <c:if test="${not empty documents.transferCertificateImage}">
                <button class="btn btn-primary btn-sm" onclick="viewImage('transfer', '${student.id}')">View Image</button>
              </c:if>
            </td>
          </tr>
        </c:if>
        <c:if test="${empty documents}">
          <tr>
            <td colspan="4">No documents found for this student.</td>
          </tr>
        </c:if>
      </tbody>
    </table>
  </div>
  
  <!-- Lightbox Modal -->
  <div class="modal fade" id="imageModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Profile Image</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body text-center">
          <img id="modalImage" src="" alt="Profile Image" class="img-fluid">
        </div>
      </div>
    </div>
  </div>
  
  <script>
    function viewImage(documentType, studentId) {
      const imageUrl = '${pageContext.request.contextPath}/documents/image/' + documentType + '/' + studentId;
      window.open(imageUrl, '_blank');
    }
    
    function viewProfileImage(studentId) {
      const imageUrl = '${pageContext.request.contextPath}/documents/image/profile/' + studentId;
      const modal = new bootstrap.Modal(document.getElementById('imageModal'));
      document.getElementById('modalImage').src = imageUrl;
      modal.show();
    }
  </script>
</body>
</html>
