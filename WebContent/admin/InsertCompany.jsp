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
	<jsp:include page="header.jsp"></jsp:include>
	<div id="wrapper">

		<jsp:include page="menu.jsp"></jsp:include>
		<div id="rightContent">
			<h3>Thêm công ty</h3>
			<form action="/NICTProjectWeb/ManageCompany" method="post">
				<table width="95%">

					<tr>
						<td width="125px"><b>Tên công ty:</b></td>
						<td>
						<input type="hidden" name="command" value="insert">						
						<input type="text" class="pendek" name="NameCompany">
						</td>
					</tr>

					<tr>
						<td></td>
						<td><input type="submit" class="button" value="Lưu trữ">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="clear"></div>

		<jsp:include page="footer.jsp"></jsp:include>

	</div>
</body>
</html>