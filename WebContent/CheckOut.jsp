<%@page import="connection.model.User"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="connection.model.Items"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="connection.model.Cart"%>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flickity.min.css">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<%
	Locale localeVN = new Locale("vi","VN");
	NumberFormat nf = NumberFormat.getInstance(localeVN);
	Cart cart = (Cart) session.getAttribute("cart");
	User user = (User) session.getAttribute("user");
	if(user == null){
		response.sendRedirect("Login.jsp");
	}
	if (session.getAttribute("cart") == null) {
		cart = new Cart();
		session.setAttribute("cart", cart);
	}
%>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<div class="container">
		<form action="PayServlet">
		<table id="cart" class="table table-hover table-condensed">
			<thead>
				<tr>
					<th style="width: 50%">Product</th>
					<th style="width: 10%">Price</th>
					<th style="width: 8%">Quantity</th>
					<th style="width: 22%" class="text-center">Subtotal</th>
					<th style="width: 10%"></th>
				</tr>
			</thead>
			<tbody>
				<%
					for(Entry<Integer, Items> list: cart.getCartItems().entrySet()){
						String price = nf.format(list.getValue().getProduct().getPrice());
						String totalPrice = nf.format(list.getValue().getNumberProduct()*list.getValue().getProduct().getPrice());
				%>
				<tr>
					<td data-th="Product">
						<div class="row">
							<div class="col-sm-2 hidden-xs">
								<img src="http://placehold.it/100x100" alt="..."
									class="img-responsive" />
							</div>
							<div class="col-sm-10">
								
							<a href="">	<h3 class="nomargin"> <%=list.getValue().getProduct().getName() %> </h3></a>
							</div>
						</div>
					</td>
					<td data-th="Price"><%=price %><span>đ</span></td>
					<td data-th="Quantity"><input type="number"
						readonly="readonly" class="form-control text-center" value="<%=list.getValue().getNumberProduct() %>">
						<a href="CheckOutServlet?command=minus&product=<%=list.getValue().getProduct().getIdProduct() %>" class="btn btn-warning btn-sm"> <span
							class="glyphicon glyphicon-minus"></span>
					</a> <a href="CheckOutServlet?command=plus&product=<%=list.getValue().getProduct().getIdProduct() %>" class="btn btn-warning btn-sm"> <span
							class="glyphicon glyphicon-plus"></span>
					</a></td>
					<td data-th="Subtotal" class="text-center"><%=totalPrice %><span>đ</span></td>
					<td class="actions" data-th=""><a href="CheckOutServlet?command=remove&product=<%=list.getValue().getProduct().getIdProduct() %>"
						class="btn btn-danger btn-sm"> <i class="fa fa-trash-o"></i>
					</a></td>
				</tr>
			<%
				} 
			%>

			</tbody>
			<%String TotalPrice = nf.format(cart.sumTotal()); %>
			<tfoot>
				
				<tr>
					<td><a href="products.jsp" class="btn btn-warning"><i
							class="fa fa-angle-left"></i> Continue Shopping</a></td>
					<td colspan="1" class="hidden-xs"></td>
					<td>
						<span>Payment *</span>
						<select name="payment">
							<option value="live">Live</option>
							<option value="bank transfer">Bank Transfer</option>
						</select>
					</td>
					<td class="hidden-xs text-center"><strong>Total
							<%=TotalPrice %><span>đ</span></strong></td>
					<td><button type="submit"
						
						class="btn btn-success btn-block">Checkout <i
							class="fa fa-angle-right"></i></button></td>
				</tr>
			</tfoot>
		</table>
		</form>
		
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
