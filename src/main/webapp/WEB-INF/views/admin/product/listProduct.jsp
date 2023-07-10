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
		<%@include file="../common/header.jsp"%>
		<jsp:include page="../common/category.jsp" />
		<!-- MAIN -->
		<!-- MAIN CONTENT -->
		<form action="product-delete" method="get">
			<div class="main">
				<div class="main-content">
					<div class="container-fluid">
						<!-- OVERVIEW -->
						<div class="panel panel-headline">
							<div class="panel-body">
								<form action="product-delete" method="get">
									<div class="row">
										<div class="col-md-12">
											<div class="panel">
												<div class="panel-heading">
													<h3 class="panel-title">Danh sách sản phẩm</h3>
													<p class="demo-button">
														<a class="btn btn-default" href="product-list"
															style="padding: 4px 8px; text-decoration: none; border: none; box-shadow: 2px 2px gray; font-weight: bold;">Tất
															cả sản phẩm</a> <a class="btn btn-success"
															href="product-list-by-category?categoryId=3"
															style="background-color: gray; padding: 4px 8px; text-decoration: none; border: none; margin-left: 7px;">Máy
															in đa năng</a> <a class="btn btn-info"
															href="product-list-by-category?categoryId=2"
															style="background-color: gray; padding: 4px 8px; text-decoration: none; border: none; margin-left: 5px;">Máy
															in A3</a> <a class="btn btn-primary"
															href="product-list-by-category?categoryId=1"
															style="background-color: gray; padding: 4px 8px; text-decoration: none; border: none; margin-left: 5px;">Máy
															in A4</a> <a class="btn btn-warning"
															href="product-list-by-category?categoryId=4"
															style="background-color: gray; padding: 4px 8px; text-decoration: none; border: none; margin-left: 5px;">Máy
															in kim - hóa đơn - Bill</a> <a class="btn btn-danger"
															href="product-list-by-category?categoryId=5"
															style="background-color: gray; padding: 4px 8px; text-decoration: none; border: none; margin-left: 5px;">Máy
															Scan</a> <a class="btn btn-danger"
															href="product-list-by-category?categoryId=6"
															style="background-color: gray; padding: 4px 8px; text-decoration: none; border: none; margin-left: 5px;">Linh
															kiện máy in</a>
													</p>
													<div class="right">
														<!-- <button type="submit">
															<span class="label label-danger"
																style="font-size: 15px; margin-right: 15px;">Xóa</span>
														</button> -->
														<a href="product-create"><span
															class="label label-success" style="font-size: 15px;">Thêm
																mới</span></a>
													</div>
												</div>
												<div class="panel-body no-padding">
													<table class="table" style="margin: auto;">
														<thead>
															<tr>
																<th style="display: none;">Mã</th>
																<th>Tên sản phẩm</th>
																<th>Giá</th>
																<th>Số lượng</th>
																<th>Trạng thái</th>
																<th style="width: 10%;">Hình ảnh</th>
																<th style="width: 22%;">Mô tả</th>
																<th>Sửa</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${products}" varStatus="loop"
																var="product">
																<tr>
																	<td style="vertical-align: middle; display: none;">${product.productId}</td>
																	<td style="vertical-align: middle;">${product.productName}</td>
																	<td style="vertical-align: middle;">${product.price}</td>
																	<td style="vertical-align: middle;">${product.quantity}</td>
																	<td
																		style="vertical-align: middle; color: #D9534F; font-weight: bold;">${product.status}</td>
																	<td style="vertical-align: middle;"><img
																		style="width: 70%;"
																		src="../download?image=${product.image}"></td>
																	<td style="vertical-align: middle;">${product.description}</td>
																	<td style="vertical-align: middle;"><a
																		href="product-update?productId=${product.productId}">
																			<span class="label label-warning"
																			style="font-size: 15px;">Sửa</span>
																	</a></td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
										<div id="headline-chart" class="ct-chart"></div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<!-- END OVERVIEW -->
				</div>
				<!-- END MAIN CONTENT -->
			</div>
		</form>
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