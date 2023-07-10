<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="../resource/client/images/y.png">
<title>Siêu thị máy in</title>
<link href="../resource/client/css/bootstrap.css" rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,500italic,100italic,100'
	rel='stylesheet' type='text/css'>
<link href="../resource/client/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="../resource/client/css/flexslider.css"
	type="text/css" media="screen" />
<link href="../resource/client/css/sequence-looptheme.css"
	rel="stylesheet" media="all" />
<link href="../resource/client/css/style.css" rel="stylesheet">
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

<body id="home">
	<div class="wrapper">
		<jsp:include page="common/header.jsp" />
		<div class="clearfix"></div>
		<div class="container_fullwidth">
			<div class="container">
				<div class="row">
					<div class="checkout-page">
						<ol class="checkout-steps">
							<li class="steps"><a href="my-order"><div
										class="step-title">01. Tất cả đơn đặt hàng</div></a></li>
							<li class="steps active">
								<div style="display: flex;">
									<span class="step-title">02. Thông tin tài khoản </span>
									<c:if test="${messageError != null}">
										<span
											style="width: 90%; margin-top: 15px; font-size: 15px; color: red;">${messageError}</span>
									</c:if>
									<c:if test="${messageSuccess != null}">
										<span
											style="width: 100%; margin-top: 15px; font-size: 15px; color: green;">${messageSuccess}</span>
									</c:if>
								</div>
								<div class="step-description">
									<div class="row">
										<div class="col-md-6 col-sm-6">
											<form action="profile-update" method="post"
												onsubmit="return validateProfifeUpdate()">
												<div class="your-details">
													<h5>Thông tin cá nhân</h5>
													<input type="hidden" name="userId"
														value="${sessionScope.user.userId}" />
													<div class="form-row">
														<label class="lebel-abs"> Email <strong
															class="red"> * </strong>
														</label> <input type="email" class="input namefild" name="email"
															id="email" readonly="readonly" required="required"
															value="${sessionScope.user.email}" />
													</div>
													<span id="txtEmailProfile"
														style="font-size: 15px; float: left; color: red;">
													</span>

													<div class="form-row">
														<label class="lebel-abs"> Họ tên <strong
															class="red"> * </strong>
														</label> <input type="text" class="input namefild" name="fullname"
															required="required" value="${sessionScope.user.fullname}" />
													</div>
													<div class="form-row">
														<label class="lebel-abs"> Số điện thoại <strong
															class="red"> * </strong>
														</label> <input type="number" class="input namefild" name="phone"
															required="required" value="${sessionScope.user.phone}">
													</div>
													<div class="form-row">
														<label class="lebel-abs"> Địa chỉ <strong
															class="red"> * </strong>
														</label> <input type="text" class="input namefild" name="address"
															required="required" value="${sessionScope.user.address}">
													</div>
													<button type="submit">Cập nhật thông tin</button>
												</div>
											</form>
										</div>
										<div class="col-md-6 col-sm-6">
											<form action="change-password" method="post"
												onsubmit="return validatePassProfile()">
												<div class="your-details">
													<h5>Mật khẩu</h5>
													<div class="form-row">
														<label class="lebel-abs"> Mật khẩu cũ <strong
															class="red"> * </strong>
														</label> <input type="password" class="input namefild"
															name="oldpassword" required="required">
													</div>
													<div class="form-row">
														<label class="lebel-abs"> Mật khẩu mới <strong
															class="red"> * </strong>
														</label> <input type="password" class="input namefild"
															id="newpassword" name="newpassword" required="required">
													</div>
													<span id="txtPassProfile"
														style="font-size: 15px; float: left; color: red;">
													</span>

													<div class="form-row">
														<label class="lebel-abs"> Nhập lại mật khẩu <strong
															class="red"> * </strong>
														</label> <input type="password" class="input cpass"
															id="repassword" name="repassword" required="required">
													</div>
													<span id="txtRePassProfile"
														style="font-size: 15px; float: left; color: red;">
													</span>

													<button type="submit">Thay đổi mật khẩu</button>
												</div>
											</form>

										</div>
									</div>
							</li>
						</ol>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="clearfix"></div>
	<jsp:include page="common/footer.jsp" />
	</div>
	<script type="text/javascript"
		src="../resource/client/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript"
		src="../resource/client/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript"
		src="../resource/client/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="../resource/client/js/jquery.sequence-min.js"></script>
	<script type="text/javascript"
		src="../resource/client/js/jquery.carouFredSel-6.2.1-packed.js"></script>
	<script defer src="../resource/client/js/jquery.flexslider.js"></script>
	<script type="text/javascript"
		src="../resource/client/js/script.min.js"></script>
</body>

</html>