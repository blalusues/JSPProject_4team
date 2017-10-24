<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글을 찾지 못함</title>
</head>
<body>
	<script type="text/javascript">
			alert("게시물이 없습니다.");
			location.href='${pageContext.request.contextPath}/content?type=';//나중에 게시글 보는곳 타입 적기
	</script>
</body>
</html>