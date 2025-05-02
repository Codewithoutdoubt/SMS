<%@ include file="/static/components/header.jsp" %>

    <div class="container mt-5 pt-2">
        <div class="d-flex justify-content-between">
            <h2><i class="fas fa-list"></i> Student Fees Record :</h2>
            <a href="add/${student.id}"> <button class="w3-button w3-green mt-2 w3-large w3-left">Add Fees</button></a>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>Sr. No.</th>
                        <th>Roll No.</th>
                        <th>Year</th>
                        <th>Fees Type</th>
                        <th>Date</th>
                        <th>Receipt No.</th>
                        <th>Amount</th>
                        <th>Edit</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="fee" items="${fees}" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>${fee.student.rollNo}</td>
                            <td>${fee.year}</td>
                            <td>${fee.feeType}</td>
                            <td>${fee.date}</td>    
                            <td>${fee.feeReceiptNo}</td>
                            <td>${fee.amount}</td>
                            <td><a href="/fees/edit/${fee.id}" class="btn btn-warning">Edit</a></td>
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