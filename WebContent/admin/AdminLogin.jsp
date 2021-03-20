<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/mos-css/mos-style.css">
<!--pemanggilan file css-->

<title>Admin</title>


</head>
<body>
	<div id="header">
		<div class="inHeaderLogin"></div>
	</div>

	<div id="loginForm">
		<div class="headLoginForm">Login Administrator</div>
		<div class="fieldLogin">
			<form method="POST" action="">
				<label>Username</label><br> <input type="text" class="login"><br>
				<label>Password</label><br> <input type="password"
					class="login"><br> 
					<input type="submit" class="button"
					value="Login">
			</form>
		</div>
	</div>
</body>
</html>