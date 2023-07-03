<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장별판매액</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div align="center">
<section>
&nbsp;<p><h2>매장별판매액</h2>
<table border="1">
<tr>
	<th>매장코드</th><th>매장명</th><th>매장별판매액</th>
</tr>
<%
try{
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con=DriverManager.getConnection
     ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
    Statement stmt=con.createStatement();
    String sql="select ash.scode, ash.sname, "+
    		" to_char(sum(ap.cost*asa.amount),'999,999') re"+
            " from tbl_product_2023 ap,  tbl_shop_2023 ash,  tbl_salelist_2023 asa "+
            " where asa.pcode=ap.pcode and asa.scode=ash.scode "+
            " group by ash.scode, ash.sname "+
            " order by ash.scode";
    ResultSet rs=stmt.executeQuery(sql);
    while(rs.next()){
      out.print("<tr><td>"+rs.getString("scode")+"</td>");
      out.print("<td>"+rs.getString("sname")+"</td>");
      /* out.print("<td>"+
                rs.getInt("cost")*rs.getInt("amount")+
                "</td></tr>");  */
      out.print("<td>"+rs.getString("re")+"</td>");         
    }
}catch(Exception e){
    e.printStackTrace();
}
%>
</table>
</section>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>