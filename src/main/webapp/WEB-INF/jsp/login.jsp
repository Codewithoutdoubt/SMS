<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 50px;
	text-align: center;
	background-color: #f4f4f4;
}

.login-container {
	width: 320px;
	background: white;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 10px;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
	margin: auto;
}

.message {
	padding: 10px;
	margin-bottom: 15px;
	border-radius: 5px;
}

.error {
	background-color: #f8d7da;
	color: #721c24;
	border: 1px solid #f5c6cb;
}

.success {
	background-color: #d4edda;
	color: #155724;
	border: 1px solid #c3e6cb;
}

input {
	width: 100%;
	padding: 10px;
	margin: 5px 0;
	border: 1px solid #ccc;
	border-radius: 5px;
}

button {
	width: 100%;
	padding: 10px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	transition: 0.3s;
}

button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>

	<div class="login-container">
		<h2>Login</h2>

		<!-- Show error message if login fails -->
		<c:if test="${param.error != null}">
			<p class="message error">Invalid username or password.</p>
		</c:if>

		<!-- Show logout success message -->
		<c:if test="${param.logout != null}">
			<p class="message success">You have been logged out successfully.</p>
		</c:if>

		<form method="post" action="<c:url value='/perform_login'/>">
			<div>
				<label>Username:</label> <input type="text" name="username" required />
			</div>
			<div>
				<label>Password:</label> <input type="password" name="password"
					required />
			</div>
			<div>
				<label>Access:</label> 
				<select name="access" id="">
					<option value="admin">Admin</option>
					<option value="attendance">Attendance</option>
					<option value="scholarship">Scholarship</option>
					<option value="exams">Exams</option>
					</option>
				</select>
			</div>
			<button type="submit">Login</button>
		</form>
	</div>

</body>
</html>
