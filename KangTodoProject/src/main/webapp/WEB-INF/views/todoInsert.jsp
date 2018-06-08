<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title></title>
<style>
#haho {
	margin-top: 7%;
}

#hoho1 {
	color: black;
}

.keke {
	background-color: white;
	border: 1px solid darkgray;
	border-radius: 10px;
}

#abc {
	background-image: url("img/intro-carousel/5.jpg");
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	display: table;
	width: 100%;
	height: 100vh;
	background-position: center;
	background-repeat: no-repeat;
	display: table;
}

#abc::before {
	content: '';
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	background: rgba(255, 255, 255, 0.7);
	/* z-index: 9; */
}

.back1 {
	background: rgba(0, 0, 0, 0.9);
}

.section-header {
	padding-top: 20px;
}

body {
	overflow-y: hidden;
} /* 이것은 말이여 스크롤을 숨기는? 것이여*/
</style>
</head>
<body>
	<header id="header" class="back1">
		<div class="container-fluid">

			<div id="logo" class="pull-left">
				<h1>
					<a href="#intro" class="scrollto">버그 많은 투두래요</a>
				</h1>
			</div>

			<jsp:include page="/WEB-INF/module/nav.jsp"></jsp:include>

		</div>
	</header>

	<section id="abc">
		<div class="intro-container">
			<div class="row about-cols" id="haho">
				<div class="col-md-4 wow fadeInUp"></div>

				<div class="col-md-4 wow fadeInUp keke text-center"
					data-wow-delay="0.1s">
					<header class="section-header">
						<h3 id="hoho1">일정 추가</h3>
					</header>
					<form action="todoinsert.do" method="post">
						<table class="table">
							<tr>
								<td><label for="subject" class="control-label"><strong>제목</strong></label></td>
								<td><input id="subject" name="todosubject" type="text" class="form-control" /></td>
							</tr>
							<tr>
								<td><label for="content" class="control-label"><strong>내용</strong></label></td>
								<td><textarea rows="" name="todocontent" class="form-control"></textarea></td>
							</tr>
							<tr>
								<td><strong>카테고리</strong></td>
								<td><select class="form-control" name="cano">
										<option value="1">직장</option>
										<option value="2">학업</option>
										<option value="3">생활</option>
								</select></td>
							</tr>
							<tr>
								<td><strong>시작일</strong></td>
								<td><input type="date" class="form-control"
									name="startdate" required /></td>
							</tr>
							<tr>
								<td><strong>마감일</strong></td>
								<td><input type="date" class="form-control" name="enddate"
									required /></td>
							</tr>

							<tr>
								<td colspan="2">
								<input type="submit" class="btn" value="등록"/> 
								<input type="button" class="btn"
									onclick="location.href='index.do'" value="취소"/></td>
							</tr>
							
						</table>
					</form>
					
				</div>


				<div class="col-md-4 wow fadeInUp" data-wow-delay="0.2s"></div>
			</div>
		</div>
	</section>

	<script src="../lib/jquery/jquery.min.js"></script>
	<script src="../lib/jquery/jquery-migrate.min.js"></script>
	<script src="../lib/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="../lib/easing/easing.min.js"></script>
	<script src="../lib/superfish/hoverIntent.js"></script>
	<script src="../lib/superfish/superfish.min.js"></script>
	<script src="../lib/wow/wow.min.js"></script>
	<script src="../lib/waypoints/waypoints.min.js"></script>
	<script src="../lib/counterup/counterup.min.js"></script>
	<script src="../lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="../lib/isotope/isotope.pkgd.min.js"></script>
	<script src="../lib/lightbox/js/lightbox.min.js"></script>
	<script src="../lib/touchSwipe/jquery.touchSwipe.min.js"></script>
	<script src="../contactform/contactform.js"></script>

	<script src="../js/main.js"></script>
</body>
</html>