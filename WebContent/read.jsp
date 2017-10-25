<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="//code.jquery.com/jquery.min.js"></script>


<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>글 상세내용</title>
</head>

<style>
.scrollspy-example {
	position: relative;
	height: 200px;
	margin-top: 10px;
	overflow: auto;
}

.body {
	position: relative;
}

.row>div {
	text-align: Center;
	border: 1px solid black;
}

.row>div:nth-child(odd) {
	background: white;
	height: 900px;
}

.row>div:nth-child(even) {
	background: gray;
}

#div1 {
	height: 900px;
}
#div2 {
	height: 800px;
	white-space: normal;
}



</style>
<body>
	<div class='row'>
		<div id="div1" class="container col-sm-8">
			<h2>${content.title}</h2>
			<nav id="navbar-example" class="navbar navbar-default navbar-static"
				role="navigation">
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
					</ul>
				</div>
			</div>
			</nav>
			<div id="div2" data-spy="scroll" data-target="#navbar-example"
				data-offset="0" class="scrollspy-example">
				<c:forEach var="contentDetail" items="${contentDetailList}">
				<h4 id="day0${contentDetail.day}">@Day${contentDetail.day}</h4>
				${contentDetail.content}
				</c:forEach>
			</div>
		</div>
		<div class='col-sm-4'>
			<h3>요약</h3>
		</div>
	</div>


</body>
</html>