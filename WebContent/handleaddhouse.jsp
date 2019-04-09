<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	font-family: "Microsoft Yahei";
	font-size: 20px;
	color:white;
	background-image: URL("imag/back5.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
}
</style>
</head>
<body>
	<%
	String type=request.getParameter("type");
	String acreage=request.getParameter("acreage");
	String price=request.getParameter("price");
	String city=request.getParameter("city");
	String district=request.getParameter("district");
	String street=request.getParameter("street");
 	int llid=(int)session.getAttribute("llid"); 
	%>
<%
String driver = "com.mysql.jdbc.Driver";
String dbUrl = String.format("jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_messi");
String username = "1nxyjx4mm3";
String password1 = "m1j1iix43xm5mzwyk0jhxm2y3lkxhx0w3k50i45m";
Class.forName(driver);
Connection conn=DriverManager.getConnection(dbUrl,username,password1);
Statement stmt=conn.createStatement();
Statement stmt2=conn.createStatement();
Statement stmt3=conn.createStatement();
%>
<%
ResultSet rs2=stmt2.executeQuery("select max(id_houseResource) from houseresource");
if(rs2.next())
{
	int a =rs2.getInt(1);
	a+=1;
	stmt3.executeUpdate("insert into houseresource(id_houseResource,id_lessor,rent,isRented,city,district,street,architechturalType,acreage,picture,evaluation,weight) values('"+a+"','"+llid+"','"+price+"',0,'"+city+"','"+district+"','"+street+"','"+type+"','"+acreage+"','1.jpg',11,1)");

}
%>

<% 
out.print("增加成功！！！");
response.setHeader("refresh","3;URL=lessor.jsp");
rs2.close();
stmt.close();
stmt2.close();
stmt3.close();
%>
	
</body>
</html>