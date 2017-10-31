<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>write 성공</title>
</head>
<body>
	<script type="text/javascript">
			alert("등록 완료");
			location.href='${pageContext.request.contextPath}/content?task=contentList&search=&category=';
	</script>
</body>
</html>