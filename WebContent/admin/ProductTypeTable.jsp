<%@page import="connection.model.ProductType"%>
<%@page import="connection.DAO.ProductTypeDAO"%>
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
<%
	ProductTypeDAO producttype = new ProductTypeDAO();
	String idCompany = request.getParameter("idCompany");
	
%>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="wrapper">

		<jsp:include page="menu.jsp"></jsp:include>
		<div id="rightContent">
			<h3>Quản lý loại sản phẩm</h3>
			<a href="form.jsp" style="font-size: 125%">Thêm loại sản phẩm</a>
		
			<table class="data">
				<tr class="data">
					<th class="data" width="30px">STT</th>
					<th class="data">Mã loại sản phẩm</th>
					<th class="data">Loại sản phẩm</th>
					<th class="data" width="75px">Tùy chọn</th>
				</tr>
				<%
					int i =0;
					for(ProductType pro: producttype.getListProductType(Integer.parseInt(idCompany))){
						i++;
				%>
				<tr class="data">
					<td class="data" width="30px"><%=i %></td>
					<td class="data"><%=pro.getIdProductType() %></td>
					<td class="data"><%=pro.getName() %></td>
					<td class="data" width="75px">
						<center>
							<a href="ProductTable.jsp?idProductType=<%=pro.getIdProductType()%>"><img src="mos-css/img/setting.png"></a>&nbsp;&nbsp; | &nbsp;&nbsp;
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