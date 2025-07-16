<%@ include file="/static/components/header.jsp" %>

<div class="row">
    <!-- Sidebar -->
    <div class="col-md-2 col-lg-2 sidebar">
        <h4 class="text-center">Result Department</h4>
        <hr class="bg-white">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="/result">
                    <i class="fas fa-tachometer-alt"></i> Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="/result/subject/list">
                    <i class="fas fa-book"></i> Subjects
                </a>
            </li>
        </ul>
    </div>

    <!-- Main Content -->
    <main class="col-md-10 ms-sm-auto col-lg-10 px-md-2 mt-4">
      <div class="Subject-form">
        <form action="${pageContext.request.contextPath}/result/subject/save" method="post">
          <h5>Fill Subject Details</h5>
          <hr>
            <div class="row mb-3 align-items-center">
                <div class="col-3">
                    <label for="branch" class="form-label fw-bold">Branch</label>
                </div>
                <div class="col-9">
                    <select id="branch" name="branchId" class="form-control w-100 me-3" required>
                        <option selected disabled hidden value="">Choose Branch</option>
                        <c:forEach items="${branches}" var="branch">
                            <option value="${branch.id}">${branch.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="row mb-3 align-items-center">
                <div class="col-3">
                    <label for="semester" class="form-label fw-bold">Semester</label>
                </div>
                <div class="col-9">
                    <select id="semester" name="semesterId" class="form-control w-100 me-3" required>
                        <option selected disabled hidden value="">Choose Semester</option>
                        <c:forEach items="${semesters}" var="semester">
                            <option value="${semester.id}">${semester.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="row mb-3 align-items-center">
                <div class="col-3">
                    <label for="subjectCode" class="form-label fw-bold">Subject Code</label>
                </div>
                <div class="col-9">
                    <input type="text" id="subjectCode" name="subjectCode" class="form-control" placeholder="Enter Subject Code" value="${subject.subjectCode}" required>
                </div>
            </div>

            <div class="row mb-3 align-items-center">
                <div class="col-3">
                    <label for="paperCode" class="form-label fw-bold">Paper Code</label>
                </div>
                <div class="col-9">
                    <input type="text" id="paperCode" name="paperCode" class="form-control" placeholder="Enter Paper Code" value="${subject.paperCode}" required>
                </div>
            </div>

            <div class="row mb-3 align-items-center">
                <div class="col-3">
                    <label for="subjectName" class="form-label fw-bold">Subject Name</label>
                </div>
                <div class="col-9">
                    <input type="text" id="subjectName" name="subjectName" class="form-control" placeholder="Enter Subject Name" value="${subject.subjectName}" required>
                </div>
            </div>

            <!-- Submit and Reset Buttons -->
            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-success">Submit</button>
                <button type="reset" class="btn btn-danger">Reset</button>
            </div>
        </form>
        </div>
    </main>
</div>
