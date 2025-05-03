<div class="mb-3 mx-1">
    <label for="rollNo" class="form-label">Roll Number</label>
    <input type="text" name="rollNo" class="form-control" placeholder="Enter Roll Number">
</div>
<div class="mb-3 mx-1">
    <label for="branchSelect" class="form-label">Branch</label>
    <select id="branchSelect" name="branchCode" class="form-control">
        <option value="" disabled selected>Select Branch</option>
        <c:forEach var="branch" items="${branches}">
            <option value="${branch.code}" <c:if test="${branch.code == param.branchCode}">selected</c:if>
                >${branch.name}</option>
        </c:forEach>
    </select>
</div>

<div class="mb-3 mx-1">
    <label for="semesterSelect" class="form-label">Semester</label>
    <select name="semester" class="form-control">
        <option value="" disabled selected>Select Semester</option>
        <c:forEach var="semester" items="${semesters}">
            <option value="${semester.name}" <c:if test="${semester.name == param.semester}">selected</c:if>
                >${semester.name}</option>
        </c:forEach>
    </select>
</div>
<div class="mb-3 mx-1">
    <label for="academicYearSelect" class="form-label">Academic Year</label>
    <select name="academicYear" class="form-control">
        <option value="" disabled selected>Select Academic Year</option>
                <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                <c:set var="uniqueYears" value="" />
                <c:forEach var="student" items="${students}">
                    <c:if test="${!fn:contains(uniqueYears, student.admissionYear)}">
                        <c:set var="uniqueYears" value="${uniqueYears},${student.admissionYear}" />
                        <option value="${student.admissionYear}" <c:if test="${student.admissionYear == param.academicYear}">selected</c:if>>${student.admissionYear}</option>
                    </c:if>
                </c:forEach>
    </select>
</div>
<div class="px-1 mt-4">
<button type="submit" class="btn btn-primary w-100 h-75 ftr">Apply Filters</button>
