<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���ı�</title>
<!-- ��Ʈ��Ʈ�� 3.32version-->
<!-- ��Ʈ��Ʈ�� 3.32version-->
<!-- ��Ʈ��Ʈ�� 3.32version-->
<!-- Jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- �ΰ����� �׸� -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
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
				<a class="navbar-brand" href="#">��������</a>
			</div>
			<div class="collapse navbar-collapse navbar-scrollspy">
				<ul class="nav navbar-nav">
					<c:forEach var="contentDetail" items="${contentDetailList}">
						<li class="active"><a href="#day0${contentDetail.day}">@day0${contentDetail.day}</a></li>
					</c:forEach>
					<li><a href="<%=request.getContextPath()%>/content?task=contentList&search=&category="><button>���</button></a></li>
					<li><a href="<%=request.getContextPath()%>/content?task=updateForm&contentNum=${content.content_no}"><button>����</button></a></li>
					<li><a href="<%=request.getContextPath()%>/content?task=deleteForm&contentNum=${content.content_no}"><button>����</button></a></li>
				</ul>
			</div>
		</div>
		</nav>
		<br>
		<br>
		<br>
		<!-- 	�ؿ� �����Ǿ��ִ� nav -->
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
		<!-- 		���γ��� -->
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
<!-- 		�� �ؿ�div�κп� comment�κ� �߰��ϸ� ��. -->
		<div>
		<p>�ڸ�Ʈ</p>
		<p>�ڸ�Ʈ</p>
		<p>�ڸ�Ʈ</p>
		<p>�ڸ�Ʈ</p>
		<p>�ڸ�Ʈ</p>
		<p>�ڸ�Ʈ</p>
		<p>�ڸ�Ʈ</p>
		<p>�ڸ�Ʈ</p>
		<p>�ڸ�Ʈ</p>
		<p>�ڸ�Ʈ</p>

		</div>

	</div>

</body>
</html>