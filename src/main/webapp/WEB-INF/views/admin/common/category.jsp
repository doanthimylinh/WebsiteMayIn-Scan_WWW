<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>L&K - Siêu thị máy in</title>
</head>
<body>
<!-- LEFT SIDEBAR -->
	<div th:fragment="category">
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll" style="padding-top: 20px;">
				<nav>
					<ul class="nav">
						<li><a href="user-list" class=""><i class="lnr lnr-users"></i> <span>Tài khoản</span></a></li>
						<li><a href="product-list" class=""><i class="lnr lnr-gift"></i> <span>Sản phẩm</span></a></li>
						<li><a href="order-list" class=""><i class="lnr lnr lnr-dice"></i>
								<span>Đơn hàng</span></a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<!-- END LEFT SIDEBAR -->
</body>
</html>