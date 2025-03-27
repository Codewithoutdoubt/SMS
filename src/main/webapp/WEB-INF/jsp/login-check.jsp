<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
	<h2>Login Form</h2>
	<form action="login" method="post">
		<label>Username:</label> <input type="text" name="username" required /><br>
		<br> <label>Password:</label> <input type="password"
			name="password" required /><br>
		<c:if test="${not empty error}">
			<p style="color: red;">${error}</p>
		</c:if>

		<input type="submit" value="Login" />
	</form>
</body>
</html>
