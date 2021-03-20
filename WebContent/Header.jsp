<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="connection.model.Items"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="connection.model.Cart"%>
<%@page import="connection.model.User"%>
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
	Locale localeVN = new Locale("vi", "VN");
	NumberFormat nf = NumberFormat.getInstance(localeVN);
	User users = null;
	if (session.getAttribute("user") != null) {
		users = (User) session.getAttribute("user");
	}
	Cart cart = (Cart) session.getAttribute("cart");
	if (session.getAttribute("cart") == null) {
		cart = new Cart();
		session.setAttribute("cart", cart);
	}
%>

<body>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse boxshadow navbar-fixed-top"
		role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="homepage.jsp">VinSmart</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="products.jsp">Sản phẩm</a></li>
				</ul>

				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Tìm kiếm</button>
				</form>

				<ul class="nav navbar-nav pull-right">
					<%
						if (users != null) {
					%>
					<li><a>Chào,<%=users.getName()%>
					</a></li>
					<%
						} else {
					%>

					<li><a href="#"
						onclick="document.getElementById('id01').style.display='block'">
							<span class="glyphicon glyphicon-user"></span> Sign Up
					</a> 
					
					<!-- ----------------Modal Đăng kí --------------------->
						<div id="id01" class="modal">
							<span
								onclick="document.getElementById('id01').style.display='none'"
								class="close" title="Close Modal">&times;</span>
							<form class="modal-content animate" method="POST" name="register"
								action="UserServlet">
								<div class="container-fluid">
									<h1>Đăng Kí</h1>
									<p>Hãy điền thông tin để đăng kí</p>
									<hr>
									<div>
										<label for="username"><b>Tên đăng nhập</b></label> <input
											type="text" name="username" id="username"
											placeholder="Tên đăng nhập"> <span id="user-result"></span>
									</div>
									<div>
										<label for="confirm_pass"><b>Mật khẩu</b></label> <input
											type="password" name="password" id="password"
											placeholder="Mật khẩu">
									</div>
									<div>
										<label for="confirm_pass"><b>Nhập lại mật khẩu</b></label> <input
											type="password" name="confirm_pass" id="confirm_pass"
											placeholder="Nhập lại mật khẩu">
									</div>
									<div>
										<label for="phone"><b>Số điện thoại</b></label> <input
											type="text" name="phone" id="phone"
											placeholder="Số điện thoại">
									</div>
									<div>
										<label for="address"><b>Địa chỉ</b></label> <input type="text"
											name="address" placeholder="Địa chỉ">

									</div>
									<div class="clearfix">
										<button type="button"
											onclick="document.getElementById('id01').style.display='none'"
											class="cancelbtn">Cancel</button>
										<button type="submit" id="submit" class="signupbtn">Sign
											Up</button>
									</div>
								</div>
							</form>
						</div> <script>
							// Get the modal
							var modal = document.getElementById('id01');

							// When the user clicks anywhere outside of the modal, close it
							window.onclick = function(event) {
								if (event.target == modal) {
									modal.style.display = "none";
								}
							}
						</script></li>
					<%
						}
					%>

					<li>
						<%
							if (users != null) {
						%> <a href="UserServlet"> <span
							class="glyphicon glyphicon-log-out"></span> Logout

					</a>
					<li>
						<ul class="icon1 sub-icon1">

							<li><div class="cart">
									<a href="#" class="cart-in"> </a> <span> <%=cart.countItems()%>
									</span>
								</div>
								<ul class="sub-icon1 ">
									<h3>
										Recently added items(<%=cart.countItems()%>)
									</h3>
									<div class="shopping_cart">

										<%
											for (Entry<Integer, Items> list : cart.getCartItems().entrySet()) {
													String price = nf.format(list.getValue().getProduct().getPrice());
										%>
										<div class="cart_box">
											<div class="message">
												<a
													href="CartServlet?command=remove&product=<%=list.getValue().getProduct().getIdProduct()%>">
													<div class="alert-close"></div>
												</a>
												<div class="list_img">
													<img
														src="${pageContext.request.contextPath}/resources/image/14.jpg"
														class="img-responsive" alt="">
												</div>
												<div class="list_desc">
													<h4>
														<a href="chitietsp.jsp?product=<%=list.getValue().getProduct().getIdProduct()%>"><%=list.getValue().getProduct().getName() %></a>
													</h4>
													<%=list.getValue().getNumberProduct()%>
													x<span class="actual"> <%=price%> <span>đ</span></span>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<%
											}
										%>
									</div>
									<%
										String TotalPrice = nf.format(cart.sumTotal());
									%>
									<div class="total">
										<div class="total_left">Cart total :</div>
										<div class="total_right">
											<%=TotalPrice%>
											<span>đ</span>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="login_buttons">
										<div class="check_button">
											<a href="CheckOutServlet">Check out</a>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="clearfix"></div>
								</ul></li>
						</ul>
					</li>
					<%
						} else {
					%>
					<a href="LoginServlet"> <span
						class="glyphicon glyphicon-log-in"></span> Login
					</a>
					<%
						}
					%>
					<!------------------ Modal Đăng nhập ---------------->


					</li>

				</ul>
			</div>



			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
