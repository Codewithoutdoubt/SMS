<form id="filter-form" class="d-flex filter-section" method="get" action="/filter">
    <div class="mb-3 w-25 mx-1">
        <select name="branchCode" class="form-control">
            <option value="" disabled selected>Select Branch</option>
            <c:forEach var="branch" items="${branches}">
                <option value="${branch.code}" <c:if test="${branch.code == param.branchCode}">selected</c:if>>${branch.name}</option>
            </c:forEach>
        </select>
    </div>
    <div class="mb-3 w-25 mx-1">
        <select name="semester" class="form-control">
            <option value="" disabled selected>Select Semester</option>
            <c:forEach var="semester" items="${semesters}">
                <option value="${semester.name}" <c:if test="${semester.name == param.semester}">selected</c:if>>${semester.name}</option>
            </c:forEach>
        </select>
    </div>
    <div class="mb-3 w-25 mx-1">
        <select name="academicYear" class="form-control">
            <option value="" disabled selected>Select Academic Year</option>
            <c:forEach var="student" items="${students}">
                <option value="${student.admissionYear}" <c:if test="${student.admissionYear == param.academicYear}">selected</c:if>>${student.admissionYear}</option>
            </c:forEach>
        </select>
    </div>
    <button type="submit" class="btn btn-primary mx-2 h-75 ftr">Apply Filters</button>
    <button type="reset" class="btn btn-primary mx-2 h-75 ftr"><a href="/admin">Reset</a></button>
</form>

