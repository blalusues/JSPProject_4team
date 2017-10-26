<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style type="text/css">
#line{ 
font-size: 40px;
color: black;

}
</style>
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
								<a class="dropdown-item" href="<%=request.getContextPath()%>/content?task=category&location=서울"> 서울 </a> 
								<a class="dropdown-item" href="<%=request.getContextPath()%>/content?task=category&location=대전"> 대전 </a> 
								<a class="dropdown-item" href="<%=request.getContextPath()%>/content?task=category&location=대구"> 대구 </a> 
								<a class="dropdown-item" href="<%=request.getContextPath()%>/content?task=category&location=부산"> 부산 </a> 
								<a class="dropdown-item" href="<%=request.getContextPath()%>/content?task=category&location=인천"> 인천 </a>
								<a class="dropdown-item" href="<%=request.getContextPath()%>/content?task=category&location=강원도"> 강원도 </a> 
								<a class="dropdown-item" href="<%=request.getContextPath()%>/content?task=category&location=충청도"> 충청도 </a>
								<a class="dropdown-item" href="<%=request.getContextPath()%>/content?task=category&location=전라도"> 전라도 </a>
								<a class="dropdown-item" href="<%=request.getContextPath()%>/content?task=category&location=제주도"> 제주도 </a>
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
								<input type="hidden" name="task" value="search">
									 <span class="input-group-btn">
								<input type="text" class="form-control" name="searchTitle" size="500" placeholder="Search..."> 
							

										<input type="submit" class="btn btn-secondary" value="Go" style="border:0px; background-color:#51a3f7">

								</span>
							</form>
							</div>
						</div>
					</h2>
					<h3 class="section-subheading text-muted"></h3>
				</div>
			</div>
		
			<!-------------------------------- content 시작 ---------------------------------->
				<c:forEach var="content" items="${contentPage.contentList}">
					<div class="col-md-4 col-sm-6 portfolio-item">
						<a class="portfolio-link" href="<%=request.getContextPath()%>/content?task=read&contentNumber=${content.content_no}">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fa fa-plus fa-3x"></i>
								</div>
							</div> 
							<img class="img-fluid" src="${content.main_img}" alt="">
						</a>
						<div class="portfolio-caption">
							<h4>${content.title}</h4>
							<p class="text-muted">${content.read_count}</p>
						</div>
					</div>
				</c:forEach>
			<!-------------------------------- content 끝 ---------------------------------->
			</div>
		</div>
	</section>
	<!---------------------- 페이지 버튼 시작 -------------------------->
	<div class="text-center" style="color: black">
		<ul id="line" >
			<c:if test="${contentPage.startPage>1}">
				<a href="${myContextPath}/content?page=${contentPage.startPage-1}"> [이전] </a>
			</c:if>
			<c:forEach var="page" begin="${contentPage.startPage}" end="${contentPage.endPage}">
				<a href="<%=request.getContextPath()%>/content?task=contentList&page=${page}"> 
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


	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<span class="copyright">Copyright &copy; Your Website 2017</span>
				</div>
				<div class="col-md-4">
					<ul class="list-inline social-buttons">
						<li class="list-inline-item"><a href="#"> <i
								class="fa fa-twitter"></i>
						</a></li>
						<li class="list-inline-item"><a href="#"> <i
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

	<!-- Portfolio Modals -->

	<!-- Modal 1 -->
	<div class="portfolio-modal modal fade" id="portfolioModal1"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-dismiss="modal">
					<div class="lr">
						<div class="rl"></div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-lg-8 mx-auto">
							<div class="modal-body">
								<!-- Project Details Go Here -->
								<h2 class="text-uppercase">Project Name</h2>
								<p class="item-intro text-muted">Lorem ipsum dolor sit amet
									consectetur.</p>
								<img class="img-fluid d-block mx-auto"
									src="img/portfolio/01-full.jpg" alt="">
								<p>Use this area to describe your project. Lorem ipsum dolor
									sit amet, consectetur adipisicing elit. Est blanditiis dolorem
									culpa incidunt minus dignissimos deserunt repellat aperiam
									quasi sunt officia expedita beatae cupiditate, maiores
									repudiandae, nostrum, reiciendis facere nemo!</p>
									<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
									<br><br><br><br><br><br><br><br><br><br><br>
								<ul class="list-inline">
									<li>Date: January 2017</li>
									<li>Client: Threads</li>
									<li>Category: Illustration</li>
								</ul>
								<button class="btn btn-primary" data-dismiss="modal"
									type="button">
									<i class="fa fa-times"></i> Close Project
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal 2 -->
	<div class="portfolio-modal modal fade" id="portfolioModal2"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-dismiss="modal">
					<div class="lr">
						<div class="rl"></div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-lg-8 mx-auto">
							<div class="modal-body">
								<!-- Project Details Go Here -->
								<h2 class="text-uppercase">Project Name</h2>
								<p class="item-intro text-muted">Lorem ipsum dolor sit amet
									consectetur.</p>
								<img class="img-fluid d-block mx-auto"
									src="img/portfolio/02-full.jpg" alt="">
								<p>Use this area to describe your project. Lorem ipsum dolor
									sit amet, consectetur adipisicing elit. Est blanditiis dolorem
									culpa incidunt minus dignissimos deserunt repellat aperiam
									quasi sunt officia expedita beatae cupiditate, maiores
									repudiandae, nostrum, reiciendis facere nemo!</p>
								<ul class="list-inline">
									<li>Date: January 2017</li>
									<li>Client: Explore</li>
									<li>Category: Graphic Design</li>
								</ul>
								<button class="btn btn-primary" data-dismiss="modal"
									type="button">
									<i class="fa fa-times"></i> Close Project
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal 3 -->
	<div class="portfolio-modal modal fade" id="portfolioModal3"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-dismiss="modal">
					<div class="lr">
						<div class="rl"></div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-lg-8 mx-auto">
							<div class="modal-body">
								<!-- Project Details Go Here -->
								<h2 class="text-uppercase">3번째꺼</h2>
								<p class="item-intro text-muted">Lorem ipsum dolor sit amet
									consectetur.</p>
								<img class="img-fluid d-block mx-auto"
									src="img/portfolio/03-full.jpg" alt="">
								<p>Use this area to describe your project. Lorem ipsum dolor
									sit amet, consectetur adipisicing elit. Est blanditiis dolorem
									culpa incidunt minus dignissimos deserunt repellat aperiam
									quasi sunt officia expedita beatae cupiditate, maiores
									repudiandae, nostrum, reiciendis facere nemo!</p>
								<ul class="list-inline">
									<li>Date: January 2017</li>
									<li>Client: Finish</li>
									<li>Category: Identity</li>
								</ul>
								<button class="btn btn-primary" data-dismiss="modal"
									type="button">
									<i class="fa fa-times"></i> Close Project
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal 4 -->
	<div class="portfolio-modal modal fade" id="portfolioModal4"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-dismiss="modal">
					<div class="lr">
						<div class="rl"></div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-lg-8 mx-auto">
							<div class="modal-body">
								<!-- Project Details Go Here -->
								<h2 class="text-uppercase">Project Name</h2>
								<p class="item-intro text-muted">Lorem ipsum dolor sit amet
									consectetur.</p>
								<img class="img-fluid d-block mx-auto"
									src="img/portfolio/04-full.jpg" alt="">
								<p>Use this area to describe your project. Lorem ipsum dolor
									sit amet, consectetur adipisicing elit. Est blanditiis dolorem
									culpa incidunt minus dignissimos deserunt repellat aperiam
									quasi sunt officia expedita beatae cupiditate, maiores
									repudiandae, nostrum, reiciendis facere nemo!</p>
								<ul class="list-inline">
									<li>Date: January 2017</li>
									<li>Client: Lines</li>
									<li>Category: Branding</li>
								</ul>
								<button class="btn btn-primary" data-dismiss="modal"
									type="button">
									<i class="fa fa-times"></i> Close Project
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal 5 -->
	<div class="portfolio-modal modal fade" id="portfolioModal5"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-dismiss="modal">
					<div class="lr">
						<div class="rl"></div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-lg-8 mx-auto">
							<div class="modal-body">
								<!-- Project Details Go Here -->
								<h2 class="text-uppercase">Project Name</h2>
								<p class="item-intro text-muted">Lorem ipsum dolor sit amet
									consectetur.</p>
								<img class="img-fluid d-block mx-auto"
									src="img/portfolio/05-full.jpg" alt="">
								<p>Use this area to describe your project. Lorem ipsum dolor
									sit amet, consectetur adipisicing elit. Est blanditiis dolorem
									culpa incidunt minus dignissimos deserunt repellat aperiam
									quasi sunt officia expedita beatae cupiditate, maiores
									repudiandae, nostrum, reiciendis facere nemo!</p>
								<ul class="list-inline">
									<li>Date: January 2017</li>
									<li>Client: Southwest</li>
									<li>Category: Website Design</li>
								</ul>
								<button class="btn btn-primary" data-dismiss="modal"
									type="button">
									<i class="fa fa-times"></i> Close Project
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal 6 -->
	<div class="portfolio-modal modal fade" id="portfolioModal6"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-dismiss="modal">
					<div class="lr">
						<div class="rl"></div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-lg-8 mx-auto">
							<div class="modal-body">
								<!-- Project Details Go Here -->
								<h2 class="text-uppercase">Project Name</h2>
								<p class="item-intro text-muted">Lorem ipsum dolor sit amet
									consectetur.</p>
								<img class="img-fluid d-block mx-auto"
									src="img/portfolio/06-full.jpg" alt="">
								<p>Use this area to describe your project. Lorem ipsum dolor
									sit amet, consectetur adipisicing elit. Est blanditiis dolorem
									culpa incidunt minus dignissimos deserunt repellat aperiam
									quasi sunt officia expedita beatae cupiditate, maiores
									repudiandae, nostrum, reiciendis facere nemo!</p>
								<ul class="list-inline">
									<li>Date: January 2017</li>
									<li>Client: Window</li>
									<li>Category: Photography</li>
								</ul>
								<button class="btn btn-primary" data-dismiss="modal"
									type="button">
									<i class="fa fa-times"></i> Close Project
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript -->
	<script src="./Bootstrap/vendor/jquery/jquery.min.js"></script>
	<script src="./Bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="./Bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Contact form JavaScript -->
	<script src="./Bootstrap/js/jqBootstrapValidation.js"></script>
	<script src="./Bootstrap/js/contact_me.js"></script>

	<!-- Custom scripts for this template -->
	<script src="./Bootstrap/js/agency.min.js"></script>

</body>

</html>
