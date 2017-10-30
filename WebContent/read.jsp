<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
	integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
	integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
	crossorigin="anonymous"></script>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>상세후기</title>
<!-- Link Swiper's CSS -->
<script src="./dist/js/swiper.min.js"></script>
<link rel="stylesheet" href="./dist/css/swiper.min.css">

<<<<<<< HEAD
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
      height: 100%	;
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      height: 100%;
      /* Center slide text vertically */
    }
    .container-fluid{
    	background: #fff;
    }
    .col-md-12{
    border-bottom: 2px solid #eee; 
    text-align: center;
    font-size: 30px;
    }
  </style>
</head>
<body>
  <div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-12">
				<h2>${content.title}</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
				<h5>${content.writer}</h5>
				</div>
				<div class="col-md-4">
				<h5>여행날짜</h5>
				</div>
				<div class="col-md-4">
				<h5>${content.read_count}</h5>
				</div>
			</div>
		</div>
	</div>
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
    <div id="button" class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
  </div>
      <!-- Swiper JS -->
  <script src="./dist/js/swiper.min.js"></script>

  <!-- Initialize Swiper -->
  <script language="javascript">
    var mySwiper = new Swiper('.swiper-container', {
=======
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
	color: #000;
	margin: 0;
	padding: 0;
}

.swiper-container {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	height: 100%;
	/* Center slide text vertically */
}

.container-fluid {
	background: #fff;
}

.col-md-12 {
	border-bottom: 2px solid #eee;
	text-align: center;
	font-size: 30px;
}
</style>
<script type="text/javascript">
  $(function(){
	  $('#button').click(function(){
	    alert('asdasd');
	  });
	});
  </script>
  	<script>
   $(function(){
  	var mySwiper = new Swiper('.swiper-container', {
>>>>>>> 35303c4080085aba4bffafcefffbb3e17ad431bb
      pagination: {
        el: '.swiper-pagination',
        type: 'progressbar',
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
<<<<<<< HEAD
      onSlideNextStart:function(){
          alert('asdasd');
      }    
    }); 
=======
    
    });
  	
   });
 
    
  
>>>>>>> 35303c4080085aba4bffafcefffbb3e17ad431bb
  </script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-12">
						<h2>${content.title}</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<h5>${content.writer}</h5>
					</div>
					<div class="col-md-4">
						<h5>여행날짜</h5>
					</div>
					<div class="col-md-4">
						<h5>${content.read_count}</h5>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Swiper -->
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<c:forEach var="contentDetail" items="${contentDetailList}">
				<div class="swiper-slide" style="overflow-y: scroll;">
					<h4 id="day0${contentDetail.day}">@Day${contentDetail.day}</h4>
					${contentDetail.content}
					<p>ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㅇsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>하하하호호호dfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>배배배ㅐpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
					<p>sdfjsofjsodfjpsdfospfjsdfjpsfpsdf</p>
					<br>
				</div>
			</c:forEach>

		</div>
		<!-- Add Pagination -->
		<div class="swiper-pagination"></div>
		<!-- Add Arrows -->
		<div id="button" class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
	</div>

	<!-- Swiper JS -->
	

	<!-- Initialize Swiper -->

</body>
</html>