</body>

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
		if (n > slides.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = slides.length
		}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " active";
		captionText.innerHTML = dots[slideIndex - 1].alt;
	}
</script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"
	type="text/javascript"></script>



<script type="text/javascript">
	var inputs = document.forms['register'].getElementsByTagName('input');
	var run_onchange = false;
	function valid() {
		var errors = false;
		for (var i = 0; i < inputs.length; i++) {
			var value = inputs[i].value;
			var id = inputs[i].getAttribute('id');

			// Tạo phần tử span lưu thông tin lỗi
			var span = document.createElement('span');
			// Nếu span đã tồn tại thì remove
			var p = inputs[i].parentNode;
			if (p.lastChild.nodeName == 'SPAN') {
				p.removeChild(p.lastChild);
			}

			// Kiểm tra rỗng
			if (value == '') {
				span.innerHTML = 'Thông tin được yêu cầu';
			} else {
				// Kiểm tra các trường hợp khác
				// Kiểm tra password
				if (id == 'password') {
					if (value.length < 6) {
						span.innerHTML = 'Password phải từ 6 ký tự';
					}
					var pass = value;
				}
				// Kiểm tra password nhập lại
				if (id == 'confirm_pass' && value != pass) {
					span.innerHTML = 'Password nhập lại chưa đúng';
				}
				// Kiểm tra số điện thoại
				if (id == 'phone' && isNaN(value) == true) {
					span.innerHTML = 'Số điện thoại phải là kiểu số';
				}
			}
			if (id == 'phone') {
				if (value.length > 12) {
					span.innerHTML = 'Điện thoại phải dưới 11 số';
				}
				var phone = value;
			}
			// Nếu có lỗi thì chèn span vào hồ sơ, chạy onchange, submit return false, highlight border
			if (span.innerHTML != '') {
				inputs[i].parentNode.appendChild(span);
				errors = true;
				run_onchange = true;
				inputs[i].style.border = '1px solid #c6807b';
				inputs[i].style.background = '#fffcf9';
			}
		}// end for

		if (errors == false) {
			alert('Thông tin hợp lệ, có thể đăng kí');
		}
		return !errors;
	}// end valid()

	// Chạy hàm kiểm tra valid()
	var register = document.getElementById('submit');
	register.onclick = function() {
		return valid();
	}

	// Kiểm tra lỗi với sự kiện onchange -> gọi lại hàm valid()
	for (var i = 0; i < inputs.length; i++) {
		var id = inputs[i].getAttribute('id');
		inputs[i].onchange = function() {
			if (run_onchange == true) {
				this.style.border = '1px solid #999';
				this.style.background = '#fff';
				valid();
			}
		}
	}// end for
	$(document)
			.ready(
					function() {
						var x_timer;
						$("#username").keyup(function(e) {
							clearTimeout(x_timer);
							var user_name = $(this).val();
							x_timer = setTimeout(function() {
								check_username_ajax(user_name);
							}, 1000);
						});

						function check_username_ajax(username) {
							$("#user-result")
									.html(
											'<img style="width: 1%" src="resources/img/ajax-loader.gif" />');
							$.post('CheckUserServlet', {
								'username' : username
							}, function(data) {
								$("#user-result").html(data);
							});
						}
					});
</script>
</html>