<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<!-- include summernote-ko-KR -->

<style type="text/css">
input {
	font: 14px sans-serif;
}
</style>

<title>후기 작성</title>

<script type="text/javascript">
$(document).ready(function() {
	$('#summernote').summernote({
		height : 300, // set editor height
		minHeight : null, // set minimum height of editor
		maxHeight : null, // set maximum height of editor
		focus : true
	// set focus to editable area after initializing summernote
	});
});
$(document).ready(function() {
	$('#save_button').click(function() {
		var markupStr = $('#summernote').summernote('code');
		$('#summernote').summernote('code', markupStr);
		alert(markupStr);
		$('#form-submit').submit();
		return false;
	});
})
</script>
</head>
<body>
	<form class="form-horizontal" id="form-submit" action="<%=request.getContextPath() %>/content"
		method="post">
		<input name="task" value="write" type="hidden">
		<fieldset>
			<!-- Form Name -->
			<legend class="text-center">Day 1</legend>

			<!-- Text input-->
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
					<select id="place" name="place" class="form-control">
						<option value="1">서울</option>
						<option value="2">대전</option>
						<option value="3">대구</option>
						<option value="4">부산</option>
						<option value="5">인천</option>
						<option value="6">강원도</option>
						<option value="7">충청도</option>
						<option value="8">전라도</option>
						<option value="9">제주도</option>
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
			<div class="form-group">
				<label class="col-md-2 control-label" for="end_date">마지막 일</label>
				<div class="col-md-3">
					<input id="end_date" name="end_date" type="text"
						placeholder="ex) 2017-01-03" class="form-control input-md">

				</div>
			</div>

			<!-- File Button -->
			<div class="form-group">
				<label class="col-md-2 control-label" for="source_image">대표
					사진</label>
				<div class="col-md-9">
					<input id="main_image" name="main_image" class="input-file"
						type="file">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label" for="source_tags">내용</label>
				<div class="col-md-9">
					<textarea name="content" id="summernote" value=""></textarea>
					<button type="button" id="save_button">Click Me!</button>
					<input type="hidden" name="contents" value="" id="contents">
				</div>
			</div>
		</fieldset>
	</form>
</body>
</html>