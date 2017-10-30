<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
<meta charset="utf-8">
<title>Swiper demo</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<link rel="stylesheet" href="./dist/css/swiper.min.css">

<style>
    html, body {
      position: relative;
      height: 100%;
    }
    body {
      background: #white;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      color:#000;
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

  </style>
</head>
<body>

<div class="swiper-container gallery-top">
<div class="swiper-wrapper">
<c:forEach var="contentDetail" items="${contentDetailList}">
<div class="swiper-slide" style="overflow-y:scroll;"><h1>@Day${contentDetail.day}</h1>
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
<div class="swiper-slide"><img src="${contentDetail.path}"></div>
</c:forEach>
</div>
</div>
<div>
<!-- 댓글 이안에 -->
</div>

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
