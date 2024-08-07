<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h3>forward1</h3>
	
	<%	//클라이언트가 A페이지를 요청했으나 서버에서는 B페이지를 응답(페이지는 다르나 request는 같음) 
		
		pageContext.forward("../1.request.jsp");
	
	%>
</body>
</html>