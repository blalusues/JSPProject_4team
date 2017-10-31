<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">
<head>
<meta charset="utf-8">
<title>Swiper demo</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<link rel="stylesheet" href="./dist/css/swiper.min.css">
<!-- 부트스트랩 4.0.0beta -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

<!-- 경로 style -->
<style type="text/css">
.bs-wizard {
	margin-top: 40px;
}

/*Form Wizard*/
.bs-wizard {
	border-bottom: solid 1px #e0e0e0;
	padding: 0 0 10px 0;
}

.bs-wizard>.bs-wizard-step {
	padding: 0px;
	position: relative;
	width:30%; 
	display:inline-block;
	margin:0px;
}

.bs-wizard>.bs-wizard-step+.bs-wizard-step {
}

/* Step 글씨 */
.bs-wizard>.bs-wizard-step .bs-wizard-stepnum {
	color: #595959;
	font-size: 16px;
	margin-bottom: 5px;
}

/* 요약 글씨 */
.bs-wizard>.bs-wizard-step .bs-wizard-info {
	color: #999;
	font-size: 14px;
}

/* 큰 원 */
.bs-wizard>.bs-wizard-step>.bs-wizard-dot {
	position: absolute;
	width: 30px;
	height: 30px;
	display: block;
	background: #fbe8aa;
	top: 45px;
	left: 50%;
	margin-top: -15px;
	margin-left: -15px;
	border-radius: 50%;
}

/* 작은 원 */
.bs-wizard>.bs-wizard-step>.bs-wizard-dot:after {
	content: ' ';
	width: 14px;
	height: 14px;
	background: #fbbd19;
	border-radius: 50px;
	position: absolute;
	top: 8px;
	left: 8px;
}

/* 진행바(막대기) */
.bs-wizard>.bs-wizard-step>.progress {
	position: relative;
	border-radius: 0px;
	height: 8px;
	box-shadow: none;
	margin: 15px 0;
}

.bs-wizard>.bs-wizard-step>.progress>.progress-bar {
	width: 0px;
	box-shadow: none;
	background: #fbe8aa;
}

.bs-wizard>.bs-wizard-step.complete>.progress>.progress-bar {
	width: 100%;
}

.bs-wizard>.bs-wizard-step.active>.progress>.progress-bar {
	width: 50%;
}

.bs-wizard>.bs-wizard-step:first-child.active>.progress>.progress-bar {
	width: 0%;
}

.bs-wizard>.bs-wizard-step:last-child.active>.progress>.progress-bar {
	width: 100%;
}

/* 진행 안 된 원 */
.bs-wizard>.bs-wizard-step.disabled>.bs-wizard-dot {
	background-color: #f5f5f5;
}

.bs-wizard>.bs-wizard-step.disabled>.bs-wizard-dot:after {
	opacity: 0;
}

.bs-wizard>.bs-wizard-step:first-child>.progress {
	left: 50%;
	width: 50%;
}

.bs-wizard>.bs-wizard-step:last-child>.progress {
	width: 50%;
}

.bs-wizard>.bs-wizard-step.disabled a.bs-wizard-dot {
	pointer-events: none;
}
/*END Form Wizard*/
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.bs-wizard-dot').popover({
        placement: 'bottom',
        title: 'SUMMARY',
        html: true,
        content: $('.bs-wizard-info').html()
  })
})
</script>

<style>
html, body {
	position: relative;
	height: 100%;
}

body {
	background: #white;
	color: #000;
	margin: 0;
	padding: 0;
}

.swiper-container {
	width: 100%;
	height: 300px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.swiper-slide {
	background-size: cover;
	background-position: center;
}

.gallery-top {
	height: 80%;
	width: 100%;
}

.gallery-thumbs {
	height: 20%;
	box-sizing: border-box;
	padding: 10px 0;
}

.gallery-thumbs .swiper-slide {
	width: 50%;
	height: 100%;
	opacity: 0.3;
}

.gallery-thumbs .swiper-slide-active {
	opacity: 1;
}

#div9 {
	width: 60%;
	margin: auto;
	text-align: right;
}

#div10 {
	padding-top: 11px;
	padding-right: 11px;
	padding-bottom: 11px;
	padding-left: 11px;
	width: 735px;
	text-align: center;
	background-color: #f2f2f2;
}

#div11 {
	padding-top: 11px;
	padding-right: 11px;
	padding-bottom: 11px;
	padding-left: 11px;
	width: 760px;
	margin: auto;
	text-align: center;
	border: 1px solid #d7d7d7;
	text-align: center;
}

#font1 {
	color: #a4a4a4;
	font-size: 13px;
	font-family: '돋움', dotum, Helvetica, sans-serif;
}

.li1{
	margin-top: 2px;
	margin-bottom: 5px;
	border-color: #222;
	opacity: 0.3;
	height: 1px;
	padding: 0;
	overflow: hidden;
	font: 0/0 arial;
	border-bottom-width: 1px;
	border-bottom-style: dotted;
}

textarea {
	resize: none;
}

table {
	margin-left: 5px;
	margin-right: 5px;
	width: 700px;
	text-align: left;
}

