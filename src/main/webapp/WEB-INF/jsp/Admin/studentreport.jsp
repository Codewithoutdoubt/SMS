<%@ include file="/static/components/header.jsp" %>

  <!-- Sidebar -->
  <div class="row">
    <div class="col-md-2 sidebar">
      <%@ include file="/static/components/sidebar.jsp" %>
    </div>

    <!-- Main Content -->
    <main class="col-md-10 p-4"style="margin-left:270px;margin-top:45px !important;">

    <div class="row mb-4">
      <!-- Profile -->
      <div class="col-md-4 col-lg-6">
        <div class="d-flex justify-content-between">
        <h5 class="fw-bold cn-heading">Student Profile</h5>
        <a href="/delete-student/${student.id}" onclick="return confirm('Are you sure you want to delete this student?');">
        <button type="button" class="btn btn-danger mt-2">Delete</button>
      </a>
      </div>
        <div class="card profile-card">
          <div class="card-body">
            <div class="details scard ">
              <h4>Name : </h4>
              <p>
                <c:out value="${student.studentName}" />
              </p>
            </div>
            <div class="deatails scard">
              <h4>Roll No. :</h4>
              <p>
                <c:out value="${student.rollNo}" />
              </p>
            </div>
            <div class="deatails scard">
              <h4>Branch :</h4>
              <p>
                <c:out value="${student.branch.name}" />
              </p>
            </div>
          </div>
        </div>
      </div>

      <!-- Fees Table -->
      <div class="col-md-8 col-lg-6">
        <h6 class="fw-bold cn-heading">Fees Details</h6>
        <table class="table fees-table table-bordered">
          <thead class="table-primary">
            <tr>
              <th>Sr. No.</th>
              <th>Year</th>
              <th>Fees</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="fee" items="${fees}" varStatus="status">
              <tr>
                <td>
                  <c:out value="${status.index + 1}" />
                </td>
                <td>
                  <c:out value="${fee.year}" />
                </td>
                <td>
                  <c:out value="${fee.amount}" />
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>

    <!-- Result Table -->
    <h5 class="cn-heading">Result Details</h5>
    <table class="table table-bordered">
      <thead class="table-primary">
        <tr>
          <th class="report-sr">Sr. No.</th>
          <th class="w-50">Semester Name</th>
          <th class="third-col">SGPA</th>
          <th>CGPA</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="result" items="${results}" varStatus="status">
          <tr>
            <td>
              <c:out value="${status.index + 1}" />
            </td>
            <td>
              <c:out value="${result.semester.name}" />
            </td>
            <td>
              <c:out value="${result.sgpa}" />
            </td>
            <td>
              <c:out value="${result.cgpa}" />
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <!-- Scholarship Table -->
    <h5 class="cn-heading pt-2">Scholarship Details</h5>
    <table class="table table-bordered">
      <thead class="table-primary">
        <tr>
          <th class="report-sr">Sr. No.</th>
          <th class="w-50">Amount</th>
          <th class="third-col">Status</th>
          <th>Scholarship Year</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="scholarship" items="${scholarships}" varStatus="status">
          <tr>
            <td>
              <c:out value="${status.index + 1}" />
            </td>
            <td>
              <c:out value="${scholarship.entitlementAmount}" />
            </td>
            <td>
              <c:out value="${scholarship.applicationStatus}" />
            </td>
            <td>
              <c:out value="${scholarship.academicYear}" />
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <h5 class="cn-heading pt-2">Placement Details</h5>
    <table class="table table-bordered">
      <thead class="table-primary">
        <tr>
          <th class="report-sr">Sr. No.</th>
          <th class="w-50">Company Name</th>
          <th class="third-col">Package</th>
          <th>Selection Year</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="placement" items="${placements}" varStatus="status" >
          <tr>
            <td><c:out value="${status.index + 1}" /></td>
            <td><c:out value="${placement.companyName}" /> </td>
            <td><c:out value="${placement.packageAmount}" /> </td>
            <td><c:out value="${placement.selectedYear}" /></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <!-- Documents Table -->
    <h5 class="cn-heading pt-2">Document Details</h5>
    <table class="table table-bordered">
      <thead class="table-primary">
        <tr>
          <th class="report-sr">Sr. No.</th>
          <th class="w-50">Document Name</th>
          <th>Document Number</th>
        </tr>
      </thead>
      <tbody>
          <tr>
            <td>1</td>
            <td>Aadhar Number</td>
            <td>
              <!-- <c:out value="${documents.aadharNo}" /> -->
            </td>
          </tr>
          <tr>
            <td>2</td>
            <td>Caste Certificate No.</td>
            <td>
              <!-- <c:out value="${documents.casteCertificateNo}" /> -->
            </td>
          </tr>

          <tr>
            <td>3</td>
            <td>Income Certificate Number</td>
            <td>
              <!-- <c:out value="${documents.incomeCertificateNo}" /> -->
            </td>
          </tr>
          <tr>
            <td>4</td>
            <td>Residence Certificate Number</td>
            <td>
              <!-- <c:out value="${documents.residenceCertificateNo}" /> -->
            </td>
          </tr>
      </tbody>
    </table>

    </main>
  </div>

  </div>
  </div>

  <!-- Bootstrap JS Bundle -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

  </body>

  </html>