<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page import="java.net.URLEncoder"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<!-- 공유하기 -->

<meta property="og:title" content="Travel">
<meta property="og:url" content="http://127.0.0.1">
<meta property="og:description" content="내용">


<style type="text/css">
	#line{ 
		font-size: 40px;
		color: black;
	}

	body{
		background-image:url('../img/background.jpg');
	}
</style>

<!------------- 로그인 알림창 ---------------->
<!--------------------------------------->

<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Share Your Story</title>

<!-- Bootstrap core CSS -->
<link href="./Bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="./Bootstrap/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/Bootstrap/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/Bootstrap/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/Bootstrap/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/Bootstrap/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link href="./Bootstrap/css/agency.min.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top">Whatever
				you go, Go with all your heart </a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fa fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">

					<li class="nav-item"></li>

					<li class="nav-item">

						<div class="dropdown show">
							<a class="btn btn-secondary dropdown-toggle"
								href="https://example.com" id="dropdownMenuLink"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> 지역 선택 </a>

							<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
								<a class="dropdown-item"
									href="<%=request.getContextPath()%>/content?task=contentList&search=${search}&category=서울">
									서울 </a> <a class="dropdown-item"
									href="<%=request.getContextPath()%>/content?task=contentList&search=${search}&category=대전">
									대전 </a> <a class="dropdown-item"
									href="<%=request.getContextPath()%>/content?task=contentList&search=${search}&category=대구">
									대구 </a> <a class="dropdown-item"
									href="<%=request.getContextPath()%>/content?task=contentList&search=${search}&category=부산">
									부산 </a> <a class="dropdown-item"
									href="<%=request.getContextPath()%>/content?task=contentList&search=${search}&category=인천">
									인천 </a> <a class="dropdown-item"
									href="<%=request.getContextPath()%>/content?task=contentList&search=${search}&category=강원도">
									강원도 </a> <a class="dropdown-item"
									href="<%=request.getContextPath()%>/content?task=contentList&search=${search}&category=충청도">
									충청도 </a> <a class="dropdown-item"
									href="<%=request.getContextPath()%>/content?task=contentList&search=${search}&category=전라도">
									전라도 </a> <a class="dropdown-item"
									href="<%=request.getContextPath()%>/content?task=contentList&search=${search}&category=제주도">
									제주도 </a>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Header -->
	<!-- Services -->
	<!-- Portfolio Grid -->
	<section class="bg-light" id="portfolio">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase">
						<div class="col-lg-6">
							<div class="input-group">
								<form action="<%=request.getContextPath()%>/content" method="post">
								<input type="hidden" name="task" value="contentList">
								<input type="hidden" name="category" value="${category}">
								<span class="input-group-btn">
								<c:if test="${empty search}">
									<input type="text" class="form-control" name="search" size="500" placeholder="Search..."> 
								</c:if>
								<c:if test="${not empty search}">
									<input type="text" class="form-control" name="search" size="500" value="${search}"> 
								</c:if>
								<input type="submit" class="btn btn-secondary" value="Go">
								</span>
								</form>
							</div>
						</div>
					</h2>
					<h3 class="section-subheading text-muted"></h3>
				</div>
			</div>
			<div class="row">
	<!-------------------------------- content 시작 ---------------------------------->
				<c:forEach var="content" items="${contentPage.contentList}">
					<div class="col-md-4 col-sm-6 portfolio-item">
						<a class="portfolio-link"
							href="<%=request.getContextPath()%>/content?task=read&contentNumber=${content.content_no}">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fa fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid" src="${content.main_img}" alt="">
						</a>
						<div class="portfolio-caption">
							<h4>${content.title}</h4>
							<p class="text-muted">${content.read_count} VIEW</p>
						</div>
					</div>
				</c:forEach>
	<!-------------------------------- content 끝 ---------------------------------->
			</div>
		</div>
	</section>
	<!---------------------- 페이지 버튼 시작 -------------------------->
	<div class="text-center" style="color: black">
		<ul id="line">
			<c:if test="${contentPage.startPage>1}">
				<a href="${myContextPath}/content?page=${contentPage.startPage-1}"> [이전] </a>
			</c:if>
			<c:forEach var="page" begin="${contentPage.startPage}" end="${contentPage.endPage}">
				<a href="<%=request.getContextPath()%>/content?task=contentList&page=${page}&search=${search}&category=${category}">
					${page} 
				</a>
			</c:forEach>
			<c:if test="${contentPage.endPage<contentPage.totalPage}">
				<a href="${myContextPath}/content?page=${contentPage.endPage+1}"> [다음] </a>
			</c:if>
		</ul>
	</div>
	<!---------------------- 페이지 버튼 끝 -------------------------->
	<!-- About -->
	<!-- Team -->
	<!-- Clients -->
	<section class="py-5">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<a href="#"> <img class="img-fluid d-block mx-auto"
						src="img/logos/envato.jpg" alt="">
					</a>
				</div>
				<div class="col-md-3 col-sm-6">
					<a href="#"> <img class="img-fluid d-block mx-auto"
						src="img/logos/designmodo.jpg" alt="">
					</a>
				</div>
				<div class="col-md-3 col-sm-6">
					<a href="#"> <img class="img-fluid d-block mx-auto"
						src="img/logos/themeforest.jpg" alt="">
					</a>
				</div>
				<div class="col-md-3 col-sm-6">
					<a href="#"> <img class="img-fluid d-block mx-auto"
						src="img/logos/creative-market.jpg" alt="">
					</a>
				</div>
			</div>
		</div>
	</section>

	<!-- Contact -->

	<!-------------------------------글 쓰기 버튼 ------------------------->
	<div style="position: fixed; bottom: 60px; right: 20px;">
		<%
			String clientId = "TZblhGxHqxzRPDaQz4FJ";//애플리케이션 클라이언트 아이디값";
			String redirectURI = URLEncoder.encode("http://localhost:3333/JSPProject_4team/callback",
					"UTF-8");
			SecureRandom random = new SecureRandom();
			String state = new BigInteger(130, random).toString();
			String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
			apiURL += "&client_id=" + clientId;
			apiURL += "&redirect_uri=" + redirectURI;
			apiURL += "&state=" + state;
			session.setAttribute("state", state);
		%>
		<button id="write"
			style="background-color: transparent; border: 0; outline: 0; float: right;"
			class="btn btn-info btn-lg" data-toggle="modal"
			data-target="#myModal">
			<img src="write.png" style="width: 70px; height: 70px">
		</button>
		<input type="hidden" id="apiURL" value="<%=apiURL%>">
		<!-- Modal -->

	</div>

	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<span class="copyright">Copyright &copy; Your Website 2017</span>
				</div>
				<div class="col-md-4">
					<ul class="list-inline social-buttons">
						<li class="list-inline-item"><a href="https://twitter.com/intent/tweet?text=TEXT&url=http://127.0.0.1" target="_blank"> <i
								class="fa fa-twitter"></i>
						</a></li>
						<li class="list-inline-item"><a href="http://www.facebook.com/sharer/sharer.php?u=http://127.0.0.1" target="_blank"> <i
								class="fa fa-facebook"></i>
						</a></li>
						<li class="list-inline-item"><a href="#"> <i
								class="fa fa-linkedin"></i>
						</a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<ul class="list-inline quicklinks">
						<li class="list-inline-item"><a href="#">Privacy Policy</a></li>
						<li class="list-inline-item"><a href="#">Terms of Use</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	<!-- /.modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<p>
						로그인이 필요한 기능입니다. <br>로그인하시겠습니까?
					</p>
				</div>
				<div class="modal-footer">
					<button id="login_no" type="button" class="btn btn-default"
						data-dismiss="modal" style="margin-right: 10px; color: white">NO</button>
					<button id="login_ok" type="button" class="btn btn-default"
						data-dismiss="modal" style="color: white">OK</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript -->
	<script src="./Bootstrap/vendor/jquery/jquery.min.js"></script>
	<script src="./Bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="./Bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Contact form JavaScript -->
	<script src="./Bootstrap/js/jqBootstrapValidation.js"></script>
	<script src="./Bootstrap/js/contact_me.js"></script>

	<!-- Custom scripts for this template -->
	<script src="./Bootstrap/js/agency.min.js"></script>

	<script type="text/javascript">
	$(function(){
		$("#write").click(function(){
			
			//세션 체크해서 없을 경우 로그인 화면 있으면 글쓰기
			//원래는 session에 token을 저장해서 유효성을 체크해야 하지만 자동 로그인이 없기 때문에
			//사용자가 사이트에 접속할 때마다 로그인을 해야하므로 session에 있는 access_token만 불러온다.
			//access_token ->  null 이면 로그인 x , null이 아니면 로그인o
<%-- 			var session_name = "<%=(String)session.getAttribute("access_token")%>"; --%>
			var session_name = "${sessionScope.access_token}";
			if (session_name != null && session_name.length > 0) {
				aa();
			} else {
				$("#login_ok").click(function(){
	            	//로그인화면 띄우기
	            	var url = $('#apiURL').val();
	            	window.open(url,"", "width=430,height=500,location=no,status=no,scrollbars=yes");
				})
			}
		})
	})
	
	function aa(){
// 		location.href="write_form.jsp";
		location.href="/writeForm"
	}
</script>
</body>
</html>
