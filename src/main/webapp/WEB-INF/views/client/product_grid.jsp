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
<link rel="stylesheet" href="..resource/client/css/flexslider.css"
	type="text/css" media="screen" />
<link href="../resource/client/css/sequence-looptheme.css"
	rel="stylesheet" media="all" />
<link href="../resource/client/css/style.css" rel="stylesheet">

</head>
<body id="home">
	<div class="wrapper">
		<%@include file="common/header.jsp"%>

		<div class="container_fullwidth">
			<div class="container">
				<div class="row">
					
					<div class="col-md-12">
						<div class="clearfix"></div>
						<div class="products-grid">
							<div class="clearfix"></div>
							<div class="row">
								<c:forEach items="${products}" var="product">
									<div class="col-md-3 col-sm-6">
										<div class="products">
											<div class="thumbnail">
												<a href="product-details?productId=${product.productId}"><img
													style="width: 90%;"
													src="../download?image=${product.image}" alt="Product Name"></a>
											</div>
											<div class="productname">${product.productName}</div>
											<span class="price"
													style="font-size: 15px; color: black;  margin-top: -5px;">${product.price}VNĐ</span>

											<div class="button_group">
												<a class="button add-cart" type="button"
													href="add-to-cart?productId=${product.productId}">Thêm vào giỏ hàng</a>
											</div>
										</div>
									</div>
								</c:forEach>
								<div class="clearfix"></div>


								<div class="clearfix"></div>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
		<%@include file="common/footer.jsp"%>
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