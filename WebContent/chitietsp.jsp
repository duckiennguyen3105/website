<%@page import="java.util.ArrayList"%>
<%@page import="connection.model.Product"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="connection.DAO.ProductDao"%>
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

<title>Vinsmart</title>

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
		ProductDao product = new ProductDao();
		Locale localeVN = new Locale("vi","VN");
		NumberFormat nf = NumberFormat.getInstance(localeVN);
		Product pro = new Product();
		ArrayList<Product> pro2 = product.getListSpecialProduct();
		String idProduct = "";
		if(request.getParameter("product") != null ){
			idProduct = request.getParameter("product");
			pro =product.getDetailProductById(Integer.parseInt(idProduct));
		}
			ArrayList<Product> splienquan = product.getListProductByProducttype(pro.getProducttype_idProductType());
			String price = nf.format(pro.getPrice());	
	%>

<body>
	<jsp:include page="Header.jsp"></jsp:include>


	<!-- Page Content -->
	<div class="container">
		<div class="row">

			<!-- Blog Post Content Column -->
			<div class="col-lg-9">

				<!---------------------------------------------------- Thông tin sản phẩm -------------------------------------------------------------->

				<div class="name-product clearfix">
					<h1 style="margin-bottom: 0px; margin-top: 5px">
						<%=pro.getName() %>
					</h1>
				</div>
				<hr>



				<!-------------------------------------------------Chi tiết ----------------------------------------------------------------------- -->
				<div class="col-md-6 ">
					<div class="mySlides fade-image">
						<div class="numbertext">1 / 3</div>
						<img
							src="${pageContext.request.contextPath}/resources/image/pic5.jpg"
							style="width: 100%">
					</div>

					<div class="mySlides fade-image">
						<div class="numbertext">2 / 3</div>
						<img
							src="${pageContext.request.contextPath}/resources/image/pic6.jpg"
							style="width: 100%">
					</div>

					<div class="mySlides fade-image">
						<div class="numbertext">3 / 3</div>
						<img
							src="${pageContext.request.contextPath}/resources/image/pic7.jpg"
							style="width: 100%">
					</div>



					<a class="prev-product" onclick="plusSlides(-1)">❮</a> <a
						class="next-product" onclick="plusSlides(1)">❯</a>

					<div class="caption-container">
						<p id="caption"></p>
					</div>

					<div class="row space">
						<div class="col-sm-4 full">
							<img class="demo cursor product-center"
								src="${pageContext.request.contextPath}/resources/image/pic5.jpg"
								style="width: 100%; height: 115px" onclick="currentSlide(1)"
								alt="Ipad">
						</div>
						<div class="col-sm-4 full">
							<img class="demo cursor product-center"
								src="${pageContext.request.contextPath}/resources/image/pic6.jpg"
								style="width: 100%; height: 115px" onclick="currentSlide(2)"
								alt="Iphone">
						</div>
						<div class="col-sm-4 full">
							<img class="demo cursor product-center"
								src="${pageContext.request.contextPath}/resources/image/pic7.jpg"
								style="width: 100%; height: 115px" onclick="currentSlide(3)"
								alt="Macbook">
						</div>

					</div>

				</div>



				<div class="col-md-6 single-top-in">
					<div class="pd-price">
						<p>
							<%=price %>
							<strong>₫</strong>
						</p>
					</div>
					<div class="clearfix"></div>

					<h5 class="single-para"><%=pro.getQuantity() %>
						items in stock
					</h5>
					<div class="available">
						<h6>Available Options :</h6>
						<ul>
							<li>Màu: <select>
									<option>Silver</option>
									<option>Black</option>
									<option>Dark Black</option>
									<option>Red</option>
							</select></li>
							<li>Dung lượng:<select>
									<option>32 GB</option>
									<option>64 GB</option>
									<option>128 GB</option>
							</select></li>
							<li>Số lượng:<select>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
							</select></li>
						</ul>
					</div>
					<div class="area_order">
						<a href="CartServlet?command=plus&product=<%=pro.getIdProduct()%>&producttype=<%=pro.getProducttype_idProductType()%>" class="buy_now"> <b>Mua ngay</b> <span>Giao
								hàng tận nơi hoặc mua ngay siêu thị</span>
						</a>
					</div>

				</div>
				<div class="clearfix"></div>





































				<hr>

				<!-- Post Content -->
				<p class="lead">Lorem ipsum dolor sit amet, consectetur
					adipisicing elit. Ducimus, vero, obcaecati, aut, error quam
					sapiente nemo saepe quibusdam sit excepturi nam quia corporis
					eligendi eos magni recusandae laborum minus inventore?</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut,
					tenetur natus doloremque laborum quos iste ipsum rerum obcaecati
					impedit odit illo dolorum ab tempora nihil dicta earum fugiat.
					Temporibus, voluptatibus.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Eos, doloribus, dolorem iusto blanditiis unde eius illum
					consequuntur neque dicta incidunt ullam ea hic porro optio ratione
					repellat perspiciatis. Enim, iure!</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Error, nostrum, aliquid, animi, ut quas placeat totam sunt tempora
					commodi nihil ullam alias modi dicta saepe minima ab quo voluptatem
					obcaecati?</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Harum, dolor quis. Sunt, ut, explicabo, aliquam tenetur ratione
					tempore quidem voluptates cupiditate voluptas illo saepe quaerat
					numquam recusandae? Qui, necessitatibus, est!</p>

				<hr>

				<!-- Blog Comments -->

				<!-- Comments Form -->
				<div class="well">
					<h4>
						Viết bình luận ...<span class="glyphicon glyphicon-pencil"></span>
					</h4>
					<form role="form">
						<div class="form-group">
							<textarea class="form-control" rows="3"></textarea>
						</div>
						<button type="submit" class="btn btn-primary">Gửi</button>
					</form>
				</div>

				<hr>

				<!-- Posted Comments -->

				<!-- Comment -->
				<div class="media">
					<a class="pull-left" href="#"> <img class="media-object"
						src="http://placehold.it/64x64" alt="">
					</a>
					<div class="media-body">
						<h4 class="media-heading">
							Start Bootstrap <small>August 25, 2014 at 9:30 PM</small>
						</h4>
						Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
						scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum
						in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac
						nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
					</div>
				</div>

				<!-- Comment -->
				<div class="media">
					<a class="pull-left" href="#"> <img class="media-object"
						src="http://placehold.it/64x64" alt="">
					</a>
					<div class="media-body">
						<h4 class="media-heading">
							Start Bootstrap <small>August 25, 2014 at 9:30 PM</small>
						</h4>
						Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
						scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum
						in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac
						nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
					</div>
				</div>

			</div>

			<!-- Blog Sidebar Widgets Column -->
			<div class="col-md-3">

				<div class="panel panel-default">
					<div class="panel-heading">
						<b>Sản phẩm liên quan</b>
					</div>
					<div class="panel-body">
						<%
							for(int i = 0; i < splienquan.size()&&i <= 3; i++ ){
								String price_lienquan = nf.format(splienquan.get(i).getPrice());
						%>
						<!-- item -->
						<div class="row" style="margin-top: 10px;">
							<div class="col-md-5">
								<a href="chitietsp.jsp?product=<%=splienquan.get(i).getIdProduct() %>"> <img class="img-responsive"
									src="${pageContext.request.contextPath}/resources/image/320x150.png"
									alt="">
								</a>
							</div>
							<div class="col-md-7">
								<a href="chitietsp.jsp?product=<%=splienquan.get(i).getIdProduct() %>"><b>
								<%=splienquan.get(i).getName() %>
								</b></a>
								<p>
									<%=price_lienquan %> <span>đ</span>
								</p>
							</div>
							<div class="break"></div>
						</div>
						<!-- end item -->
						<%
							}
						%>


					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<b>Sản phẩm nổi bật</b>
					</div>
					<div class="panel-body">

						<!-- item -->
						<%
						for(int i =0 ; i < pro2.size() && i <= 4; i++){
							String price2 = nf.format(pro2.get(i).getPrice());
						%>
						<div class="row" style="margin-top: 10px;">
							<div class="col-md-5">
								<a href="chitietsp.jsp?product=<%=pro2.get(i).getIdProduct() %>"> <img class="img-responsive"
									src="${pageContext.request.contextPath}/resources/image/320x150.png"
									alt="">
								</a>
							</div>
							<div class="col-md-7">
								<a href="chitietsp.jsp?product=<%=pro2.get(i).getIdProduct() %>"><b><%=pro2.get(i).getName() %></b></a>
								<p>
									<%=price2 %> <span> đ</span>
								</p>
							</div>
							<div class="break"></div>
						</div>
						<!-- end item -->
						<%
						}
						%>
						
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
	<script>
            var slideIndex = 1;
            showSlides(slideIndex);

            function plusSlides(n) {
              showSlides(slideIndex += n);
            }

            function currentSlide(n) {
              showSlides(slideIndex = n);
            }

            function showSlides(n) {
              var i;
              var slides = document.getElementsByClassName("mySlides");
              var dots = document.getElementsByClassName("demo");
              var captionText = document.getElementById("caption");
              if (n > slides.length) {slideIndex = 1}
              if (n < 1) {slideIndex = slides.length}
              for (i = 0; i < slides.length; i++) {
                  slides[i].style.display = "none";
              }
              for (i = 0; i < dots.length; i++) {
                  dots[i].className = dots[i].className.replace(" active", "");
              }
              slides[slideIndex-1].style.display = "block";
              dots[slideIndex-1].className += " active";
              captionText.innerHTML = dots[slideIndex-1].alt;
            }
</script>
</body>

</html>
