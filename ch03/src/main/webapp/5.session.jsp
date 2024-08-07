<%@page import="sub1.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h3>5.session</h3>
	
	<h4>session Id 확인</h4>
	<%= session.getId() %>
	

	<h4>session 설정</h4>
	<%
		String agent = request.getHeader("User-Agent");
	
		if(agent.contains("Edg")) {
			//Edg브라우저
			UserVO user = new UserVO("a101", "김유신", 23);
			
			//세션 저장
			session.setAttribute("user", user);
			
			
		}else {
			//chrome
			UserVO user = new UserVO("a102", "김춘추", 21);
			session.setAttribute("user", user);
			
		}
	
		//세션 조회
		UserVO userVo =(UserVO)session.getAttribute("user");
	
	%>
	
	<p>
		아이디: <%=userVo.getUid() %><br>
		이름: <%=userVo.getName() %><br>
		나이: <%=userVo.getAge() %><br>
		
		
	</p>
	
	
</body>
</html>