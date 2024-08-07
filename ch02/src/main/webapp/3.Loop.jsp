<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3.Loop</title>
</head>
<body>
	<h3>3.반복문</h3>
	
	<h4>for</h4>
	<%
		for(int i=1; i <=3; i++) {
			out.println("<p>i:"+i+"</p>");
		}
	%>
	
	<%
		for(int j = 1; j <=3; j++) {
			
	%>
		<p>j : <%= j %></p>	
	<%
		}
	
	%>
	
	<h4>while</h4>
	<%
		int k  = 1;
	while(k <=10) {
		
	
	%>
	<p>k : <%=k %></p>
	<%
		k++;
	}
	%>
	
	<h4>구구단</h4>
	<table border = "1">
	<%for(int i=2; i<=9; i++){ 
	 
	%>
	<tr>
		<th><%=i%>단</th>
	</tr>
	<%
	for(int j=1; j<=9; j++) {
		int result = i*j;		
	%>	
	<tr>
	<td>
	<p><%=i%>x<%=j %> = <%= result %></p>	
	<%
	}
	%>
	</td>
	</tr>
	<%
	}
	%>
	</table>
</body>
</html>