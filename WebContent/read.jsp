<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상세후기</title>
<!-- 부트스트랩 3.32version-->
<!-- 부트스트랩 3.32version-->
<!-- 부트스트랩 3.32version-->
<!-- Jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
.scrollspy-example {
	position: relative;
	height: 200px;
	margin-top: 10px;
	overflow: auto;
}

.body {
	position: relative;
}
</style>
</head>
<body>
	
	<div class="container">
		<nav id="navbar-example"
			class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button class="navbar-toggle collapsed" type="button"
					data-toggle="collapse" data-target=".navbar-scrollspy">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">여행일차</a>
			</div>
			<div class="collapse navbar-collapse navbar-scrollspy">
				<ul class="nav navbar-nav">
					<c:forEach var="contentDetail" items="${contentDetailList}">
						<li class="active"><a href="#day0${contentDetail.day}">@day0${contentDetail.day}</a></li>
					</c:forEach>
					<li><a href="<%=request.getContextPath()%>/content?task=contentList&search=&category="><button>목록</button></a></li>
					<li><a href="<%=request.getContextPath()%>/content?task=updateForm&contentNum=${content.content_no}"><button>수정</button></a></li>
					<li><a href="<%=request.getContextPath()%>/content?task=deleteForm&contentNum=${content.content_no}"><button>삭제</button></a></li>
				</ul>
			</div>
		</div>
		</nav>
		<br>
		<br>
		<br>
		<!-- 	밑에 고정되어있는 nav -->
		<nav id="navbar-example"
			class="navbar navbar-default navbar-fixed-bottom" role="navigation">
		<div id="div1" data-spy="scroll" style="height: 200px"
			data-target="#navbar-example" data-offset="0"
			class="scrollspy-example">
			<c:forEach var="contentDetail" items="${contentDetailList}">
				<c:forEach var="contentDetail" items="${contentDetailList}">
				<h4 id="day0${contentDetail.day}">@Day${contentDetail.day}</h4>
				<img src="${contentDetail.path}">
			</c:forEach>
			</c:forEach>
		</div>
		</nav>
		<!-- 		메인내용 -->
		<div id="div2" data-spy="scroll" style="height: 633px"
			data-target="#navbar-example" data-offset="0"
			class="scrollspy-example">
			<c:forEach var="contentDetail" items="${contentDetailList}">
					<h4 id="day0${contentDetail.day}">@Day${contentDetail.day}</h4>
					${contentDetail.content}
							<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			<p>sdfjsojfopsdfjosdjfpsjdfs</p>
			</c:forEach>
		</div>
<!-- 		이 밑에div부분에 comment부분 추가하면 됨. -->
		<div>
		<p>코멘트</p>
		<p>코멘트</p>
		<p>코멘트</p>
		<p>코멘트</p>
		<p>코멘트</p>
		<p>코멘트</p>
		<p>코멘트</p>
		<p>코멘트</p>
		<p>코멘트</p>
		<p>코멘트</p>

		</div>

	</div>

</body>
</html>