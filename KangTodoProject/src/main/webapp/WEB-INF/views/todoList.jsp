<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.back1 {
	background: rgba(0, 0, 0, 0.9);
}

body {
	overflow-y: hidden;
}

#haho {
	margin-top: 8%;
}
#no{
	width:50px;
}
#subject{
	width:300px;
}
#cate{
	width:100px;
}
#hohoi{
	border: 1px solid darkgray;
	border-radius: 20px;
}
.babo2{
	padding-top: 30px;
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
</style>
<c:set var="pageNum" value="${requestScope.pageNum == null ? 1 : requestScope.pageNum}"></c:set>
<c:set var="todoCount" value="${todoList.size() }"></c:set>
<c:set var="pageCount" value="5"></c:set>
<c:set var="startNo" value="${pageNum * pageCount - (pageCount -1)}"></c:set>
<c:set var="endNo" value="${startNo + pageCount -1 }"></c:set>


<script>
	alert(${endNo});
</script>
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
				<div class="col-md-1 wow fadeInUp"></div>
				<div class="col-md-10 wow fadeInUp" id="hohoi">
					<header class="section-header babo2">
					
						<h3 id="hoho1">일정 목록</h3>
					</header>
					<table class="table table-hover table-condensed text-center">
						<tr>
							<th id="no">NO</th>
							<th id="subject">제목</th>
							<th id="cate">카테고리</th>
							<th>시작일</th>
							<th>마감일</th>
							<th>완료여부</th>
							<th></th>
						</tr>
						<c:set var="n" value="1" />
			<%-- 			<c:if test=""></c:if> --%>
						<c:forEach var="i" items="${todoList }">
							<tr>
								<td>${n }</td>
								<td>${i.todoSubject }</td>
								<td>${i.cano == 1 ? '직장' : i.cano == 2 ? '학업' : '생활' }</td>
								<td>${i.todostartdate }</td>
								<td>${i.todoenddate }</td>
								<td>${i.completion == false ? '미완료' : '완료' } </td>
								<td><input type="button" value="상세정보" class="btn btn-info" onclick="javascript:location.href='detail.do?todono=${i.todono}';" ></td>
							</tr>
							<c:set var="n" value="${n+1 }" />
						</c:forEach>
					</table>
					
					
				</div>
				<div class="col-md-1 wow fadeInUp"></div>
			</div>
		</div>
	</section>
</body>
</html>