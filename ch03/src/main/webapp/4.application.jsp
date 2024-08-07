<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>application</title>
</head>
<body>
    <h3>서버 정보</h3>
    <%=application.getServerInfo() %>
    
    <h4>파라미터 정보</h4>
    <% 
    String param1 = application.getInitParameter("param1");
    String param2 = application.getInitParameter("param2");
    
    %>
    
    <p>
        param1 : <%= param1 %>    
        param2 : <%= param2 %>    
    
    </p>
</body>
</html>