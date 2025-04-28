<%@ include file="/static/components/header-placement.jsp" %>

<body>
    <div class="container mt-5 d-flex justify-content-center">
        <div class="card shadow p-4" style="max-width: 700px; width: 100%;">
            <h2 class="mb-4 text-center">Placement Form</h2>
            <hr>
            <form action="/placement" method="post">
                <input type="hidden" class="form-control" name="studentId" value="${students.id}" readonly>
                <div class="mb-3">
                    <label for="studentId" class="form-label">Students Roll No:</label>
                    <input type="text" class="form-control" name="studentId" value="${students.rollNo}" readonly>
                </div>
                <div class="mb-3">
                    <label for="companyName" class="form-label">Company Name:</label>
                    <input type="text" class="form-control" id="companyName" name="companyName" placeholder="Enter Company Name" required>
                </div>
                <div class="mb-3">
                    <label for="packageAmount" class="form-label">Package (LPA):</label>
                    <input type="number" step="0.01" class="form-control" id="packageAmount" name="packageAmount" placeholder="Enter Package" required>
                </div>
                <div class="mb-3">
                    <label for="selectedYear" class="form-label">Selected Year:</label>
                    <input type="number" class="form-control" id="selectedYear" name="selectedYear" placeholder="Enter Year (e.g., 2025)" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Add Placement</button>
            </form>
        </div>
    </div>
</body>

</html>
