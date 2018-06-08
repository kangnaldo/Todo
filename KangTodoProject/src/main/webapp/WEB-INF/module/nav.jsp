<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="img/favicon.png" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700"
	rel="stylesheet">

<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<link href="css/style.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.keke3 {
	padding-right: 0px;
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${empty sessionScope.user }">
			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<li class="menu-active"><a href="index.do">홈</a></li>
					<li><a href="#about">로그인</a></li>
					<li><a href="#services">회원가입</a></li>

				</ul>
			</nav>
		</c:when>
		<c:otherwise>
			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<li class="menu-active"><a href="index.do">홈</a></li>
					<li><a href="logout.do">로그아웃</a></li>
					<li class="menu-has-children"><a href="#">일정관리</a>
						<ul>
							<li><a href="todoinsertform.do">일정 추가</a></li>
							<li><a href="todolist.do">일정 관리</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</c:otherwise>
	</c:choose>

</body>
</html>