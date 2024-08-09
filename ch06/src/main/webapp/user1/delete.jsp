<%@page import="java.sql.DriverManager"%>
<%@page import="user1.User1VO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 
	String uid = request.getParameter("uid");
	
	//데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "kimsj1234";
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	User1VO vo = new User1VO();
	int result = 0;

		try {
		// 드라이버 로드		
			Class.forName("com.mysql.cj.jdbc.Driver");
			
		// 1단계 - 데이터베이스 접속
			conn = DriverManager.getConnection(host, user, pass);
			// 2단계 - SQL실행 객체 생성		
			String sql = "delete from  `user1` where `uid`=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, uid);	
			
			//3단계
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();
	
		}catch(Exception e) {
		e.printStackTrace();
}

%>