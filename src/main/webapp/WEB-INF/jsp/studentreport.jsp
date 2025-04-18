<%@ include file="/static/components/header.jsp" %>
  <!-- Sidebar -->
  <div class="row">
    <div class="col-md-2 sidebar">
      <%@ include file="/static/components/sidebar.jsp" %>
    </div>

    <!-- Main Content -->
    <main class="col-md-10 p-4">
      <!-- Profile and Fees Section -->
      <div class="row mb-4">
        <!-- Profile -->
        <div class="col-md-4">
          <h5 class="fw-bold cn-heading">Student Profile</h5>
          <div class="card profile-card">
            <div class="card-body">
              <div class="details scard d-flex">
                <h4>Name : </h4>
                <p>
                  <c:out value="${student.studentName}" />
                </p>
              </div>
              <div class="deatails scard d-flex">
                <h4>Roll No. :</h4>
                <p>
                  <c:out value="${student.rollNo}" />
                </p>
              </div>
              <div class="deatails scard d-flex">
                <h4>Branch :</h4>
                <p>
                  <c:out value="${student.branch.name}" />
                </p>
              </div>
            </div>
          </div>
        </div>

        <!-- Fees Table -->
        <div class="col-md-8">
          <h5 class="fw-bold cn-heading">Fees Details</h5>
          <table class="table table-bordered">
            <thead class="table-primary">
              <tr>
                <th>Sr. No.</th>
                <th>Year</th>
                <th>Fees</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td></td>
                <td></td>
              </tr>
              <tr>
                <td>2</td>
                <td></td>
                <td></td>
              </tr>
              <tr>
                <td>3</td>
                <td></td>
                <td></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- Result Table -->
      <h5 class="cn-heading">Result Details</h5>
      <table class="table table-bordered">
        <thead class="table-primary">
          <tr>
            <th>Sr. No.</th>
            <th>Semester Name</th>
            <th>SGPA</th>
            <th>CGPA</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>2</td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>3</td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>4</td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>5</td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
        </tbody>
      </table>
    </main>
  </div>
  </div>

  <!-- Bootstrap JS Bundle -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

  </body>

  </html>