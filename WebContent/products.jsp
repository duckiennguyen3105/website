<%@page import="connection.model.Cart"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="connection.DAO.ProductDao"%>
<%@page import="connection.model.Product"%>
<%@page import="connection.model.Company"%>
<%@page import="connection.DAO.CompanyDAO"%>
<%@page import="connection.model.ProductType"%>
<%@page import="connection.DAO.ProductTypeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Thông tin</title>

<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/shop-homepage.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/my.css"
	rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<%
	ProductTypeDAO producttype = new ProductTypeDAO();
	CompanyDAO company = new CompanyDAO();
	ProductDao product = new ProductDao();
	Locale localeVN = new Locale("vi", "VN");
	NumberFormat nf = NumberFormat.getInstance(localeVN);
	String idProductType = "";
	if (request.getParameter("producttype") != null) {
		idProductType = request.getParameter("producttype");
	}
	Cart cart = (Cart) session.getAttribute("cart");
	if (session.getAttribute("cart") == null) {
		cart = new Cart();
		session.setAttribute("cart", cart);
	}
%>
<body>

	<jsp:include page="Header.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">

		<!-- slider -->
		<div class="carousel slide" data-ride="carousel" id="myCarousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<!--------------------------------- Wrap-control ----------------------------------------->
			<div class="carousel-inner">
				<div class="item active">
					<img
						src="${pageContext.request.contextPath}/resources/image/DT1.jpg"
						alt="SuaChuaDT" style="height: 400px;" class="product-center">
					<div class="carousel-caption">
						<h3 style="color: #9932CC">Thế giới điện thoại</h3>
						<p style="color: #9932CC">Bạn cần điện thoại gì, chúng tôi đều
							có</p>
					</div>
				</div>
				<div class="item">
					<img
						src="${pageContext.request.contextPath}/resources/image/DT2.png"
						alt="DT" style="height: 400px;" class="product-center">
					<div class="carousel-caption">
						<h3 style="color: #ADFF2F">Chuyên về Iphone</h3>
						<p style="color: #ADFF2F">Luôn nhập sản phẩm chất lượng tốt về
							thị trường</p>
					</div>
				</div>
				<div class="item">
					<img
						src="${pageContext.request.contextPath}/resources/image/DT3.png"
						alt="DTKhac" style="height: 400px;" class="product-center">
					<div class="carousel-caption">
						<h3 style="color: #FFFF00">Bảo hành và sửa chữa tốt</h3>
						<p style="color: #FFFF00">Thời hạn bảo hành kéo dài đến 12
							tháng (kể từ ngày mua)</p>
					</div>
				</div>
			</div>
			<!----------------------------- Next & Previous ----------------------------  -->

			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>

		</div>
		<!-- end slide -->

		<div class="space20"></div>


		<div class="row " style="background-color: #fce4ec">
			<div class="col-md-3 ">
				<div class="panel panel-default">
					<div class="panel-heading"
						style="background-color: #f06292; color: white;">
						<h2 style="margin-top: 0px; margin-bottom: 0px;">Danh mục
							hãng</h2>
					</div>
					<div class="panel-body">
						<div class="menu-top">
							<ul id="menu_ul">
								<%
									for (Company c : company.getListCompany()) {
								%>
								<li style="display: block; background-color: #dddddd;"
									class="dropdown"><a href="#" id="menu_li"
									class="dropdown-toggle" data-toggle="dropdown"> <%=c.getName()%>
										<span style="float: right;"
										class="glyphicon glyphicon-menu-right"></span>
								</a>
									<ul class="dropdown-menu ">
										<%
											for (ProductType p : producttype.getListProductType(c.getIdCompany())) {
										%>
										<li><a
											href="products.jsp?producttype=<%=p.getIdProductType()%>"><%=p.getName()%></a></li>
										<%
											}
										%>
									</ul></li>
								<%
									}
								%>
							</ul>
						</div>
					</div>
				</div>
			</div>


			<div class="col-md-9">
				<div class="panel panel-default">
					<div class="panel-heading"
						style="background-color: #f06292; color: white;">
						<h2 style="margin-top: 0px; margin-bottom: 0px;">Giới thiệu</h2>
					</div>

					<div class="panel-body">
						<!-- item -->

						<div class="products">
							<div class=" top-products">
								<%
									if (request.getParameter("producttype") != null) {
										for (Product pro : product.getListProductByProducttype(Integer.parseInt(idProductType))) {
											String str = nf.format(pro.getPrice());
								%>
								<div class="col-md-3 md-col">
									<div class="col-md">
										<a href="chitietsp.jsp?product=<%=pro.getIdProduct()%>"
											class="compare-in"><img
											src="${pageContext.request.contextPath}/resources/image/pic3.jpg"
											alt="" /> </a>
										<div class="top-content">
											<h4>
												<a href="chitietsp.jsp?product=<%=pro.getIdProduct()%>"
													class="center"><%=pro.getName()%></a>
											</h4>
											<p class="price center">
												<%=str%>
												<span>đ</span>
											</p>

											<a
												href="CartServlet?command=plus&product=<%=pro.getIdProduct()%>&producttype=<%=pro.getProducttype_idProductType()%>"
												class="btn btn-warning"> Thêm vào giỏ </a>
										</div>
									</div>
								</div>
								<%
									}
									} else {
										for (Product pro : product.getListProductByProducttype()) {
											String str = nf.format(pro.getPrice());
								%>
								<div class="col-md-3 md-col">
									<div class="col-md">
										<a href="chitietsp.jsp?product=<%=pro.getIdProduct()%>"
											class="compare-in"><img
											src="${pageContext.request.contextPath}/resources/image/pic3.jpg"
											alt="" /> </a>
										<div class="top-content">
											<h4>
												<a href="chitietsp.jsp?product=<%=pro.getIdProduct()%>"
													class="center"><%=pro.getName()%></a>
											</h4>
											<p class="price center">
												<%=str%>
												<span>đ</span>
											</p>
											<a
												href="CartServlet?command=plus&product=<%=pro.getIdProduct()%>"
												class="btn btn-warning"> Thêm vào giỏ </a>





										</div>
									</div>
								</div>


								<%
									}
									}
								%>
							</div>


						</div>




						<div class="row text-center">
							<div class="col-lg-12">
								<ul class="pagination">
									<li><a href="#">«</a></li>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">»</a></li>
								</ul>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- end Page Content -->
	<jsp:include page="Footer.jsp"></jsp:include>

	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/my.js"></script>

</body>

</html>
