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
		request.setCharacterEncoding("utf-8");
	%>
	<% int plid=Integer.parseInt(request.getParameter("plid"));  %>
	<% int flag = 0; %>
	<%
	 	String driver = "com.mysql.jdbc.Driver";
		String dbUrl = String.format("jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_messi");
		String username = "1nxyjx4mm3";
		String password1 = "m1j1iix43xm5mzwyk0jhxm2y3lkxhx0w3k50i45m";
		Class.forName(driver);
		Connection conn=DriverManager.getConnection(dbUrl,username,password1);
		Statement stmt=conn.createStatement();
		Statement stmt2=conn.createStatement();
	%>
	<%
		ResultSet rs=stmt.executeQuery("select id_platformad from platformad");
		while(rs.next())
		{
			if(rs.getInt(1)==plid) 
			{
				flag=1;
				stmt2.executeUpdate("delete from platformad WHERE id_platformad = '"+plid+"'");
				out.print("删除成功！！！");
				response.setHeader("refresh","3;URL=systemad.jsp");
				break;
			}
		}rs.close();
		if(flag==0)
		{
			out.print("无此ID，请重新输入！！！");
			response.setHeader("refresh","3;URL=deleteplatformad.jsp");
			
		}
		stmt.close();
		stmt2.close();
		conn.close();
	%>
</body>
</html>