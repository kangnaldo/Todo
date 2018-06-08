<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title></title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="js/todoComplate.js"></script>
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
<%-- <%
	String todono =	request.getParameter("todono");
	pageContext.setAttribute("todono",todono );
%> --%>
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
						<h3 id="hoho1">상세 정보</h3>

					</header>
					<c:choose>
						<c:when test="${todo.completion == 'true' }">
							<script>
								$(function() {
									$('#completionbt').attr('value', '완료됨').addClass('btn-success');
								});
								//alert("a");
							</script>
						</c:when>
						<c:otherwise>
							<script>
								$(function() {
									$('#completionbt').removeClass(
											'btn-success').addClass(
											'btn-default').val('완료하기');
								});
							</script>
						</c:otherwise>
					</c:choose>
					<p>
						<input type="button" class="btn btn-sm" id="completionbt"
							onclick="complate()">
					</p>
					<input type="hidden" id="aa" value="${todo.todono }" /> <input
						type="hidden" id="bb" value="${todo.completion }" />
					<table class="table">
						<tr>
							<td>제목</td>
							<td>${todo.todoSubject }</td>
						</tr>
						<tr>
							<td>글내용</td>
							<td>${todo.todoContent }</td>
						</tr>
						<tr>
							<td>카테고리</td>
							<td>${todo.cano == 1 ? '직장' : todo.cano == 2 ? '학업' : '생활' }</td>
						</tr>
						<tr>
							<td>시작일</td>
							<td>${todo.todostartdate }</td>
						</tr>
						<tr>
							<td>마감일</td>
							<td>${todo.todoenddate }</td>
						</tr>
						
						<tr>
							<td colspan="2"><input type="button" class="btn"
								onclick="javascript:location.href='detailform.do?todono=${todo.todono}';"
								value="수정"> <input type="button" class="btn" value="삭제" onclick="javascript:location.href='delete.do?todono=${todo.todono}';">
								<input type="button" class="btn" value="리스트로"
								onclick="javascript:location.href='todolist.do'" /></td>
						</tr>
					</table>

				</div>
				<div class="col-md-4 wow fadeInUp"></div>
			</div>
		</div>
	</section>
</body>