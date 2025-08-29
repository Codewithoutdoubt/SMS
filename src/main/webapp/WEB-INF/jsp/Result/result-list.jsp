<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                            <th>Sr. No.</th>
                            <th>Semester</th>
                            <th>SGPA</th>
                            <th>CGPA</th>
                            <th>Status</th>
                            <th>Passed Subjects</th>
                            <th>Failed Subjects</th>
                            <th>View Result</th>
                            <th>Actions</th>
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
                                <td>
                                    <c:forEach items="${result.subjects}" var="subject">
                                        <c:if test="${subject.status == 'Pass'}">
                                            ${subject.subject.subjectCode}-
                                            ${subject.subject.subjectName}<br>
                                        </c:if>
                                    </c:forEach>
                                </td>

                                <td>
                                    <c:forEach items="${result.subjects}" var="subject">
                                        <c:if test="${subject.status == 'Fail'}">
                                            ${subject.subject.subjectCode}-
                                            ${subject.subject.subjectName}<br>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}${result.imagePath}" target="_blank" class="btn btn-info btn-sm w-75 ml-2">View</a>
                                </td>
                                <td><a href="/result/edit/${result.id}" class="btn btn-warning">Edit</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>