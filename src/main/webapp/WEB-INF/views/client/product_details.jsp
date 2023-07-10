<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
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
</head>

<body id="home">
	<div class="wrapper">
		<jsp:include page="common/header.jsp" />

		<div class="container_fullwidth">
			<div class="container">
				<div class="row">
					<div class="col-md-9">
						<div class="products-details">
							<div class="preview_image">
								<div class="preview-small">
									<img src="../download?image=${product.image}" alt=""
										style="margin-left: 35px; width: 78%; margin-top: 2px;">
								</div>
								<div class="thum-image">
									
								</div>
							</div>
							<div class="products-description">
								<h5 class="name" style="font-size: 24px;">${product.productName}</h5>
								<p style="padding-top: 3px; font-size: 18px;">${product.description}</p>
								<hr class="border">
								<div class="price">
									Giá thành : <span class="old_price">
											${product.price}VNĐ   </span>
								</div>
								<hr class="border">
								<form action="add-to-cart" method="post">
									<div class="wided">
										<div class="qty">
											Số lượng &nbsp;&nbsp;: <select name="quantity">
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
											</select> <input type="hidden" name="productId"
												value="${product.productId}"/>
										</div>
										<div class="button_group">

											<a href="#"><button
													class="button">Thêm vào giỏ hàng</button></a>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div th:replace="client/common/new :: new"></div>
				</div>

				<!-- 			<div th:replace="client/common/ourbands :: ourbands"></div> -->

			</div>
		</div>

		<jsp:include page="common/footer.jsp"/>
	</div>
	<script type="text/javascript" src="../resource/client/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="../resource/client/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="../resource/client/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="../resource/client/js/jquery.sequence-min.js"></script>
	<script type="text/javascript"
		src="../resource/client/js/jquery.carouFredSel-6.2.1-packed.js"></script>
	<script defer src="../resource/client/js/jquery.flexslider.js"></script>
	<script type="text/javascript" src="../resource/client/js/script.min.js"></script>
</body>

</html>