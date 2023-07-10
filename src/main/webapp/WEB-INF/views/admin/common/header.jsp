<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>L&K - Siêu thị máy in</title>
<meta charset="utf-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Patrick+Hand+SC&display=swap" rel="stylesheet">
</head>

<body>
	<div th:fragment="header">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div style="float: left;padding-left: 30px; padding-top: 10px;">
				<p style="font-family: 'Patrick Hand SC', cursive; font-size:45px">L&K - Siêu thị máy in</p>
			</div>
			<div class="container-fluid">
				<div id="navbar-menu">
					
					<ul class="nav navbar-nav navbar-right">
						
						<li><a href="#"> <img
								src="../download?image=${sessionScope.user.avatar}"
								class="img-circle" alt="Avatar"> <span>${sessionScope.username}</span>
						</a></li>
						<li><a href="../logout"> <i class="material-icons"
								style="color: red;">&#xe8ac;</i><span>Logout</span>
						</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<!-- END NAVBAR -->
</body>
</html>