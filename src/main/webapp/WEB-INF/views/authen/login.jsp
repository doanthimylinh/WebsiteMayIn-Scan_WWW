<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resource/common/authen.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body style="background-image: url(resource/client/images/bg.jpg);">
	<!-- Authen form -->
	<form action="login" method="post">
		<div class="auth-form" style="background-color: white;">
			<div class="auth-form-container">
				<div class="auth-form-header">
					<h3 class="auth-form-title">Đăng nhập</h3>
					<a href="register" class="auth-form-subtitle">Đăng ký</a>
				</div>
				<p style="color: red; margin-top: -15px; margin-left: 3x; margin-bottom: 5px;">${err}</p>
				<div class="auth-form-form" style="margin-top: 15px;">
					<div class="auth-form-group">
						<input class="auth-form-input" type="text" name="account"
							placeholder="Email " required="required" />
					</div>
					<div class="auth-form-group">
						<input class="auth-form-input" type="password" name="password"
							placeholder="Mật khẩu" required="required" />
					</div>
					
				</div>
	
				<div class="auth-form-controls">
					<a href="client/home" class="btn" style="background-color: black;">Quay lại</a>
					<button type="submit" class="btn" style="cursor: pointer; background-color:  black; ">Đăng nhập</button>
				</div>
			</div>
			<br><br>
		</div>
	</form>
</body>
</html>