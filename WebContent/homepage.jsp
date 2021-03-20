<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
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

<title>VinSmart</title>

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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flickity.min.css">

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
	Locale localeVN = new Locale("vi","VN");
	NumberFormat nf = NumberFormat.getInstance(localeVN);
	String idProductType = "";
	if (request.getParameter("producttype") != null) {
		idProductType = request.getParameter("producttype");
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
						<h2 style="margin-top: 0px; margin-bottom: 0px;">Tin Tức</h2>
					</div>

					<div class="panel-body">
						<!-- item -->
						<div class="row-item row">
							<h3>
								<a href="#">Category</a>
							</h3>
							<div class="col-md-12 border-right">
								<div class="col-md-3">
									<a href="chitiet.html"> <img class="img-responsive"
										src="${pageContext.request.contextPath}/resources/image/320x150.png"
										alt="">
									</a>
								</div>

								<div class="col-md-9">
									<h3>Project Five</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Aliquid, quo, minima, inventore voluptatum saepe quos
										nostrum provident .</p>
									<a class="btn btn-primary" href="chitiet.html">View Project
										<span class="glyphicon glyphicon-chevron-right"></span>
									</a>
								</div>

							</div>

							<div class="break"></div>
						</div>
						<!-- end item -->
						<!-- item -->
						<div class="row-item row">
							<h3>
								<a href="#">Category</a>

							</h3>
							<div class="col-md-12 border-right">
								<div class="col-md-3">
									<a href="chitiet.html"> <img class="img-responsive"
										src="${pageContext.request.contextPath}/resources/image/320x150.png"
										alt="">
									</a>
								</div>

								<div class="col-md-9">
									<h3>Project Five</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Aliquid, quo, minima, inventore voluptatum saepe quos
										nostrum provident .</p>
									<a class="btn btn-primary" href="chitiet.html">View Project
										<span class="glyphicon glyphicon-chevron-right"></span>
									</a>
								</div>

							</div>

							<div class="break"></div>
						</div>
						<!-- end item -->
						<!-- item -->
						<div class="row-item row">
							<h3>
								<a href="#">Category</a>

							</h3>
							<div class="col-md-12 border-right">
								<div class="col-md-3">
									<a href="chitiet.html"> <img class="img-responsive"
										src="${pageContext.request.contextPath}/resources/image/320x150.png"
										alt="">
									</a>
								</div>

								<div class="col-md-9">
									<h3>Project Five</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Aliquid, quo, minima, inventore voluptatum saepe quos
										nostrum provident .</p>
									<a class="btn btn-primary" href="chitiet.html">View Project
										<span class="glyphicon glyphicon-chevron-right"></span>
									</a>
								</div>

							</div>

							<div class="break"></div>
						</div>
						<!-- end item -->
						<!-- item -->
						<div class="row-item row">
							<h3>
								<a href="#">Category</a>

							</h3>
							<div class="col-md-12 border-right">
								<div class="col-md-3">
									<a href="chitiet.html"> <img class="img-responsive"
										src="${pageContext.request.contextPath}/resources/image/320x150.png"
										alt="">
									</a>
								</div>

								<div class="col-md-9">
									<h3>Project Five</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Aliquid, quo, minima, inventore voluptatum saepe quos
										nostrum provident .</p>
									<a class="btn btn-primary" href="chitiet.html">View Project
										<span class="glyphicon glyphicon-chevron-right"></span>
									</a>
								</div>

							</div>

							<div class="break"></div>
						</div>
						<!-- end item -->
						<!-- item -->


					</div>
				</div>
			</div>
		</div>
		<div class="space20"></div>
		<!-- /.row -->
		

		<div class="row">
            <div class="panel panel-default">
                
                <div class="panel-heading" style="background-color:#f06292; color:white;" >
                        <h2 style="margin-top:0px; margin-bottom:0px;"> Sản phẩm nổi bật</h2>
                    </div>    
                    
                        <div class="panel-body">
                            <div class="carousel" data-flickity= '{"groupCells": 5,"freeScroll": true, "wrapAround": true}'>
                    			<%
                    				for(Product pro: product.getListSpecialProduct()){
                    					String price = nf.format(pro.getPrice());
                    			%>			 
                                <div class="carousel-cell">
                                    <a href="chitietsp.jsp?product=<%=pro.getIdProduct() %>">
                                        <img src="${pageContext.request.contextPath}/resources/image/pic1.jpg" class="specialproduct-center">
                                    </a>
                                    <div class=" text-center ">
                                        <h3>
                                            <a href="chitietsp.jsp?product=<%=pro.getIdProduct() %>"><%=pro.getName() %></a>
                                        </h3>
                                    </div>
                                        <div class="text-center">   
                                            <span ><%=price %><span > ₫</span>
                                            </span>
                                        </div>
                                </div>
                                <%
                    				}
                                %>
                                
                                
                                
                                
                               
                            
                        </div>
                        
                        
                    </div>
                
            </div>     
        </div>

	</div>





	<!-- end Page Content -->

	<jsp:include page="Footer.jsp"></jsp:include>
	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/my.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/flickity.pkgd.min.js"></script>

</body>

</html>
