<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매현황</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div align="center">
<section>
<h2>판매데이터</h2>
<table border="1">
<tr>
  <th>상품번호</th><th>상품코드</th><th>판매날짜</th><th>매장코드</th>
  <th>상품명</th><th>판매수량</th><th>총판매액</th>
</tr>
<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection
	 ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt=con.createStatement();
	String sql = "select ts.saleno,ts.pcode, "+
	             " to_char(ts.saledate,'YYYY-MM-DD') dd, "+
	             " ts.scode,tp.name,ts.amount, "+
	             " to_char(ts.amount*tp.cost,'999,999,999') tot "+
	             " from tbl_salelist_2023 ts, tbl_product_2023 tp "+
	             " where ts.pcode=tp.pcode";
	ResultSet rs=stmt.executeQuery(sql);
	while(rs.next()){
		out.print("<tr><td>"+rs.getString("saleno")+"</td>");
		out.print("<td>"+rs.getString("pcode")+"</td>");
		out.print("<td>"+rs.getString("dd")+"</td>");
		out.print("<td>"+rs.getString("scode")+"</td>");
		out.print("<td>"+rs.getString("name")+"</td>");
		out.print("<td>"+rs.getString("amount")+"개</td>");
		out.print("<td>"+rs.getString("tot")+"원</td></tr>");
	}
}catch(Exception e){
    e.printStackTrace();
}
%>
</table></section></div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>