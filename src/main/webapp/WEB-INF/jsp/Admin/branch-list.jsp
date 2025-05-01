<%@ include file="/static/components/header.jsp" %>
    <!-- Sidebar -->
    <div class="row">
        <div class="col-md-2 sidebar">
            <%@ include file="/static/components/sidebar.jsp" %>
        </div>
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-1">
            <div class="container">
                <div class="d-flex justify-content-between">
                    <h2 class="mt-4"><i class="fas fa-list"></i> Branch List</h2>
                    <a href="${pageContext.request.contextPath}/branch-data/add">
                        <button onclick="document.getElementById('id01').style.display='block'"
                            class="w3-button w3-green mt-4 w3-large w3-left">Add Branch</button></a>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>ID</th>
                                <th>Branch Name</th>
                                <th>Branch Code</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="branch" items="${branchList}" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td>${branch.name}</td>
                                    <td>${branch.code}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
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