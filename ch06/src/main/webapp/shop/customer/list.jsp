<%@ page import="java.sql.ResultSet, java.sql.Statement, java.sql.Connection, javax.sql.DataSource, javax.naming.InitialContext, javax.naming.Context" %>
<%@ page import="shop.CustomerVO" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%
	List<CustomerVO> customers = new ArrayList<>();
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	try {
	
		 // 1단계 - JNDI 서비스 객체 생성
        Context initCtx = new InitialContext();
        Context ctx = (Context) initCtx.lookup("java:comp/env");

        // 2단계 - 커넥션 풀에서 커넥션 객체 가져오기
        DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
        conn = ds.getConnection();

        // 3단계 - SQL 실행
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM customer");

		while (rs.next()) {
            CustomerVO vo = new CustomerVO();
            vo.setCustId(rs.getString("custId")); // Assume column names are `cust_id`, `name`, `email`, etc.
            vo.setName(rs.getString("name"));
            
            customers.add(vo);
        }

		//5단계- 커넥션 반납
		}catch(Exception e) {
		
		e.printStackTrace();
		}

%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h3>고객목록</h3>
	
	<a href="/ch06/2.DBCPTest.jsp">처음으로</a>
	<a href="/ch06/shop/customer/register.jsp">등록</a>
	
	<table border="1">
		<tr>
			<th>고객아이디</th>
			<th>고객명</th>
			<th>휴대폰</th>
			<th>주소</th>
			<th>가입일</th>
			<th>관리</th>		
		</tr>
		
		<% for(CustomerVO vo: customers) {%>
		<tr>
			<td><%= vo.getCustId()%></td>
			<td><%= vo.getCustId()%></td>
			<td><%= vo.getCustId()%></td>
			<td><%= vo.getCustId()%></td>
			<td><%= vo.getCustId()%></td>
			<td>
				<a href="#">수정</a>
				<a href="#">삭제</a>	
			</td>		
		</tr>
		<%} %>
	
	
	
	
	
	</table>
	
	
</body>
</html>