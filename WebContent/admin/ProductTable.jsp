<%@page import="connection.model.Product"%>
<%@page import="connection.DAO.ProductDao"%>
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
	ProductDao product = new ProductDao();
	String idProductType= request.getParameter("idProductType");
%>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="wrapper">

		<jsp:include page="menu.jsp"></jsp:include>
		<div id="rightContent">
			<h3>Quản lý sản phẩm</h3>
			<a href="form.jsp" style="font-size: 125%">Thêm sản phẩm</a>
		
			<table class="data">
				<tr class="data">
					<th class="data" width="30px">STT</th>
					<th class="data">Mã sản phẩm</th>
					<th class="data">Sản phẩm</th>
					<th class="data" width="75px">Tùy chọn</th>
				</tr>
				<%
					int i = 0;
					for(Product list : product.getListProductByProducttype(Integer.parseInt(idProductType))){
						i++;
				%>
				<tr class="data">
					<td class="data" width="30px"><%=i %></td>
					<td class="data"><%=list.getIdProduct() %></td>
					<td class="data"><%=list.getName() %></td>
					<td class="data" width="75px">
						<center>
							<a href="form.jsp"><img src="mos-css/img/setting.png"></a>&nbsp;&nbsp; | &nbsp;&nbsp;
							<a href="#"><img src="mos-css/img/remove.png"></a>
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