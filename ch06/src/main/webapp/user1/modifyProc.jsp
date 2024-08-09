<%@page import="user1.User1VO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

 <%
 	String uid = request.getParameter("uid");
 	String name = request.getParameter("name");
 	String birth = request.getParameter("birth");
 	String hp = request.getParameter("hp");
 	String age = request.getParameter("age");
 	
  	//데이터베이스 처리
  	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
  	String user = "root";
  	String pass = "kimsj1234";
  	
  	Connection conn = null;
	Statement stmt = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	User1VO vo= null;
	int result = 0;
	
    	try {
    	//1단계- 드라이버 로드
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	
    	//2단계- 데이터베이스 접속
    	conn = DriverManager.getConnection(host, user, pass);
    	
    	//3단계- 데이터베이스 접속
    	String sql = "update `user1` set `name`=?, `birth`=?, `hp`=?, `age`=? where `uid`=?";
    	psmt = conn.prepareStatement(sql);
    	
    	psmt.setString(1, name);
    	psmt.setString(2, birth);
    	psmt.setString(3, hp);
    	psmt.setString(4, age);
    	psmt.setString(5, uid);

    	//4단계
		result = psmt.executeUpdate();
    	
    	psmt.close();
    	conn.close();
    	
    	}catch(Exception e) {
			e.printStackTrace();
    	}
    	
    	//목록 이동
    	response.sendRedirect("/ch06/user1/list.jsp");
    	