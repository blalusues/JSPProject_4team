<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
<meta charset="utf-8">
<title>Swiper demo</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<link rel="stylesheet" href="./dist/css/swiper.min.css">

<style>
html, body {
	position: relative;
	height: 100%;
}

body {
	background: #white;
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
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

li {
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
</style>
</head>
<body>
	<c:set var="myContextPath" value="${pageContext.request.contextPath}" />	
	<div class="swiper-container gallery-top">
		<div class="swiper-wrapper">
			<c:forEach var="contentDetail" items="${contentDetailList}">
				<div class="swiper-slide" style="overflow-y: scroll;">
					<h1>@Day${contentDetail.day}</h1>
					${contentDetail.content}
					<p>내용내용내용내용내용내용내용내용내용내용내용</p>
					<p>내용내용내용내용내용내용내용내용내용내용내용</p>
					<p>내용내용내용내용내용내용내용내용내용내용내용</p>
					<p>내용내용내용내용내용내용내용내용내용내용내용</p>
					<p>내용내용내용내용내용내용내용내용내용내용내용</p>
					<p>내용내용내용내용내용내용내용내용내용내용내용</p>
					<p>내용내용내용내용내용내용내용내용내용내용내용</p>
					<p>내용내용내용내용내용내용내용내용내용내용내용</p>
					<p>내용내용내용내용내용내용내용내용내용내용내용</p>
					<p>내용내용내용내용내용내용내용내용내용내용내용</p>
					<p>내용내용내용내용내용내용내용내용내용내용내용</p>
					<p>내용내용내용내용내용내용내용내용내용내용내용</p>
					<p>내용내용내용내용내용내용내용내용내용내용내용</p>
					<p>내용내용내용내용내용내용내용내용내용내용내용</p>
					<p>내용내용내용내용내용내용내용내용내용내용내용</p>
					<p>내용내용내용내용내용내용내용내용내용내용내용</p>
					<p>내용내용내용내용내용내용내용내용내용내용내용</p>
					<p>내용내용내용내용내용내용내용내용내용내용내용</p>
					<p>내용내용내용내용내용내용내용내용내용내용내용</p>
					<p>내용내용내용내용내용내용내용내용내용내용내용</p>
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
					<img src="${contentDetail.path}">
				</div>
			</c:forEach>
		</div>
	</div>
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
							<c:if test="${sessionScope.loginId == comment.writer}">
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
				<li></li>
			</c:forEach>
			<br>
			<c:if test="${not empty sessionScope.loginId}">
				<form action="${myContextPath}/content" method="post">
					<input type="hidden" name="comment_board" value="${content.content_no}"> 
					<input type="hidden" name="comment_id" value="${sessionScope.loginId}"> 
					<input type="hidden" name="task" value="commentCheck">
					<table border="0">
					<tr>
					<!-- 본문 작성-->
						<td><textarea name="comment_content"
						    style="width: 600px; height: 50px;" placeholder="여기에 내용을 입력하세요."
									wrap="hard"></textarea></td>
							<!-- 댓글 등록 버튼 -->
						<td><input type="submit" value="등록"
							style="width: 100px; height: 50px; font-size: 15pt;"></td>
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
