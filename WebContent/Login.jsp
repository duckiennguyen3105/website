
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
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<div class="container">

    	<!-- slider -->
    	<div class="row carousel-holder">
    		<div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="panel panel-default">
				  	<div class="panel-heading">Đăng nhập</div>
				  	<div class="panel-body">
				    	<form action= "LoginServlet" method="post" >
							<div>
				    			<label>Username</label>
							  	<input type="text" class="form-control" placeholder="Tên đăng nhập" name="username" >
							</div>
							<br>	
							<div>
				    			<label>Mật khẩu</label>
							  	<input type="password" class="form-control" placeholder="Mật khẩu" name="password">
							</div>
							<br>
							
							<div>
				    			<p style="color: red"> ${error} </p>
							 
							</div>
						
							<br>
							
							<button type="submit" class="btn btn-success">Đăng nhập
							</button>
							<hr>
							<div>							
							<a href="#" onclick="document.getElementById('id01').style.display='block'"data-dismiss="modal"> Nhấp vào đây để đăng kí nếu chưa có tài khoản </a>
							</div>
				    	</form>
				  	</div>
				</div>
            </div>
            <div class="col-md-4"></div>
        </div>
        <!-- end slide -->
    </div>
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