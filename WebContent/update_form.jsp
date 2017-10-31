<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<title>글수정</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<!-- include summernote-ko-KR -->

<style type="text/css">
.bs-wizard {
	/* 	margin-top: 40px; */
	
}

/*Form Wizard*/
.bs-wizard {
	border-bottom: solid 1px #e0e0e0;
	padding: 0 0 10px 0;
}

.bs-wizard>.bs-wizard-step {
	padding: 0;
	position: relative;
	display: inline-block;
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

<!-- Swiper JS -->
<script src="./dist/js/swiper.min.js"></script>

<script type="text/javascript">
	var day = 1;
	var count = new Array();

	function func_add_day() {
		count[day] = 1;
		var newRoute;
		// 경로 추가 버튼 클릭
		$(document).on('click', '#addBtn' + day, function() {
			// day 값 세팅해주기 (hidden 타입 세팅해놓거나 id값 가져오거나)
			var fixedDay = $(this).attr("id").substr(6,6);
			var dayAndCount = fixedDay + "_" + count[fixedDay];
			
			newRoute = "<div class='bs-wizard-step complete' id='day" + fixedDay + "'>"
						+ "<div class='text-center bs-wizard-stepnum'>"
						+ "<input type='text' placeholder='장소' "
						+ "name='loc" + dayAndCount + "' size='7'></div>"
						+ "<div class='progress'><div class='progress-bar'></div></div>"
						+ "<a href='#' class='bs-wizard-dot'></a>"
						+ "<div class='hide bs-wizard-info text-center'>"
						+ "<textarea rows='3' cols='15' placeholder='요약' "
						+ "name='sum" + dayAndCount + "' size='10'>"
						+ "</textarea></div></div>";
			$('#route' + fixedDay).append(newRoute);

			var width = "width:" + (100 / count[fixedDay]) + "%";
			$('#route' + fixedDay + '> *').attr("style", width);

			count[fixedDay]++;
			
			// 이벤트 동적할당
			$(document).on('mouseover', '.bs-wizard-dot', function() {
				$(this).popover({
					placement : 'bottom',
					title : 'SUMMARY',
					html : true,
					// 같은 부모 노드에 있는 것들 중에서 검색
					content : $(this).siblings('.bs-wizard-info').html()
				})
			})
		})
	}
	$(func_add_day);

	// Initialize Swiper
	$(function() {
		var swiper = new Swiper('.swiper-container', {
			pagination : {
				el : '.swiper-pagination',
				clickable : true,
			},
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
		});
		// Day 추가 버튼 클릭
		document.querySelector('.append-slide').addEventListener('click', function(e) {
			e.preventDefault();
			day++;
			swiper.appendSlide("<div class='swiper-slide'><fieldset>"
								+ "<legend class='text-center'>Day " 
								+ day
								+ "</legend>"
								+ "<div class='form-group'>"
								+ "<label class='col-md-2 control-label' for='source_tags'>내용</label>"
								+ "<div class='col-md-9'>"
								+ "<input type='hidden' id='content" + day + "' name='content" + day + "'>"
								+ "<div class='summernote'>"
								+ "</div></div></div>"
								+ "<div class='container'><div class='row bs-wizard' id='route" + day + "' " 
								+ "style='border-bottom: 0;'></div><p align='center'>"
								+ "<button id='addBtn" + day + "' type='button' "
								+ "class='btn btn-default btn-lg' style='font-size: 12px'>"
								+ "<span class='glyphicon glyphicon-plus' aria-hidden='true'></span>"
								+ "경로 추가</button></p></div></fieldset></div>");
			
			// 새로 추가되는 summernote도 적용해주기
			$('.summernote').summernote({
				height : 300, // set editor height
				minHeight : null, // set minimum height of editor
				maxHeight : null, // set maximum height of editor
				focus : true
			});
			
			// Day 추가 될 때마다 click event 추가
			func_add_day();
			// 이벤트 버블링 방지
			return false;
		});
		
		$(document).on('click', '#submitBtn', function() {
			var form = document.getElementById("form");

			// day 보내기
			var allDay = document.createElement("input"); // input 엘리멘트 생성
			allDay.setAttribute("type", "hidden"); // type 속성을 hidden으로 설정
			allDay.setAttribute("name", "day"); // name 속성을 day로 설정
			allDay.setAttribute("value", day); // value 속성을 삽입
			form.appendChild(allDay); // form 엘리멘트에 input 엘리멘트 추가

			// count 배열 보내기(maxPath)
			var maxPath = new Array();
			for (var i = 0; i < count.length; i++) {
				maxPath[i] = document.createElement("input"); 	// input 엘리멘트 생성
				maxPath[i].setAttribute("type", "hidden"); 		// type 속성을 hidden으로 설정
				maxPath[i].setAttribute("name", "maxPath" + (i + 1));	// name 속성을 maxPath로 설정
				maxPath[i].setAttribute("value", count[i+1] - 1); 		// value 속성을 삽입
				form.appendChild(maxPath[i]);
			}
			
			// content를 day 개수만큼 보내기
			var content = new Array();
			for (var j=0; j<day; j++) {
				var html = $('.summernote').eq(j).summernote('code');
				content[j] = document.getElementById("content" + (j + 1));
				content[j].setAttribute("value", html);
			}

			form.submit();
		})
		$('.summernote').summernote({
			height : 300, // set editor height
			minHeight : null, // set minimum height of editor
			maxHeight : null, // set maximum height of editor
			focus : true
		// set focus to editable area after initializing summernote
		});
		// 		$(document).ready(function() {
		// 			$('#save_button').click(function() {
		// 				var markupStr = 'hello world';
		// 				$('#summernote').summernote('code', markupStr);
		// 				$('#contents').val(markupStr);
		// 			});

		// 		})

	});
</script>
<script src="lang/summernote-ko-KR.js"></script>

<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="./dist/css/swiper.min.css">

<!-- Swiper styles -->
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
	height: 700px;
	margin: 20px auto;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.append-buttons {
	text-align: center;
	margin-top: 20px;
}

.append-buttons a {
	display: inline-block;
	border: 1px solid #007aff;
	color: #007aff;
	text-decoration: none;
	padding: 4px 10px;
	border-radius: 4px;
	margin: 0 10px;
	font-size: 13px;
}
</style>
</head>
<body>
	<form id="form" class="form-horizontal"
		action="<%=request.getContextPath()%>/content" method="post">
		<input type="hidden" name="task" value="updateRead" />
		<fieldset>
			<legend class="text-center">WRITE</legend>
			<!-- 제목, 장소, 날짜 -->
			<div class="form-group">
				<label class="col-md-2 control-label" for="title">제목</label>
				<div class="col-md-9">
					<input id="title" name="title" type="text" placeholder="제목을 입력해주세요"
						class="form-control input-md">
				</div>
			</div>
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-2 control-label" for="place">장소</label>
				<div class="col-md-3">
					<select id="place" name="locations" class="form-control">
						<option value="서울">서울</option>
						<option value="경기도">경기도</option>
						<option value="대전">대전</option>
						<option value="대구">대구</option>
						<option value="부산">부산</option>
						<option value="인천">인천</option>
						<option value="강원도">강원도</option>
						<option value="충청도">충청도</option>
						<option value="전라도">전라도</option>
						<option value="제주도">제주도</option>
					</select>
				</div>
			</div>
			<!-- start date-->
			<div class="form-group">
				<label class="col-md-2 control-label" for="start_date">출발 일</label>
				<div class="col-md-3">
					<input id="start_date" name="start_date" type="text"
						placeholder="ex) 2017-01-01" class="form-control input-md">
				</div>
			</div>

			<!-- end date-->
			<!-- File Button -->
			<div class="form-group">
				<label class="col-md-2 control-label" for="source_image">대표사진</label>
				<div class="col-md-9">
					<input id="main_image" name="main_image" class="input-file"
						type="file">
				</div>
			</div>
			<!----------------------------------- Swiper --------------------------------------->
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<fieldset>
							<legend class="text-center">Day 1</legend>
							<!------------------------- 에디터 부분 ------------------------>
							<!-- Select Basic -->
							<div class="form-group">
								<label class="col-md-2 control-label" for="source_tags">내용</label>
								<div class="col-md-9">
									<input type="hidden" id="content1" name="content1">
									<div class="summernote">
									</div>
								</div>
							</div>
							<!----------------------- 경로 부분 ---------------------->
							<div class="container">
								<div class="row bs-wizard" id="route1" style="border-bottom: 0;"></div>
								<p align="center">
									<button id="addBtn1" type="button"
										class="btn btn-default btn-lg" style="font-size: 12px">
										<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
										경로 추가
									</button>
								</p>
							</div>
						</fieldset>
					</div>
				</div>
				<!-- Add Pagination -->
				<div class="swiper-pagination"></div>
				<!-- Add Arrows -->
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
			<p class="append-buttons">
				<a href="#" class="append-slide">+ Day</a>
				<a href="#" class="append-slide" id="submitBtn">수정</a>
			</p>
		</fieldset>
	</form>
</body>
</html>