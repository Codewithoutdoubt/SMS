<%@ include file="/static/components/header.jsp" %>
            <!-- Sidebar start-->
            <div class="row">
                <div class="col-md-2 sidebar">
            <%@ include file="/static/components/sidebar.jsp" %>
            </div>
            <div class="col-md-10">
                <div class="container w-50" style="margin-top: 6%;">
                    <div class="container mt-5">
                        <div class="card">
                            <div class="card-header text-center">
                                <h2>Add Semester</h2>
                            </div>
                            <div class="card-body">
                                <form action="${empty semester.id ? 'save' : 'update'}" method="post">
                                    <c:if test="${not empty semester.id}">
                                        <input type="hidden" name="id" value="${semester.id}">
                                    </c:if>
                                    <div class="mb-3">
                                        <label class="form-label">Semester Name:</label>
                                        <input type="text" name="name" class="form-control"
                                            placeholder="Enter Semester Name" 
                                            value="${semester.name}"
                                            required>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <a href="/semesters" class="btn btn-secondary">Cancel</a>
                                        <button type="submit" class="btn btn-primary">
                                            ${empty semester.id ? 'Add' : 'Update'} Semester
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                
                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        </body>

        </html>