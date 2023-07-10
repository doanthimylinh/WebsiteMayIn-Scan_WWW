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

</head>
<body id="home">
	<div class="wrapper">
		<jsp:include page="common/header.jsp" />

		<div class="container_fullwidth">
			<div class="container">


				<div class="clearfix"></div>
				<div class="container_fullwidth">
					<div class="container shopping-cart">
						<div class="row">
							<div class="col-md-12">
								<div style="display: flex; justify-content: space-between;">
									<h4 class="title">Chi tiết đơn hàng</h4>
								</div>
								<div class="clearfix"></div>
								<table class="shop-table">
									<thead>
										<tr>
											<th>Hình ảnh</th>
											<th>Chi tết</th>
											<th>Giá</th>
											<th>Số lượng</th>
											<th>Tổng tiền</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${items}" var="item">
											<tr>
												<td><a
													href="product-details?productId=${item.product.productId}"><img
														src="../download?image=${item.product.image}" alt=""></a></td>
												<td>
													<div class="shop-details">
														<div class="productname">${item.product.productName}</div>
													
														<p>${product.description}</p>
														
														<p>
															Mã sản phẩm : <strong class="pcode">${item.product.productId}</strong>
														</p>
													</div>
												</td>
												<td>
													<h5 class="red" style="color: #2f2f2f;">${item.unitPrice}VNĐ</h5>
													
												</td>
												<td><select name="quantity">
														<option value="${item.quantity}">${item.quantity}</option>
														<input type="hidden" value="${item.product.productId}"
														name="productId" />
												</select></td>
												<td>
													<h5>
														<strong class="red" style="color:  #2f2f2f"> ${item.unitPrice *
															item.quantity}VNĐ </strong>
													</h5>
												</td>
												
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="6"><a href="home"><button
														class="pull-left">Tiếp tục mua sắm</button></a>
												<p class="pull-right" style="display: flex; border: none;">
													<i class="title"
														style="font-size: 17px; color:  #2f2f2f;">
														Tên: ${sessionScope.user.fullname} <br>
														Địa chỉ: ${sessionScope.user.address} <br> Số điện thoại:  ${sessionScope.user.phone}</i>
												</p></td>
										</tr>
									</tfoot>
								</table>
								<div class="subtotal" style="margin-top: -10px;">
									<h5>Tổng tiền thanh toán:</h5>
									<span>${requestScope.subTotal}VNĐ</span>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>

		<jsp:include page="common/footer.jsp" />
	</div>
	<!-- Bootstrap core JavaScript==================================================-->
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