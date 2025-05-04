    <%@ include file="/static/components/header.jsp" %>

<div class="container mt-5">
    <h2 class="text-center mb-4">Documents for Student ID: ${studentId}</h2>
    <div class="row justify-content-center">
        <div class="col-md-10">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Document ID</th>
                        <th>Profile ID</th>
                        <th>Aadhar No</th>
                        <th>Caste Certificate No</th>
                        <th>Income Certificate No</th>
                        <th>Residence Certificate No</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="doc" items="${documents}">
                        <tr>
                            <td>${doc.id}</td>
                            <td>${doc.profileId}</td>
                            <td>${doc.aadharNo}</td>
                            <td>${doc.casteCertificateNo}</td>
                            <td>${doc.incomeCertificateNo}</td>
                            <td>${doc.residenceCertificateNo}</td>
                            <td>
                                <form action="/documents/editdocument" method="post" style="display:inline;">
                                    <input type="hidden" name="documentId" value="${doc.id}" />
                                    <button type="submit" class="btn btn-primary btn-sm">Edit</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <a href="/admission" class="btn btn-secondary">Back to Student List</a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
