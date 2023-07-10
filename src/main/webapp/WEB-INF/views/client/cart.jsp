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
								<h3 class="title">Giỏ hàng</h3>
								<div class="clearfix"></div>
								<table class="shop-table">
									<thead>
										<tr>
											<th>Hình ảnh</th>
											<th>Chi tiết sản phẩm</th>
											<th>Giá thành</th>
											<th>Số lượng</th>
											<th>Tổng tiền</th>
											<th>Xóa</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${sessionScope.cart}" var="cart">
											<tr>
												<td><a
													href="product-details?productId=${cart.value.product.productId}"><img
														src="../download?image=${cart.value.product.image}"
														alt=""></a></td>
												<td>
													<div class="shop-details">
														<div class="productname">${cart.value.product.productName}</div>


														<p>${product.description}</p>

														<p>
															Mã sản phẩm : <strong class="pcode">${cart.value.product.productId}</strong>
														</p>
													</div>
												</td>
												<td>
													<h5 style=" font-weight: bold;">${cart.value.unitPrice}VNĐ</h5>


												</td>
												<td>
													<form action="add-to-cart" method="post">
														<select name="quantity" onchange="this.form.submit()">
															<c:forEach begin="1" end="5" var="i">
																<option
																	<c:if test="${cart.value.quantity == i}">
														selected="selected"
														</c:if>
																	value="${i}">${i}</option>
															</c:forEach>
															<input type="hidden"
															value="${cart.value.product.productId}"
															name="productId" />
														</select>
													</form>
												</td>
												<td>
													<h5>
														<strong class="red" style="font-weight: bold; color: black;">
															${Math.round(cart.value.unitPrice) *
															cart.value.quantity}VNĐ </strong>
													</h5>
												</td>
												<td><a
													href="delete-from-cart?productId=${cart.value.product.productId}">
														<i class="material-icons">&#xe92b;</i>
												</a></td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="6"><a href="home"><button
														class="pull-left">Tiếp tục mua sắm</button></a>
										</tr>
									</tfoot>
								</table>
								<div class="clearfix"></div>
								<div class="row">
									<div class="col-md-4 col-sm-6">
										<div class="shippingbox">
											<h5>Thông tin giao hàng</h5>
											<label> Địa chỉ * </label> <input type="text" name=""
												value="${sessionScope.user.address}" style="color: red;"
												readonly="readonly" /> <label> Số điện thoại * </label> <input
												type="text" name="" value="${sessionScope.user.phone}"
												style="color: red;" readonly="readonly" /> <label>
												Thay đổi địa chỉ giao hàng * </label>
											<c:if test="${sessionScope.user != null}">
												<a href="profile"><button>Thông tin tài khoản</button></a>
											</c:if>
										</div>
									</div>

									<div class="col-md-4 col-sm-6">
										<div class="shippingbox">
											<div class="subtotal">
												<h5>Tổng tiền:</h5>
												<span>${sessionScope.subTotal}VNĐ</span>
											</div>
											<c:if test="${sessionScope.user != null}">
												<c:if
													test="${sessionScope.user.address == null || sessionScope.user.phone == null}">
													<a href="profile-from-cart"><button style="margin-top:20px;">Mua ngay</button></a>
												</c:if>
												<c:if
													test="${sessionScope.user.address != null && sessionScope.user.phone != null && sessionScope.subTotal > 5}">
													<form action="checkout" method="post">
														<button style="margin-top:20px; type="submit" >Mua ngay</button>
													</form>
												</c:if>
											</c:if>
											<c:if test="${sessionScope.user == null}">
												<a href="../login"><button style="margin-top:20px;">Mua ngay</button></a>
											</c:if>

										</div>
									</div>
								</div>
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