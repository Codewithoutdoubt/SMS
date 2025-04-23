<%@ include file="/static/components/header.jsp" %>
    <!-- Sidebar -->
    <div class="row">
        <div class="col-md-2 sidebar">
            <%@ include file="/static/components/sidebar.jsp" %>
        </div>
        <div class="col-md-10">
    <div class="container-fluid">
        <%-- Success/Error Messages --%>
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success alert-dismissible fade show mb-4">
                <i class="fas fa-check-circle me-2"></i>${successMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger alert-dismissible fade show mb-4">
                <i class="fas fa-exclamation-circle me-2"></i>${errorMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>
        <div class="d-flex justify-content-between">
        <h2 class="mt-4"><i class="fas fa-list"></i> Semester List</h2>
        <a href="${pageContext.request.contextPath}/semesters/add" class="btn btn-primary mt-4 mb-1 pt-2">
            <i class="fas fa-plus me-2"></i>Add Semester
        </a>
    </div>
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th>ID</th>
                            <th>Semester Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Dynamic semester data will be populated here -->
                        <c:forEach var="semester" items="${semesters}">
                            <tr>
                                <td>${semester.id}</td>
                                <td>${semester.name}</td>
                            </tr>
                        </c:forEach>    
                    </tbody>
                </table>
            </div>
        </div>


    
    <script>
        function toggleSidebar() {
            document.body.classList.toggle("collapsed");
        }
    </script>




    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
