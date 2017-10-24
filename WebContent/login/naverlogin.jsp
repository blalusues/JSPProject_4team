<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>네이버로그인</title>
</head>
<script type="text/javascript">
	window.onload = function() {
		window.open(apiURL, "popupNo1", "width=300, height=360");
	}
</script>
<body>
	<%
		String clientId = "TZblhGxHqxzRPDaQz4FJ";//애플리케이션 클라이언트 아이디값";
		String redirectURI = URLEncoder.encode("http://localhost:3333/JSPProject_4team/login/callback.jsp",
				"UTF-8");
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString();
		String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		apiURL += "&client_id=" + clientId;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&state=" + state;
		session.setAttribute("state", state);
	%>
<button style = "background-color:transparent; border:0; outline:0; float:right; position : relative; top : 750px; right:20px" onclick="window.open('<%=apiURL%>','window', 'width=430,height=500,location=no,status=no,scrollbars=yes')"><img src="write.png" style=" width: 70px; height: 70px"></button>
<%-- 	<a href="<%=apiURL%>"><img height="50" --%>
<%-- <!-- 		src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a> --> --%>
</body>
</html>