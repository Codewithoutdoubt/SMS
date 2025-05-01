<%@ include file="/static/components/header.jsp" %>
    <div class="container mt-5">
        <div class="row justify-content-center ">
            <div class="col-md-8 mt-5">
                <div class="card p-4 shadow">
                    <h2 class="text-center mb-4">Edit Student Semester</h2>
                    <form action="<c:url value='/faculty/update-student-semester' />" method="post">
                        <input type="hidden" name="id" value="${student.id}" />
                        <div class="row mb-3">
                            <label class="col-sm-4 col-form-label">Name:</label>
                            <div class="col-sm-8">
                                <p class="form-control-plaintext"><c:out value="${student.studentName}" /></p>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-4 col-form-label">Roll No:</label>
                            <div class="col-sm-8">
                                <p class="form-control-plaintext"><c:out value="${student.rollNo}" /></p>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="branchId" class="col-sm-4 col-form-label">Branch:</label>
                            <div class="col-sm-8">
                                <select class="form-control" id="branchId" name="branchId">
                                    <c:forEach var="branch" items="${branches}">
                                        <option value="${branch.id}" <c:if test="${branch.id == student.branch.id}">selected</c:if>>
                                            <c:out value="${branch.name}" />
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="semesterId" class="col-sm-4 col-form-label">Semester:</label>
                            <div class="col-sm-8">
                                <select class="form-control" id="semesterId" name="semesterId">
                                    <c:forEach var="semester" items="${semesters}">
                                        <option value="${semester.id}" <c:if test="${semester.id == student.semester.id}">selected</c:if>>
                                            <c:out value="${semester.name}" />
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Update Semester</button>
                    </form>
                </div>
            </div>
        </div>
    </div>    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
