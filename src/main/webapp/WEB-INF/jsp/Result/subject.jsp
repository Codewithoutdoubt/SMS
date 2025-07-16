<%@ include file="/static/components/header.jsp" %>

<div class="row">
  <!-- Sidebar -->
  <div class="col-md-2 col-lg-2 sidebar">
    <h4 class="text-center">Result Department</h4>
    <hr class="bg-white">
    <ul class="nav flex-column">
      <li class="nav-item">
        <a class="nav-link active" href="/result">
          <i class="fas fa-tachometer-alt"></i> Dashboard
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/result/subject/list">
          <i class="fas fa-book"></i> Subjects
        </a>
      </li>
    </ul>
  </div>

  <!-- Main Content -->
  <main class="col-md-10 ms-sm-auto col-lg-10  p-4">
    <!-- Header Controls -->
    <form class="row g-3 align-items-center mb-3 w-75"  action="/result/subject/filter" method="get">
      <div class="col-4">
        <select id="branchSelect" name="branchId" class="form-control font-weight-bold" aria-label="Select Branch" required>
          <option selected disabled hidden value="">Select Branch</option>
          <c:forEach items="${branches}" var="branch">
            <option value="${branch.id}" <c:if test="${branch.id == selectedBranchId}">selected</c:if>>${branch.name}</option>
          </c:forEach>
        </select>
      </div>

      <div class="col-4">
        <select id="semesterSelect" name="semesterId" class="form-control font-weight-bold" aria-label="Select Semester" required>
          <option selected disabled hidden value="">Select Semester</option>
          <c:forEach items="${semesters}" var="semester">
            <option value="${semester.id}" <c:if test="${semester.id == selectedSemesterId}">selected</c:if>>${semester.name}</option>
          </c:forEach>
        </select>
      </div>
      <button class="btn btn-primary col-2" type="submit">Apply Filter</button>
      <a class="btn btn-primary ml-2 col-1" href="/result/subject/list">Reset</a>
    </form>

    <!-- Subjects Table -->
    <div class="card p-2 w-100 mr-4">
      <table class="students-table p-2 table table-striped student-table">
        <thead>
          <tr>
            <th>#</th>
            <th>Sub Code</th>
            <th>Paper Code</th>
            <th>Subject Name</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="subject" items="${subjects}" varStatus="status">
            <tr style="padding: 0px !important;">
              <td>${status.index + 1}</td>
              <td>${subject.subjectCode}</td>
              <td>${subject.paperCode}</td>
              <td>${subject.subjectName}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      <div class="d-flex justify-content-end mr-5">
        <a class="btn btn-primary" style="width: 150px;" href="/result/subject/add"><i class="fas fa-plus"></i> Add Subject</a>
      </div>
    </div>
  </main>
</div>
