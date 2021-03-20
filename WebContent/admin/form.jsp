<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/mos-css/mos-style.css"> <!--pemanggilan file css-->

<title>Admin</title>


</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="wrapper">
		
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="rightContent">
	<h3>Form</h3>
	
		<div class="informasi">
		ini adalah notifikasi pertanda informasi
		</div>
		
		<div class="gagal">
		ini adalah notifikasi pertanda gagal
		</div>
		
		<div class="sukses">
		ini adalah notifikasi pertanda sukses
		</div>
	
		<table width="95%">
			<tr><td width="125px"><b>Input text pendek</b></td><td><input type="text" class="pendek"></td></tr>
			<tr><td><b>Input text sedang</b></td><td><input type="text" class="sedang"></td></tr>
			<tr><td><b>Input text panjang</b></td><td><input type="text" class="panjang"></td></tr>
			<tr><td><b>Radio</b></td><td>
				<input type="radio" name="radio" id="radio" value="radio 1">Radio 1
				<input type="radio" name="radio" id="radio" value="radio 2">Radio 2
			</td></tr>
			<tr><td><b>Checkbox</b></td><td>
				<input type="checkbox" name="checkbox" id="checkbox" value="checkbox 1">Checkbox 1<br>
				<input type="checkbox" name="checkbox" id="checkbox" value="checkbox 2">Checkbox 2<br>
				<input type="checkbox" name="checkbox" id="checkbox" value="checkbox 3">Checkbox 3<br>
				<input type="checkbox" name="checkbox" id="checkbox" value="checkbox 4">Checkbox 4<br>
			</td></tr>
			<tr><td><b>Pilihan</b></td><td>
				<select>
					<option selected>-- pilihan --</option>
					<option value="">Pilihan</option>
				</select>
			</td></tr>
			<tr><td><b>Textarea</b></td><td><textarea></textarea></td></tr>
			<tr><td></td><td>
			<input type="button" class="button" value="Button">
			<input type="submit" class="button" value="Submit">
			<input type="reset" class="button" value="Reset">
			</td></tr>
		</table>
	</div>
		<div class="clear"></div>

		<jsp:include page="footer.jsp"></jsp:include>

	</div>
</body>
</html>