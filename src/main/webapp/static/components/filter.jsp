    <div class="mb-3 w-25 mx-1">
        <input type="text" name="rollNo" class="form-control" placeholder="Enter Roll Number">
    </div>
    <div class="mb-3 w-25 mx-1">
        <select name="branchCode" class="form-control ">
            <option value="" disabled selected>Select Branch</option>
            <option value="">All</option>
            <c:forEach var="branch" items="${branches}">
                <option value="${branch.code}" <c:if test="${branch.code == param.branchCode}">selected</c:if>>${branch.name}</option>
            </c:forEach>
        </select>
    </div>
    <div class="mb-3 w-25 mx-1">
        <select name="semester" class="form-control select2">

            <option value="" disabled selected>Select Semester</option>
            <option value="">All</option>
            <c:forEach var="semester" items="${semesters}">
                <option value="${semester.name}" <c:if test="${semester.name == param.semester}">selected</c:if>>${semester.name}</option>
            </c:forEach>
        </select>
    </div>
    <div class="mb-3 w-25 mx-1">
        <select id="academicYear" name="academicYear" class="form-control">
            <option value="" disabled selected>Select Admission Year</option>
            <option value="">All</option>
            <c:forEach var="student" items="${students}">
                <option value="${student.admissionYear}" <c:if test="${student.admissionYear == param.academicYear}">selected</c:if>>${student.admissionYear}</option>
            </c:forEach>
        </select>
    </div>
    <button type="submit" class="btn btn-primary mx-2 h-75 ftr">Apply</button>
    <a href="/${sessionScope.department.access}" class="btn btn-primary h-75">Reset</a>
</form>

<script>
    // Function to remove duplicate options
    function removeDuplicateOptions(selectElement) {
        const seen = new Set();
        const options = Array.from(selectElement.options);

        options.forEach(option => {
            if (seen.has(option.value)) {
                option.remove();  // Remove duplicate option
            } else {
                seen.add(option.value);  // Add unique value to the Set
            }
        });
    }

    // Call the function to remove duplicates
    const selectElement = document.getElementById('academicYear');
    removeDuplicateOptions(selectElement);
</script>




