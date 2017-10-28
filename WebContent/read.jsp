<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Swiper demo</title>
  <!-- Link Swiper's CSS -->
  <link rel="stylesheet" href="./dist/css/swiper.min.css">

  <!-- Demo styles -->
 <style>
    html, body {
      position: relative;
      height: 100%;
    }
    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color:#000;
      margin: 0;
      padding: 0;
    }
    .swiper-container {
      width: 100%;
      height: 500px;
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      height: 500px;
      /* Center slide text vertically */
    }
  </style>
</head>
<body>
  
  <div>
  	<table cellspacing="0" border="1">
		<tr>
			<td>글번호:</td>
			<td></td>
		</tr>
		<tr>
			<td>제목:</td>
			<td></td>
		</tr>
		<tr>
			<td>작성자:</td>
			<td></td>
		</tr>
		<tr>
			<td>작성일:</td>
			<td></td>
		</tr>
		<tr>
			<td>조회수:</td>
			<td></td>
		</tr>
		<tr>
			<td>내용:</td>
			<td></td>
		</tr>
	</table>
  </div>
  <!-- Swiper -->
  <div class="swiper-container">
    <div class="swiper-wrapper">
    	<c:forEach var="contentDetail" items="${contentDetailList}">
      <div class="swiper-slide" style="overflow-y: scroll;"><h4 id="day0${contentDetail.day}">@Day${contentDetail.day}</h4>
					${contentDetail.content}
					<p>ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㅇsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>하하하호호호dfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>배배배ㅐpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p><br>
					</div>
      </c:forEach>
   
    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>
    <!-- Add Arrows -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
  </div>

  <!-- Swiper JS -->
  <script src="./dist/js/swiper.min.js"></script>

  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
      pagination: {
        el: '.swiper-pagination',
        type: 'progressbar',
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  </script>
</body>
</html>