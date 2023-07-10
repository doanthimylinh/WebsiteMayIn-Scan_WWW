<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="images/y.png">
<title>Siêu thị máy in</title>
</head>
<body id="home">
	<div class="header">
		<div class="container">
			<div class="row">
				<div class="col-md-2 col-sm-2">
					<div class="logo">
						<a href="home"><img
							src="../resource/client/images/logo.png" alt="FlatShop"></a>
					</div>
				</div>
				<div class="col-md-10 col-sm-10">
					<div class="header_top">
						<div class="row">
							<div class="col-md-9">
								<ul class="option">
									<li id="search" class="search">
										<form action="search" method="get">
											<input class="search-submit" type="submit" value="">
											<input class="search-input" placeholder="Tìm kiếm..."
												type="text" value="" name="text">
										</form>
									</li>

									<li class="option-cart""><a href="cart" class="cart-icon">Giỏ
											hàng <span class="cart_no">${sessionScope.totalQuantity}</span>
									</a></li>
								</ul>
							</div>
							<div class="col-md-3">
								<c:if test="${sessionScope.user == null}">
									<ul class="usermenu">
										<li><a href="../login" class="log">Login</a></li>
										<li><a href="../register" class="reg">Đăng ký</a></li>
									</ul>
								</c:if>

								<c:if test="${sessionScope.user != null}">
									<ul class="usermenu" style="display: flex;">
										<li><a href="profile"><img class="img-circle"
												src="../download?image=${sessionScope.user.avatar}"
												style="width: 26px; margin-top: -4px;"> </a><a
											href="profile" style="margin-left: -22px;"><span
												style="margin-left: 5px; color: white; font-size: 14px;">${sessionScope.username}</span></a></li>
										<li><i
											style="font-size: 22px; margin-top: -2px; color: #F7544A;"
											class="fa">&#xf011;</i> <a
											style="position: absolute; margin-left: -18px;"
											href="../logout">Logout</a></li>
									</ul>
								</c:if>

							</div>
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="header_bottom">
						<div class="navbar-collapse">
							<ul class="nav">
								<li><a style="text-transform: none;" href="home">Home</a></li>
								<c:forEach items="${sessionScope.categories}" var="category">
									<c:choose>
										<c:when test="${category.categoryId == param.categoryId}">
											<li><a
												style="text-transform: none; border-color: rgba(255, 255, 255, 1); background: none;"
												href="search?categoryId=${category.categoryId}">${category.categoryName}</a>
											</li>
										</c:when>
										<c:otherwise>
											<li><a style="text-transform: none;"
												href="search?categoryId=${category.categoryId}">${category.categoryName}</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</ul>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>