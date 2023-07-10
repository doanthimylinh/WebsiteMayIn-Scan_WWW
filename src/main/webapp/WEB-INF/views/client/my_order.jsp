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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>

<body id="home">
	<div class="wrapper">
		<jsp:include page="common/header.jsp" />
		<div class="clearfix"></div>
		<div class="container_fullwidth" style="margin-top: 0px;">
			<div class="container">
				<div class="container shopping-cart">
					<div class="row">
						<div class="checkout-page">
							<ol class="checkout-steps">
								<li class="steps active"><a href="my-order"><div
											class="step-title">Đơn hàng của tôi</div></a>
									<table class="table table-striped" style="font-size: 15px;">
										<thead>
											<tr>
												<th>Mã đơn hàng</th>
												<th>Tổng tiền</th>
												<th>Ngày đặt</th>
												<th>Chi tiết đơn hàng</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${orders}" var="order">
												<tr>
													<td><a href="#">${order.orderId}</a></td>
													<td style="color: red; font-weight: bold;">${order.priceTotal}VNĐ</td>
													<td>${order.buyDate}</td>
													<td><a href="order-details?orderId=${order.orderId}"
														style="color: blue; text-decoration: underline;">Chi
															tiết</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table></li>
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