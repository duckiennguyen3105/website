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
			<h3>Dashboard</h3>
			<div class="quoteOfDay">
				<b>Quote of the day :</b><br> <i style="color: #5b5b5b;">"If
					you think you can, you really can"</i>
			</div>
			<div class="shortcutHome">
				<a href=""><img src="mos-css/img/posting.png"><br>Tambah
					Posting</a>
			</div>
			<div class="shortcutHome">
				<a href=""><img src="mos-css/img/photo.png"><br>Upload
					Foto</a>
			</div>
			<div class="shortcutHome">
				<a href=""><img src="mos-css/img/halaman.png"><br>Tambah
					Halaman</a>
			</div>
			<div class="shortcutHome">
				<a href=""><img src="mos-css/img/template.png"><br>Pengaturan
					Template</a>
			</div>
			<div class="shortcutHome">
				<a href=""><img src="mos-css/img/quote.png"><br>Tambah
					QOD</a>
			</div>
			<div class="shortcutHome">
				<a href=""><img src="mos-css/img/bukutamu.png"><br>Data
					Buku Tamu</a>
			</div>

			<div class="clear"></div>

			<div id="smallRight">
				<h3>Informasi web anda</h3>
				<table
					style="border: none; font-size: 12px; color: #5b5b5b; width: 100%; margin: 10px 0 10px 0;">
					<tr>
						<td style="border: none; padding: 4px;">Jumlah posting</td>
						<td style="border: none; padding: 4px;"><b>12</b></td>
					</tr>
					<tr>
						<td style="border: none; padding: 4px;">Jumlah kategori</td>
						<td style="border: none; padding: 4px;"><b>12</b></td>
					</tr>
					<tr>
						<td style="border: none; padding: 4px;">Jumlah komentar
							diterbitkan</td>
						<td style="border: none; padding: 4px;"><b>12</b></td>
					</tr>
					<tr>
						<td style="border: none; padding: 4px;">Jumlah komentar belum
							diterbitkan</td>
						<td style="border: none; padding: 4px;"><b>12</b></td>
					</tr>
					<tr>
						<td style="border: none; padding: 4px;">Jumlah foto dalam
							galeri</td>
						<td style="border: none; padding: 4px;"><b>12</b></td>
					</tr>
					<tr>
						<td style="border: none; padding: 4px;">Jumlah data buku tamu</td>
						<td style="border: none; padding: 4px;"><b>12</b></td>
					</tr>
				</table>
			</div>
			<div id="smallRight">
				<h3>Statistik pengunjung web</h3>

				<table
					style="border: none; font-size: 12px; color: #5b5b5b; width: 100%; margin: 10px 0 10px 0;">
					<tr>
						<td style="border: none; padding: 4px;">Pengunjung online</td>
						<td style="border: none; padding: 4px;"><b>12</b></td>
					</tr>
					<tr>
						<td style="border: none; padding: 4px;">Pengunjung hari ini</td>
						<td style="border: none; padding: 4px;"><b>12</b></td>
					</tr>
					<tr>
						<td style="border: none; padding: 4px;">Total pengunjung</td>
						<td style="border: none; padding: 4px;"><b>12</b></td>
					</tr>
					<tr>
						<td style="border: none; padding: 4px;">Hit hari ini</td>
						<td style="border: none; padding: 4px;"><b>12</b></td>
					</tr>
					<tr>
						<td style="border: none; padding: 4px;">Total hit</td>
						<td style="border: none; padding: 4px;"><b>12</b></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="clear"></div>

		<jsp:include page="footer.jsp"></jsp:include>

	</div>
</body>
</html>