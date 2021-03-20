<%@page import="java.util.ArrayList"%>
<%@page import="connection.model.Company"%>
<%@page import="connection.DAO.CompanyDAO"%>
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

<%
	CompanyDAO company = new CompanyDAO();
%>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="wrapper">

		<jsp:include page="menu.jsp"></jsp:include>
		<div id="rightContent">
			<h3>Quản lý công ty</h3>
			<a href="InsertCompany.jsp" style="font-size: 125%">Thêm công ty</a>
		
			<table class="data">
				<tr class="data">
					<th class="data" width="30px">STT</th>
					<th class="data">Mã Công Ty</th>
					<th class="data">Công ty</th>
					<th class="data" width="75px">Tùy chọn</th>
				</tr>
				<%
					int i = 0;
					for(Company list : company.getListCompany()){
						i++;
				%>
				<tr class="data">
					<td class="data" width="30px"><%=i %></td>
					<td class="data"><%=list.getIdCompany() %></td>
					<td class="data"><%=list.getName() %></td>
					<td class="data" width="75px">
						<center>
							<a href="UpdateCompany.jsp?idCompany=<%=list.getIdCompany()%> "><img src="mos-css/img/setting.png"></a>&nbsp;&nbsp; | &nbsp;&nbsp;
							<a href="/NICTProjectWeb/ManageCompany?command=remove&IdCompany=<%=list.getIdCompany()%>"><img src="mos-css/img/remove.png"></a>
						</center>
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>

		<div class="clear"></div>

		<jsp:include page="footer.jsp"></jsp:include>

	</div>
</body>
</html>