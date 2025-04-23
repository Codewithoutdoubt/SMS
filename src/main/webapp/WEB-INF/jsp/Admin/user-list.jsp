<%@ include file="/static/components/header.jsp" %>
<!-- Sidebar -->
<div class="row">
    <div class="col-md-2 sidebar">
        <%@ include file="/static/components/sidebar.jsp" %>
    </div>
    <div class="col-md-10">
        <div class="container-fluid mt-3">
            <div class="row justify-content-between mx-1 my-2">
                <h2 class="mb-0 ">
                    <i class="fas fa-users mr-2 "></i>User Management
                </h2>
                <a href="addUser" class="btn btn-success pt-2" style="font-size: 18px;">
                    <i class="fas fa-plus "></i>Add New User
                </a>
            </div>

            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0">
                        <i class="fas fa-list mr-2"></i>User List
                    </h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0">
                            <thead class="thead-light">
                                <tr>
                                    <th class="text-center" style="width: 10%">#</th>
                                    <th style="width: 40%">Username</th>
                                    <th class="text-center" style="width: 30%">Access Level</th>
                                    <th class="text-center" style="width: 20%">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" items="${users}" varStatus="loop">
                                    <tr>
                                        <td class="text-center">${loop.index + 1}</td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div class="avatar mr-3">
                                                    <i class="fas fa-user-circle fa-2x text-primary"></i>
                                                </div>
                                                <div>
                                                    <h6 class="mb-0">${user.username}</h6>
                                                    <small class="text-muted">Last active: Today</small>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <span class="badge badge-pill ${user.access == 'admin' ? 'badge-primary' : 'badge-secondary'} p-2">
                                                <i class="fas ${user.access == 'admin' ? 'fa-shield-alt' : 'fa-user'} mr-1"></i>
                                                ${user.access}
                                            </span>
                                        </td>
                                        <td class="text-center">
                                            <form action="${pageContext.request.contextPath}/delete/${user.id}" method="post" onsubmit="return confirm('Are you sure you want to delete this user?');">
                                                <button type="submit" class="btn btn-danger">Delete</button>
                                            </form>
                            
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer bg-light">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="text-muted">
                            Showing ${users.size()} of ${users.size()} users
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>

</div></div>
    
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
