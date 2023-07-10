<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Siêu thị máy in</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- VENDOR CSS -->
<link rel="stylesheet"
	href="<c:url value='../resource/admin/assets/vendor/bootstrap/css/bootstrap.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='../resource/admin/assets/vendor/font-awesome/css/font-awesome.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='../resource/admin/assets/vendor/linearicons/style.css'/>">
<link rel="stylesheet"
	href="<c:url value='../resource/admin/assets/vendor/chartist/css/chartist-custom.css'/>">
<!-- MAIN CSS -->
<link rel="stylesheet"
	href="<c:url value='../resource/admin/assets/css/main.css'/>">
<link rel="stylesheet"
	href="<c:url value='../resource/admin/assets/css/demo.css'/>">
<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
	rel="stylesheet">

<!-- ICONS -->

<link rel="icon" type="image/png" sizes="96x96"
	href="<c:url value='../resource/admin/assets/img/c.png'/>">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<c:url value='../resource/css/style.css'/>">
<style>
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

input[type=number] {
	-moz-appearance: textfield;
}
</style>
</head>
<body>
	<!-- WRAPPER -->
	<div id="wrapper">

		<jsp:include page="../common/header.jsp" />

		<jsp:include page="../common/category.jsp" />

		<!-- MAIN -->
		<!-- MAIN CONTENT -->
		<div class="main">
			<div class="main-content">
				<div class="container-fluid">
					<!-- OVERVIEW -->
					<div class="panel panel-headline">
						<div class="panel-heading"
							style="display: flex; justify-content: space-between;">
							<h3 class="panel-title">Tạo mới tài khoản</h3>
							<span style="color: red; font-weight: bold; font-size: 18px;">${message}</span>
							<a class="btn btn-warning" href="user-list"
								style="background-color: #D9534F; padding: 2px 10px; text-decoration: none; border: none; margin-right: 10px; height: 25px;">Quay
								lại</a>
						</div>
						<form action="user-create" method="post"
							enctype="multipart/form-data"
							>
							<div class="row"
								style="display: flex; justify-content: space-between;">
								<table
									style="margin: auto; margin-left: 45px; margin-right: 50px;"
									class="col-md-6">
									<tr>
										<th>Email:</th>
										<td><input required="required" type="email" id="email"
											class="form-control" style="height: 30px;"
											placeholder="Nhập Email..." name="email" /></td>
										<td><span id="txtEmailUserProfile"
											style="font-size: 15px; float: left; color: red;"> </span></td>
									</tr>


									<tr>
										<th>Họ tên:</th>
										<td><input required="required" type="text"
											class="form-control" style="height: 30px;"
											placeholder="Nhập họ tên..." name="fullName" /></td>
									</tr>

									<tr>
										<th>Giới tính:</th>
										<td><input type="radio" checked="checked" name="gender"
											value="true" style="cursor: pointer;" /> <span
											style="margin-right: 100px;">Nam</span> <input type="radio"
											name="gender" value="false" style="cursor: pointer;" /> Nữ</td>
									</tr>
									<tr>
										<th>Số điện thoại:</th>
										<td><input required="required" type="number" id="phone"
											class="form-control" style="height: 30px;"
											placeholder="Nhập số điện thoại..." name="phone" /></td>
											

									</tr>
									<tr>
										<th>Địa chỉ:</th>
										<td><textarea required="required" class="form-control"
												placeholder="Nhập địa chỉ..." rows="4" name="address"></textarea></td>
									</tr>
									<tr>
										<th></th>
										<td></td>
									</tr>
								</table>
								<table style="margin: auto; margin-right: 30px;"
									class="col-md-6">
									<tr>
										<th>Quyền:</th>
										<td><select name="roleId">
												<c:forEach items="${roles}" var="role">
													<option value="${role.roleId}">${role.roleName}</option>
												</c:forEach>
										</select></td>
									</tr>
									<tr>
										<th>Ảnh đại diện:</th>
										<td><input type="file" name="avatarFile" /></td>
									</tr>
									<tr>
										<th>Mật khẩu:</th>
										<td><input required="required" type="password"
											id="password" class="form-control" style="height: 30px;"
											placeholder="Nhập mật khẩu..." name="password" /></td>
										<td><span id="txtPassUserProfile"
											style="font-size: 15px; float: left; color: red;"> </span></td>
									</tr>


									<tr>
										<th>Nhập lại mật khẩu:</th>
										<td><input required="required" type="password"
											id="repassword" class="form-control" style="height: 30px;"
											placeholder="Nhập lại mật khẩu..." name="repassword" /></td>
										<td><span id="txtRePassUserProfile"
											style="font-size: 15px; float: left; color: red;"> </span></td>
									</tr>


									<tr>
										<th></th>
										<td>
											<button type="submit" class="btn btn-primary"
												style="font-weight: bold;">Lưu</button>
										</td>
									</tr>
									<tr>
										<th></th>
										<td></td>
									</tr>
								</table>
							</div>
						</form>
					</div>

				</div>
				<div id="headline-chart" class="ct-chart"></div>
			</div>

			<!-- END OVERVIEW -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
	</div>


</body>
</html>