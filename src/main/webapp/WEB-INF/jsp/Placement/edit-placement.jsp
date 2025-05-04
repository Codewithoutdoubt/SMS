<%@ include file="/static/components/header-placement.jsp" %>

<body>
    <div class="container mt-5 d-flex justify-content-center">
        <div class="card shadow p-4" style="max-width: 700px; width: 100%;">
            <h2 class="mb-4 text-center">Edit Placement</h2>
            <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger" role="alert">
                            ${errorMessage}
                        </div>
                    </c:if>
            <form action="/placement/update/${placement.id}" method="post">
                <input type="hidden" class="form-control" name="studentId" value="${placement.student.id}" readonly>
                <div class="mb-3">
                    <label for="studentIds" class="form-label">Select Students:</label>
                    <input type="text" class="form-control" name="studentId" value="${placement.student.rollNo}" readonly>   
                    
                </div>
                <div class="mb-3">
                    <label for="companyName" class="form-label">Company Name:</label>
                    <input type="text" class="form-control" id="companyName" name="companyName" value="${placement.companyName}" required>
                </div>
                <div class="mb-3">
                    <label for="packageAmount" class="form-label">Package (LPA):</label>
                    <input type="number" step="0.01" class="form-control" id="packageAmount" name="packageAmount" value="${placement.packageAmount}" required>
                </div>
                <div class="mb-3">
                    <label for="selectedYear" class="form-label">Selected Year:</label>
                    <input type="number" class="form-control" id="selectedYear" name="selectedYear" value="${placement.selectedYear}" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Update Placement</button>
            </form>
        </div>
    </div>
</body>

</html>
