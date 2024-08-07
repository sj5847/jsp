<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h3>pageContext 내장객체</h3>
	
	<h4>include</h4>
	<%//정적 인클루드 %>
	<%@ include file="./inc/header.jsp"  %>
	
	<%
		// 동적 인클루드
		pageContext.include("./inc/header.jsp");
		pageContext.include("./inc/footer.jsp");
	%>
	
	
	<h4>forward</h4>
	<a href="./proc/forward1.jsp">forward1</a>
	<a href="./proc/forward2.jsp">forward2</a>
</body>
</html>