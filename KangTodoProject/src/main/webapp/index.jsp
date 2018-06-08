<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>BizPage Bootstrap Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
.labellogin {
	padding-top: 6px;
}

#hoho1 {
	margin-top: 100px;
}

#hoho2 {
	padding-top: 10px;
}

.keke {
	height: 400px;
}

.keke2 {
	background-color: #E8D9FF;
	border: 1px solid #8041D9;
	color: #747474;
	width: 100px;
}

.keke4 {
	background-color: #E8D9FF;
	border: 1px solid #8041D9;
	color: #747474;
}

.keke5 {
	margin-top: 30px;
}

.keke6 {
	margin-top: 50px;
}
.keke11{
	background-color: #bce4e4;
    color: black;
    border: 2px solid #332f1b !important;
    border-radius: 10px !important;
}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="js/ck.js"></script>
<script>
	
</script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

</head>

<body>

	<!--==========================
    Header
  ============================-->
	<header id="header">
		<div class="container-fluid">

			<div id="logo" class="pull-left">
				<h1>
					<a href="#intro" class="scrollto">버그 많은 투두래요</a>
				</h1>
			</div>

			<jsp:include page="/WEB-INF/module/nav.jsp"></jsp:include>

		</div>
	</header>
	<!-- #header -->

	<!--==========================
    Intro Section
  ============================-->

	<section id="intro">
		<div class="intro-container">
			<div id="introCarousel" class="carousel  slide carousel-fade"
				data-ride="carousel">

				<ol class="carousel-indicators"></ol>

				<div class="carousel-inner" role="listbox">

					<div class="carousel-item active">
						<div class="carousel-background">
							<img src="img/intro-carousel/1.gif" alt="">
						</div>
						<div class="carousel-container">
							<c:choose>
								<c:when test="${empty sessionScope.user }">
									<div class="carousel-content">
										<h2>로그인 하세용</h2>
										<p>로그인을 해야 투두의 기능을 사용할 수 있습니당</p>
										<a href="#about" class="btn-get-started scrollto">로그인</a>
									</div>
								</c:when>
								<c:otherwise>
									<div class="carousel-content">
										<h2>반갑습니다 ${ sessionScope.user.name } 님!</h2>
										<a href="todoinsertform.do" class="btn btn-primary btn-sm">일정 추가</a> <a
											href="todolist.do" class="btn btn-success btn-sm">일정 관리</a>
									</div>
								</c:otherwise>
							</c:choose>

						</div>
					</div>

					<div class="carousel-item">
						<div class="carousel-background">
							<img src="img/intro-carousel/2.gif" alt="">
						</div>
						<div class="carousel-container">
							<c:choose>
								<c:when test="${empty sessionScope.user }">
									<div class="carousel-content">
										<h2>로그인 하세용</h2>
										<p>로그인을 해야 투두의 기능을 사용할 수 있습니당</p>
										<a href="#about" class="btn-get-started scrollto">로그인</a>
									</div>
								</c:when>
								<c:otherwise>
									<div class="carousel-content">
										<h2>반갑습니다 ${ sessionScope.user.name } 님!</h2>
										<a href="todoinsertform.do" class="btn btn-primary btn-sm">일정 추가</a> <a
											href="todolist.do" class="btn btn-success btn-sm">일정 관리</a>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>

					<div class="carousel-item">
						<div class="carousel-background">
							<img src="img/intro-carousel/3.gif" alt="">
						</div>
						<div class="carousel-container">
							<c:choose>
								<c:when test="${empty sessionScope.user }">
									<div class="carousel-content">
										<h2>로그인 하세용</h2>
										<p>로그인을 해야 투두의 기능을 사용할 수 있습니당</p>
										<a href="#about" class="btn-get-started scrollto">로그인</a>
									</div>
								</c:when>
								<c:otherwise>
									<div class="carousel-content">
										<h2>반갑습니다 ${ sessionScope.user.name } 님!</h2>
										<a href="todoinsertform.do" class="btn btn-primary btn-sm">일정 추가</a> <a
											href="todolist.do" class="btn btn-success btn-sm">일정 관리</a>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>

					<div class="carousel-item">
						<div class="carousel-background">
							<img src="img/intro-carousel/4.gif" alt="">
						</div>
						<div class="carousel-container">
							<c:choose>
								<c:when test="${empty sessionScope.user }">
									<div class="carousel-content">
										<h2>로그인 하세용</h2>
										<p>로그인을 해야 투두의 기능을 사용할 수 있습니당</p>
										<a href="#about" class="btn-get-started scrollto">로그인</a>
									</div>
								</c:when>
								<c:otherwise>
									<div class="carousel-content">
										<h2>반갑습니다 ${ sessionScope.user.name } 님!</h2>
										<a href="todoinsertform.do" class="btn btn-primary btn-sm">일정 추가</a> <a
											href="todolist.do" class="btn btn-success btn-sm">일정 관리</a>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>

					<div class="carousel-item">
						<div class="carousel-background">
							<img src="img/intro-carousel/5.jpg" alt="">
						</div>
						<div class="carousel-container">
							<c:choose>
								<c:when test="${empty sessionScope.user }">
									<div class="carousel-content">
										<h2>로그인 하세용</h2>
										<p>로그인을 해야 투두의 기능을 사용할 수 있습니당</p>
										<a href="#about" class="btn-get-started scrollto">로그인</a>
									</div>
								</c:when>
								<c:otherwise>
									<div class="carousel-content">
										<h2>반갑습니다 ${ sessionScope.user.name } 님!</h2>
										<a href="todoinsertform.do" class="btn btn-primary btn-sm">일정 추가</a> <a
											href="todolist.do" class="btn btn-success btn-sm">일정 관리</a>

									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>

				</div>

				<a class="carousel-control-prev" href="#introCarousel" role="button"
					data-slide="prev"> <span
					class="carousel-control-prev-icon ion-chevron-left"
					aria-hidden="true"></span> <span class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#introCarousel"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon ion-chevron-right"
					aria-hidden="true"></span> <span class="sr-only">Next</span>
				</a>

			</div>
		</div>
	</section>
	<!-- #intro -->
	<c:if test="${empty sessionScope.user }">
		<main id="main"><!--==========================
      Featured Services Section
    ============================--> <!--==========================
      About Us Section
    ============================-->
		<section id="about">
			<div class="container">

				<header class="section-header">
					<h3 id="hoho1">로그인</h3>
					<p id="hoho2">투두의 기능을 사용하기 위해선 로그인이 필요합니다</p>
				</header>

				<div class="row about-cols">

					<div class="col-md-4 wow fadeInUp"></div>

					<div class="col-md-4 wow fadeInUp keke" data-wow-delay="0.1s">
						<form class="form-horizontal" method="post" action="login.do">
							<div class="form-group row">

								<label for="inputEmail3"
									class="col-sm-3 control-label labellogin"><strong>아이디</strong></label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="inputEmail3" required
										name="id" placeholder="아이디">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPassword3"
									class="col-sm-3 control-label labellogin"><strong>패스워드</strong></label>
								<div class="col-sm-9">
									<input type="password" class="form-control" id="inputPassword3" required
										name="password" placeholder="패스워드">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-3"></div>
								<div class="col-sm-9">
									<div class="checkbox">
										<label> <input type="checkbox"> Remember me
										</label>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-3"></div>
								<div class="col-sm-6">
									<button type="submit" class="btn btn-default btn-block keke11">로그인</button>
								</div>
							</div>
						</form>

					</div>

					<div class="col-md-4 wow fadeInUp" data-wow-delay="0.2s"></div>

				</div>

			</div>
		</section>
		<!-- #about --> <!--==========================
      Services Section
    ============================-->
		<section id="services">
			<div class="container">

				<header class="section-header wow fadeInUp keke6">
					<h3>회원가입</h3>
					<!-- 	<p></p> -->
				</header>

				<div class="row">

					<div class="col-md-3 box wow bounceInUp" data-wow-duration="1.4s">

					</div>

					<div class="col-md-6 box wow bounceInUp" data-wow-duration="1.4s">
						<form method="post" action="register.do" name="formrg">
							<div class="form-group row">
								<label for="ididid" class="control-label col-md-3 text-center"><strong>아이디</strong></label>
								<div class="col-md-5">
									<input class="form-control" type="text" id="ididid" name="id"
										required>
								</div>
								<div class="col-md-4">
									<input class="btn btn-info" id="check_id" type="button"
										value="아이디 중복확인">
								</div>
							</div>

							<div class="form-group row">
								<label for="password" class="control-label col-md-3 text-center"><strong>비밀번호</strong></label>
								<div class="col-md-9">
									<input class="form-control" type="password" id="password"
										name="password" required>
								</div>
							</div>

							<div class="form-group row">
								<label for="password2"
									class="control-label col-md-3 text-center"><strong>비밀번호
										확인</strong></label>
								<div class="col-md-9">
									<input class="form-control" type="password" id="password2"
										name="password2" required>
								</div>
							</div>
							<div id="hohoho">
								<div id="hohoho2"></div>
								<div id="hohoho3"></div>
							</div>

							<div class="form-group row">
								<label for="name" class="control-label col-md-3 text-center"><strong>이름</strong></label>
								<div class="col-md-9">
									<input class="form-control" type="text" id="name" name="name" required>
								</div>
							</div>
							<div class="form-group row">
								<label for="email1" class="control-label col-md-3 text-center"><strong>이메일</strong></label>
								<div class="col-md-4" style="padding-right: 0px">
									<input class="form-control" type="text" id="email1"
										name="email1" required>
								</div>
								<label class="col-md-1 text-center"
									style="padding-left: 0px; padding-right: 0px">@</label>
								<div class="col-md-4 " style="padding-left: 0px">
									<select class="form-control" name="email2">
										<option>naver.com</option>
										<option>google.com</option>
										<option>babo.com</option>
										<option>gogo.go</option>
										<option>keke.ke</option>
									</select>
								</div>
							</div>
							<div>
								<div class="form-group row">
									<label for="addr1" class="control-label col-md-3 text-center"><strong>주소</strong></label>

									<div class="col-md-4" style="padding-right: 0px">


										<input type="text" class="form-control col-xs-3"
											id="sample6_postcode" name="addr1" placeholder="우편번호" required
											readonly>
									</div>
									<div class="col-md-5">
										<input type="button" class="col-xs-2 btn btn-info keke4"
											onclick="sample6_execDaumPostcode()" value="우편번호 찾기">

									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-3"></div>
									<div class="col-md-4 keke3">
										<input type="text" class="form-control" id="sample6_address"
											name="addr2" placeholder="주소" required>
									</div>
									<div class="col-md-5">
										<input type="text" class="form-control" id="sample6_address2"
											name="addr3" placeholder="상세주소" required>
									</div>
								</div>

							</div>
							
							<div class="form-group row keke5">
								<div class="col-md-4"></div>
								<div class="col-md-8 ">
									<input class=" btn btn-primary keke2" type="submit"
										value="가입"> <input class=" btn btn-success keke2"
										type="reset" value="다시쓰기">
								</div>
							</div>
						</form>

					</div>
					<div class="col-md-3 box wow bounceInUp" data-wow-duration="1.4s">

					</div>

				</div>

			</div>
		</section>



		</main>
	</c:if>

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<!-- JavaScript Libraries -->
	<script src="lib/jquery/jquery.min.js"></script>
	<script src="lib/jquery/jquery-migrate.min.js"></script>
	<script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/superfish/hoverIntent.js"></script>
	<script src="lib/superfish/superfish.min.js"></script>
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/counterup/counterup.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/isotope/isotope.pkgd.min.js"></script>
	<script src="lib/lightbox/js/lightbox.min.js"></script>
	<script src="lib/touchSwipe/jquery.touchSwipe.min.js"></script>
	<!-- Contact Form JavaScript File -->
	<script src="contactform/contactform.js"></script>

	<!-- Template Main Javascript File -->
	<script src="js/main.js"></script>

</body>
</html>