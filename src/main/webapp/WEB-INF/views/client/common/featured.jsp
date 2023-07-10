<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
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
		<div class="featured-products">
			<h3 class="title">
				<strong>Sản phẩm đặc sắc </strong> 
			</h3>
			<div class="control">
				<a id="prev_featured" class="prev" href="#">&lt;</a><a
					id="next_featured" class="next" href="#">&gt;</a>
			</div>
			<ul id="featured">
			
			<li>
					<div class="row">
					<c:forEach items="${featuredOne}" var="product">
						<div class="col-md-3 col-sm-6">
							<div class="products">
<%-- 								<div class="offer">-${product.saleDTO.salePercent}%</div> --%>
								<div class="thumbnail">
									<a href="product-details?productId=${product.productId}"><img
										style="width: 90%;" src="../download?image=${product.image}"
										alt="Product Name"></a>
								</div>
								<div class="productname">${product.productName}</div>
							<span class="price" style="color: black;">${product.price}VNĐ</span>

								<div class="button_group">
										<a class="button add-cart" type="button" href="add-to-cart?productId=${product.productId}">Thêm vào giỏ hàng</a>
									
								</div>
							</div>
						</div>
					</c:forEach>
					</div>
				</li>
				
			</ul>
		</div>
</body>

</html>