<%@ include file="/static/components/header.jsp" %>

<!-- Sidebar -->
<div class="row">
  <div class="col-md-2 sidebar">
    <%@ include file="/static/components/sidebar-academic.jsp" %>
  </div>

  <!-- Main Content -->
  <main class="col-md-10 p-4" style="margin-left:270px;margin-top:45px !important;">

    <div class="row mb-4">
      <!-- Profile -->
      <div class="col-md-4 col-lg-6">
        <h5 class="fw-bold cn-heading">Academic Profile</h5>
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
          <th>Semester Name</th>
          <th>SGPA</th>
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
          <th>Scholarship Name</th>
          <th>Amount</th>
          <th>Status</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="scholarship" items="${scholarships}" varStatus="status">
          <tr>
            <td>
              <c:out value="${status.index + 1}" />
            </td>
            <td>
              <c:out value="${scholarship.academicYear}" />
            </td>
            <td>
              <c:out value="${scholarship.entitlementAmount}" />
            </td>
            <td>
              <c:out value="${scholarship.applicationStatus}" />
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
          <th>Selection Year</th>
          <th>Company Name</th>
          <th>Package</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="placement" items="${placements}" varStatus="status" >
          <tr>
            <td><c:out value="${status.index + 1}" /></td>
            <td><c:out value="${placement.selectedYear}" /></td>
            <td><c:out value="${placement.companyName}" /> </td>
            <td><c:out value="${placement.packageAmount}" /> </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <div >
      <form action="/academic/tc/form" method="get">
        <input type="hidden" name="studentId" value="${student.id}" />
        <button type="submit" class="btn btn-primary">Fill Pass Out Details</button>
      </form>
    </div>

  </main>
</div>

</div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
