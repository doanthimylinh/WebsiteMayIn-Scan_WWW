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
<link rel="apple-touch-icon" sizes="76x76"
	href="<c:url value='../resource/admin/assets/img/apple-icon.png'/>">
<link rel="icon" type="image/png" sizes="96x96"
	href="<c:url value='../resource/admin/assets/img/c.png'/>">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
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
						<div class="panel-body">
							<form action="user-delete" method="get">
								<div class="row">
									<div class="col-md-12">
										<div class="panel">
											<div class="panel-heading">
												<h3 class="panel-title">Danh sách người dùng</h3>
												<div class="right">

													<a href="user-create"><span class="label label-success"
														style="font-size: 15px;">Tạo mới</span></a>
												</div>
											</div>
											<div class="panel-body no-padding">
												<table class="table table-striped" style="margin: auto;">
													<thead>
														<tr>

															<th style="display: none;">Mã</th>
															<th style="width: 5%;">Avatar</th>
															<th style="padding-left: 20px;">Email</th>
															<th>Họ tên</th>
															<th>Số điện thoại</th>
															<th style="width: 25%;">Địa chỉ</th>
															<th>Giới tính</th>
															<th style="width: 5%;">Quyền</th>
															<th>Sửa</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${users}" var="user" varStatus="loop">
															<tr>

																<td style="display: none; vertical-align: middle;">${user.userId}</td>
																<td style="vertical-align: middle;"><img
																	src="../download?image=${user.avatar}" alt="Avatar"
																	class="avatar img-circle" style="width: 100%;"></td>
																<td style="vertical-align: middle; padding-left: 25px;">${user.email}</td>
																<td style="vertical-align: middle;">${user.fullname}</td>
																<td style="vertical-align: middle;">${user.phone}</td>
																<td style="vertical-align: middle;">${user.address}</td>
																<td style="vertical-align: middle;""><c:choose>
																		<c:when test="${user.gender}">Nam</c:when>
																		<c:otherwise>Nữ</c:otherwise>
																	</c:choose></td>
																<td style="vertical-align: middle;">${user.role.roleName}</td>
																<td style="vertical-align: middle;"><a
																	href="user-update?userId=${user.userId}"> <span
																		class="label label-warning" style="font-size: 15px;">Sửa</span>
																</a></td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
										
									</div>
									<div id="headline-chart" class="ct-chart"></div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- END OVERVIEW -->
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
		
	</div>
</body>
</body>
</html>