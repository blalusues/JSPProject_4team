<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
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
	background: white;
}

#div1 {
	height: 900px;
}

#div2 {
	width: 730px;
	height: 700px;
	overFlow: auto;
	word-break: break-all;
	white-space: normal;
	text-overflow: clip;
	}
 #div3{
	height: 900px;
	overFlow: auto;
	word-break: break-all;
	white-space: normal;
	text-overflow: clip;
}
}
textarea{
	resize: none;
}
table{
		width:60%;
		height:7%;
		margin:auto;
		text-align: center;
	}
</style>
<body>
<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
	<div class='row'>
		<div id="div1" class="container col-sm-7">
			<h2>${content.title}</h2>
			<a href="<%=request.getContextPath()%>/content?task=contentList&search=&category="><button>목록</button></a>
			<a href="<%=request.getContextPath()%>/content?task=updateForm&contentNum=${content.content_no}"><button>수정</button></a>
			<button>삭제</button>
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
					<p>asdasdasdasdadasdasd</p>
					<p>asdasdasdasdadasdasd</p>
					<p>asdasdasdasdadasdasd</p>
					<p>asdasdasdasdadasdasd</p>
					<p>asdasdasdasdadasdasd</p>
					<p>asdasdasdasdadasdasd</p>
					<p>asdasdasdasdadasdasd</p>
					<p>asdasdasdasdadasdasd</p>
					<p>asdasdasdasdadasdasd</p>
					<p>asdasdasdasdadasdasd</p>
					<p>asdasdasdasdadasdasd</p>
					<p>asdasdasdasdadasdasd</p>
					<p>asdasdasdasdadasdasd</p>
					<p>asdasdasdasdadasdasd</p>
					<p>asdasdasdasdadasdasd</p>
					<p>asdasdasdasdadasdasd</p>
					<p>asdasdasdasdadasdasd</p>
					<p>asdasdasdasdadasdasd</p>
					<p>asdasdasdasdadasdasd</p>
					<p>asdasdasdasdadasdasd</p>
					<p>asdasdasdasdadasdasd</p>
					<p>asdasdasdasdadasdasd</p>
				</c:forEach>
			</div>
		</div>
		<div id = "div3" class='col-sm-4'>
			<h3>요약</h3>
			<c:forEach var="contentDetail" items="${contentDetailList}">
			<img src="${contentDetail.path}">
			</c:forEach>
		</div>
	</div>
	<br>
	
		<div>
			<c:if test="${not empty sessionScope.loginId}">
			<form action="${myContextPath}/content" method="post">
				<input type="hidden" name="comment_board" value="${content.content_no}">
				<input type="hidden" name="comment_id" value="${sessionScope.loginId}"> 
				<input type="hidden" name="task" value="commentCheck">
				<table border="1">
					<tr>
						<!-- 본문 작성-->
						<td width=85%>
							<textarea name="comment_content" style="width: 100%; height: 100%;" placeholder="여기에 내용을 입력하세요." wrap="hard"></textarea>
						</td>
						<!-- 댓글 등록 버튼 -->
						<td width=15%>
							<input type="submit" value="등록"
								style="width:100%; height:100%; font-size: 15pt;">
						</td>
					</tr>
				</table>
			</form>
			</c:if>
		</div>
		<br>
		<div>
			<c:forEach var="comment" items="${comment}">
				<table border="1">
					<tr>
						<td width=15%>${comment.writer}</td>
						<td width=70%>${comment.content}</td>
						<td width=15%>
							<c:if test="${sessionScope.loginId == comment.writer}">
							<form action="${myContextPath}/content" method="post">
								<input type="hidden" name="comment_board" value="${content.content_no}">
								<input type="hidden" name="comment_num" value="${comment.commentNum}">
								<input type="hidden" name="task" value="commentDelete">
								${comment.write_date}
								<input type="submit" value="삭제"
								style="width:100%; height:100%; font-size: 15pt;">
							</form>
							</c:if>
							<c:if test="${sessionScope.loginId != comment.writer}">
								${comment.write_date}
							</c:if>
						</td>
					</tr>
				</table>
			</c:forEach>
			<button>ㅁㄴㅇ</button>
		</div>
		<br>
</body>
</html>