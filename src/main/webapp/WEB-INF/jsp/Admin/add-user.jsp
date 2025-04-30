<%@ include file="/static/components/header.jsp" %>
    <!-- Sidebar -->
    <div class="row">
        <div class="col-md-2 sidebar">
            <%@ include file="/static/components/sidebar.jsp" %>
        </div>
        <!-- Content Area -->
        <main class="col-md-6 ms-sm-auto col-lg-10 px-md-1">
            <div class="container w-50" style="margin-top: 6%;">
                <div class="card p-3">
                    <h3 class="text-center mb-4"><i class="fas fa-user-plus"></i> Add User</h3>
                    <form action="/saveuser" method="post">
                        <div class="mb-3">
                            <label for="username" class="form-label">Username:</label>
                            <input type="text" class="form-control" name="username" placeholder="Enter Username"
                                required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email Address:</label>
                            <input type="email" class="form-control" name="email" placeholder="Enter Email Address"
                                required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password:</label>
                            <input type="password" class="form-control" name="password" placeholder="Enter Password"
                                required>
                        </div>
                        <div class="mb-3">
                            <label for="access" class="form-label">Access Level:</label>
                            <select class="form-control" name="access" required>
                                <option value="" disabled selected>Select Access Level</option>
                                <option value="admin">Admin</option>
                                <option value="admission">Admission Department</option>
                                <option value="scholarship">Scholarship Department</option>
                                <option value="fees">Fees Department</option>
                                <option value="result">Result Department</option>
                                <option value="placement">Placement Department</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Save User</button>
                    </form>
                </div>
            </div>
        </main>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>

    </html>