#del {
	font-size: 5pt;
	color: gray;
	background-color: Transparent;
	background-repeat: no-repeat;
	border: none;
	cursor: pointer;
	overflow: hidden;
	outline: none;
}

#x-form {
	text-align: right;
}
.btn-group{
	float:right;
}
.btn{
	margin-right: 5px;
}

</style>

</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-4">
				</div>
				<div class="col-md-4">
				</div>
				<div class="col-md-4">
					<div class="btn-group">	
						 
						<a href="<%=request.getContextPath()%>/content?task=contentList&search=&category="><button class="btn btn-default" style="cursor: pointer;" type="button">
							<em class="glyphicon glyphicon-align-left"></em>목록
						</button></a> 
					<c:if test="${sessionScope.email == content.email}">
						<a href="<%=request.getContextPath()%>/content?task=updateForm&contentNum=${content.content_no}"><button class="btn btn-default" style="cursor: pointer;" type="button">
							<em class="glyphicon glyphicon-align-center"></em>수정
						</button></a>
							<input class="btn btn-default" style="cursor: pointer;" value="삭제" type="button" onclick="delete_event()">
							<em class="glyphicon glyphicon-align-right"></em>
					</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<c:set var="myContextPath" value="${pageContext.request.contextPath}" />	
	<div class="swiper-container gallery-top">
		<div class="swiper-wrapper">
			<c:forEach var="contentDetail" items="${contentDetailList}">
				<div class="swiper-slide" style="overflow-y: scroll;">
					<h1>@Day${contentDetail.day}</h1>
					${contentDetail.content}
				</div>
			</c:forEach>
		</div>
		<div class="swiper-button-next swiper-button-black"></div>
		<div class="swiper-button-prev swiper-button-black"></div>
	</div>
	<div class="swiper-container gallery-thumbs">
		<div class="swiper-wrapper">
			<c:forEach var="contentDetail" items="${contentDetailList}">
				<div class="swiper-slide">
					<div class="container">
						<div class="bs-wizard" style="border-bottom: 0;">
						<c:forEach var="i" begin="0" end="${fn:length(contentDetail.dividePath)-1}" step="2">
							<div class="bs-wizard-step complete">
								<div class="text-center bs-wizard-stepnum">
									${contentDetail.dividePath[i]}
								</div>
								<div class="progress">
									<div class="progress-bar"></div>
								</div>
	 							<a href="#" class="bs-wizard-dot"></a>
								<div class="hide bs-wizard-info text-center">
									쿄쿄쿄
									${contentDetail.dividePath[i+1]}
								</div>
							</div>
						</c:forEach>	
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
<!-- --------------------------	댓글 ------------------------ -->
	<br>
	<div id="div9" style="cursor: pointer;"
		onclick="window.scrollTo(0,screen.height);">▼ comment</div>
	<div id="div11">
		<div id="div10">
			<c:forEach var="comment" items="${comment}">
				<table border="0">
					<tr>
						<td><b>${comment.writer}</b>&nbsp;&nbsp;<span id="font1">${comment.write_date}</span>
						</td>
						<td id="x-form">
							<c:if test="${sessionScope.email == comment.email}">
								<form action="${myContextPath}/content" method="post">
									<input type="hidden" name="comment_board"
										value="${content.content_no}"> 
									<input type="hidden" name="comment_num" value="${comment.commentNum}"> 
									<input type="hidden" name="task" value="commentDelete">										
									<input id="del" type="submit" value="X">
								</form>
							</c:if>
						</td>
					</tr>	
						<tr>
						<td>${comment.content}</td>
					</tr>
				</table>
				<li class="li1"></li>
			</c:forEach>
			<br>
			<c:if test="${not empty sessionScope.name}">
				<form action="${myContextPath}/content" method="post">
					<input type="hidden" name="comment_board" value="${content.content_no}">
					<input type="hidden" name="task" value="commentCheck">
					<table border="0">
					<tr>
					<!-- 본문 작성-->
						<td><textarea name="comment_content"
						    style="width: 600px; height: 50px;" placeholder="여기에 내용을 입력하세요."
									wrap="hard"></textarea></td>
							<!-- 댓글 등록 버튼 -->
						<td><input type="submit" value="등록"
							style="width: 100px; height: 50px; font-size: 15pt; margin-bottom: 5px; background-color: white; cursor: pointer;"></td>
						</tr>
					</table>
				</form>
			</c:if>
		</div>
	</div>
	<div id="div9" style="cursor: pointer;"
		onclick="window.scrollTo(0,10);">▲ top</div>
	<br>

	<script src="./dist/js/swiper.min.js"></script>

	<script>
    var galleryTop = new Swiper('.gallery-top', {
      spaceBetween: 10,
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
    var galleryThumbs = new Swiper('.gallery-thumbs', {
      spaceBetween: 10,
      centeredSlides: true,
      slidesPerView: 'auto',
      touchRatio: 0.2,
      slideToClickedSlide: true,
    });
    galleryTop.controller.control = galleryThumbs;
    galleryThumbs.controller.control = galleryTop;

  </script>
</body>
</html>
