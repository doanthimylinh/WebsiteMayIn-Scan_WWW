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
<link href="../resource/admin/assets/css/style.css" rel="stylesheet">

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
						<div class="panel-heading">
							<h3 class="panel-title">Chi tiết đơn hàng</h3>
							<div class="right">
								<button type="submit">
									<a href="order-list"><span class="label label-danger"
										style="font-size: 15px; margin-right: 15px;">Quay lại</span></a>
								</button>
							</div>
						</div>
						<div class="panel-body no-padding">
							<table class="shop-table" style="padding: 30px;">
								<thead>
									<tr>
										<th>Hình ảnh</th>
										<th>Chi tiết</th>
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
												<h5 style="color: #676A6D; font-weight: bold;">${item.unitPrice}VNĐ</h5>

											</td>
											<td><p>${item.quantity}</p></td>
											<td>
												<h5>
													<strong class="red" style="color: #676A6D;">
														${item.unitPrice * item.quantity}VNĐ </strong>
												</h5>
											</td>
										</tr>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="6"><span class="pull-left">Tổng tiền:
												<span style="color: #676A6D;">${order.priceTotal}VNĐ</span>
										</span> <br>
											<p class="pull-right" style="display: flex; border: none;">
												<i class="title"
													style="font-size: 17px; color: #676A6D; font-weight: bold; margin-top: -30px;">
													Khách hàng: ${order.user.fullname} <br>Địa chỉ:
													${order.user.address}<br> Số điện thoại:
													${order.user.phone}
												</i><br />
											</p></td>
									</tr>
								</tfoot>
							</table>
						</div>
						<div id="headline-chart" class="ct-chart"></div>
					</div>
				</div>
				<!-- END OVERVIEW -->
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>

	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script>
            let userSelection = document.getElementsByClassName('checkbox');
            let checkAll = document.getElementById('checkAll')


            checkAll.addEventListener('click', () => {
                if (checkAll.checked == true) {
                    for (let i = 1; i <= userSelection.length; i++) {
                        document.getElementById(i).checked = true
                    }
                } else {
                    for (let i = 1; i <= userSelection.length; i++) {
                        document.getElementById(i).checked = false
                    }
                }

            })
   </script>
</body>
</body>
</html>