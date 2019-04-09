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
<% int id=(int)session.getAttribute("llid"); %>
<% int hid=Integer.parseInt(session.getAttribute("hid").toString());  %>

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
	Statement stmt4=conn.createStatement();
	ResultSet rs=stmt.executeQuery("SELECT R.state FROM reservation as R,houseresource as H WHERE R.id_houseResource = '"+hid+"' and H.id_houseResource = '"+hid+"' and H.isRented=2");
	stmt2.executeUpdate("UPDATE reservation SET state = 4 WHERE id_houseResource = '"+hid+"' and state=3");
	stmt3.executeUpdate("UPDATE houseresource SET isRented = 0 WHERE id_houseResource = '"+hid+"' and isRented=2");
	while(true)
	{
		if(rs.next())
		{
			out.print("恢复成功！！！房源状态变为可租！！！");
			response.setHeader("refresh","3;URL=lessor.jsp");
			break;
		}
		out.print("恢复失败！！！请检查房源状态！！！");
		response.setHeader("refresh","3;URL=lessor.jsp");
		break;
	}
	rs.close();

	stmt.close();
	stmt2.close();
	stmt3.close();
	conn.close();
	%>
</body>
</html>