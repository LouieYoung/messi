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
	<% String name=request.getParameter("name"); %>
	<% String password=request.getParameter("password"); %>
	<% String identity=request.getParameter("identity");%>	
	<% String email=request.getParameter("email");%>
	<% String phone=request.getParameter("phone");%>
	<% int flag=0; %>
	<%
	int d=0;
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
/* 	ResultSet rs=stmt.executeQuery("select * from systemad"); */
%>
<%
	switch(identity)
	{
	case "tenant":
		ResultSet rs=stmt.executeQuery("select name from tenant");
		while(rs.next())
		{
			if(rs.getString(1).equals(name)) 
			{
				out.print("该用户名已被注册，请重新填写！！！");
				flag=1;
				response.setHeader("refresh","3;URL=signin.jsp");
				break;
			}
		}rs.close();
		if(flag==0)
		{	
			ResultSet rs3=stmt3.executeQuery("select max(id_tenant) from tenant");
			if(rs3.next())
			{
				int a =rs3.getInt(1);
				a+=1;
				stmt2.executeUpdate("INSERT INTO tenant VALUES ('"+a+"', '"+name+"', '"+password+"', '"+phone+"' ,'"+email+"',0)");
				out.print("您已注册成功！！！");
				response.setHeader("refresh","3;URL=login.jsp");
			}rs3.close();
			
		}
		break;
	case "lessor":
		ResultSet rs4=stmt4.executeQuery("select name from lessor");
		while(rs4.next())
		{			
			if(rs4.getString(1).equals(name)) 
			{
				out.print("该用户名已被注册，请重新填写！！！");
				flag=1;
				response.setHeader("refresh","3;URL=signin.jsp");
				break;
			}

		}rs4.close();
		if(flag==0)
		{	
			ResultSet rs3=stmt3.executeQuery("select max(id_lessor) from lessor");
			if(rs3.next())
			{
				int a =rs3.getInt(1);
				a+=1;
				stmt2.executeUpdate("INSERT INTO lessor VALUES ('"+a+"', '"+name+"', '"+password+"', '"+phone+"' ,'"+email+"',0)");
				out.print("您已注册成功！！！");
				response.setHeader("refresh","3;URL=login.jsp"); 
			}rs3.close();
			
		}
		break;
		
	}
stmt.close();
stmt2.close();
stmt3.close();
stmt4.close();
conn.close();
%>
</body>
</html>