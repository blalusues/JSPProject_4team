<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% int articleNum = (Integer)request.getAttribute("articleNum"); %>
	<script type="text/javascript">
			alert("��� ����");
			location.href='${pageContext.request.contextPath}/board?type=read&articleNum=<%=articleNum%>';
	</script>
</body>
</html>