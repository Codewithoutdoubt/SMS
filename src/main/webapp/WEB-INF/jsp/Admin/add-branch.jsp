<%@ include file="/static/components/header.jsp" %>
    <!-- Sidebar -->
    <div class="row">
        <div class="col-md-2 sidebar">
            <%@ include file="/static/components/sidebar.jsp" %>
        </div>
        <div class="col-md-10">
<div class="container w-50" style="margin-top: 6%;">
    <div class="container">
        <div class="form-container card p-4 mt-4">
            <h2 class="text-center">Add Branch</h2>
            <form action="save" method="post">
                <div class="mb-3">
                    <label class="form-label">Branch Name:</label>
                    <input type="text" class="form-control" name="name" placeholder="Enter Branch Name" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Branch Code:</label>
                    <input type="text" class="form-control" name="code" placeholder="Enter Branch Code" required>
                </div>
                <div class="d-flex justify-content-between">
                    <button type="reset" class="btn btn-secondary">Reset</button>
                    <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Sidebar Toggle Button --
    <span class="toggle-btn" onclick="toggleSidebar()">
        <i class="fas fa-bars"></i>
    </span>

    <!-- Content Area 
    <div class="content">
        <div class="container">
            <h2 class="mt-4"><i class="fas fa-users"></i> User List</h2>
            <div class="table-responsive">
            
                <div class="message text-white fs-3 text-center m-1">${message}</div>
                <table class="table table-bordered table-striped table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th>Username</th>
                            <th>Access</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.username}</td>
                <td>${user.access}</td>
            </tr>
        </c:forEach>
                    </tbody>
                </table>
                
            </div>
        </div>
    </div>

    <!-- Sidebar Toggle Script -->

    
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
