<%@ include file="/static/components/header.jsp" %>

    <div class="container mt-5 pt-2">
        <div class="d-flex justify-content-between align-items-center">
            <h2 style="font-weight: 600;"><i class="fas fa-list"></i> Student Academic History :</h2>
            <a href="/result/add/${studentId}"> <button class="w3-button w3-green  w3-large w3-left">Add
                    Result</button></a>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>Sr.</th>
                        <th>Semester</th>
                        <th>SGPA</th>
                        <th>CGPA</th>
                        <th>Status</th>
                        <th>Result</th>
                        <th>Edit</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="result" items="${results}" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>${result.semester.name}</td>
                            <td>${result.sgpa}</td>
                            <td>${result.cgpa}</td>
                            <td>${result.resultStatus}</td>
                            <td>${result.resultValue}</td>
                            <td><a href="/result/edit/${result.id}" class="btn btn-warning">Edit</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
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