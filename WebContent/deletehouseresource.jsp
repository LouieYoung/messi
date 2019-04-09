<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<body>
<%	
	int flag=0;
	int id=(int)session.getAttribute("llid");
	int hid=Integer.parseInt(session.getAttribute("hid").toString()); 
	String driver = "com.mysql.jdbc.Driver";
	String dbUrl = String.format("jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_messi");
	String username = "1nxyjx4mm3";
	String password1 = "m1j1iix43xm5mzwyk0jhxm2y3lkxhx0w3k50i45m";
	Class.forName(driver);
	Connection conn=DriverManager.getConnection(dbUrl,username,password1);
	Statement stmt1=conn.createStatement();
	Statement stmt2=conn.createStatement();
	ResultSet rs1=stmt1.executeQuery("select isRented from houseresource where id_houseResource='"+hid+"'");
%>
<%
	if(rs1.next())
	{
		if(rs1.getInt(1)==0)
		{
			stmt2.executeUpdate("delete from houseresource WHERE id_houseResource='"+hid+"'");
			out.print("删除成功！！！");
			response.setHeader("refresh","3;URL=lessor.jsp");
			flag=1;
		}
		else
		{
			out.print("该房源无法删除，请检查房源状态！");
			response.setHeader("refresh","3;URL=lessor.jsp");
			flag=1;
		}
	}
	if(flag==0)
	{
		out.print("该房源不存在，请重新操作！");
		response.setHeader("refresh","3;URL=lessor.jsp");
	}
rs1.close();
stmt1.close();
stmt2.close();
conn.close();
%>
</body>
</html>