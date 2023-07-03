<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매데이터테이</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div align="center">
<section>
&nbsp<p><h2 align="center">판매 데이터 Table</h2>
<form>
<table border="1">
<tr>
	<th>판매번호</th><th>판매코드</th><th>판매일</th><th>매장코드</th><th>수량</th>
</tr>
<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection
	 ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt=con.createStatement();
	String sql = "select * from tbl_salelist_2023";
	ResultSet rs=stmt.executeQuery(sql);
	while(rs.next()){
		out.print("<tr><td>"+rs.getString("saleno")+"</td>");
		out.print("<td>"+rs.getString("pcode")+"</td>");
		out.print("<td>"+rs.getString("saledate")+"</td>");
		out.print("<td>"+rs.getString("scode")+"</td>");
		out.print("<td>"+rs.getString("amount")+"</td></tr>"); 
	}
%>
</table>
</form>
</section>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>