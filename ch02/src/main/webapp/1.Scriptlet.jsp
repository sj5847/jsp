<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1.Scriptlet</title>
	<%--
		JSP 기본문법 실습
	 --%>
</head>
<body>
	<h3>1.스크립트 요소</h3>
	
	<h4>스크립트릿(Striptlet)</h4>
	<%
		//스크립트릿(자바 코드 영역)
		int var1 = 1;
		boolean var2 = true;
		double var3 = 3.14;
		String var4 = "Hello";
	
		out.println("<p>var1 : " +var1 + "</p>");
		out.println("<p>var2 : " +var2 + "</p>");
		
		//태그들은 동적 태그 나머지는 정적
	%>
	
	<h4>표현식(Expression)</h4>  
	
	<p><%= var3 %></p>
	<p><%= var4 %></p>
	
</body>
</html>