<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String uid = request.getParameter("uid");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String birth = request.getParameter("birth");
String gender = request.getParameter("gender");
String hobbies []= request.getParameterValues("hobby");
String addr = request.getParameter("addr");
%>



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>result2</title>
</head>
<body>
    <h3>POST 요청 데이터 수신</h3>
    
    <p>
        파라미터: <%=uid %><br>
        아이디: <%=pass %><br>
        이름: <%=name %><br>
        생년월일: <%=birth %><br>
        성별: <%= gender.equals("M") ? "남자" : "여자" %><br>
        취미 : <%
        for(String hobby: hobbies) {out.print(hobby+" ");}
        %>
        
        주소: <%=addr %>
    </p>
    
    <a href="./1.request.jsp">뒤로가기</a>
    
    
    <a href="../1.request.jsp">뒤로가기</a>