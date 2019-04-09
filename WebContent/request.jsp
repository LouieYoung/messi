<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
	<%-- <%! 
		Boolean judge(String name,String password,String identity)
		{
		 String driver = "com.mysql.jdbc.Driver";
		String dbUrl = String.format("jdbc:mysql://%s:%s/%s", System.getenv("MYSQL_HOST"), System.getenv("MYSQL_PORT"),System.getenv("MYSQL_DB"));
		String username = System.getenv("ACCESSKEY");
		String password = System.getenv("SECRETKEY");
		Class.forName(driver);
		Connection conn=DriverManager.getConnection(dbUrl,username,password);
		Statement stmt=conn.createStatement(); 
		 ResultSet rs = stmt.executeQuery("select * from systemad");
		
 	if (identity=="systemad")
			{
			ResultSet rs=stmt.executeQuery("select * from systemad");
			}
		else if (identity=="platformad")
			{
			ResultSet rs=stmt.executeQuery("select * from platformad");
			}
		else if (identity=="tenant")
			{
			ResultSet rs=stmt.executeQuery("select * from tenant");
			}
		else
			{
			ResultSet rs=stmt.executeQuery("select * from lessor");
			} 
		while(rs.next()){
			if(name==rs.getString(2)&&password==rs.getString(3)){
				return true;
				break;
			}
			
		} 
		while(rs.next()){
			if(name==rs.getString(2)&&password==rs.getString(3)){
				return true;
				break;
			}
		}
		while(!rs.next()){ return false;}
		
		rs.close();
		stmt.close();
		conn.close();
		}
	%> --%>
	
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<% String a=request.getParameter("name"); %>
	<% String b=request.getParameter("password"); %>
	<% String c=request.getParameter("identity");%>
	<%
	int d=0;
    String driver = "com.mysql.jdbc.Driver";
	String dbUrl = String.format("jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_messi");
	String username = "1nxyjx4mm3";
	String password1 = "m1j1iix43xm5mzwyk0jhxm2y3lkxhx0w3k50i45m";
	Class.forName(driver);
	Connection conn=DriverManager.getConnection(dbUrl,username,password1);
	Statement stmt=conn.createStatement();
	if(a==null||b==null)
	{
		out.println("请输入正确的用户名和密码！！！<br/>"+"等待3秒自动跳回登录页面！！！");
		response.setHeader("refresh","3;URL=login.jsp");
		d=1;
	}
	if(c==null&&d==0)
	{
		out.println("您没有选择身份！！！<br/>"+"等待3秒自动跳回登录页面！！！");
		response.setHeader("refresh","3;URL=login.jsp");
		d=1;
	}
	else if (c.equals("systemad"))
	{
	ResultSet rs=stmt.executeQuery("select * from systemad");
	while(rs.next())
		{  
			if(a.equals(rs.getString(2))&&b.equals(rs.getString(3)))
			{				
					
				out.println("successful!<br/>"+"等待3秒自动跳转！！！");
				response.setHeader("refresh","3;URL=systemad.jsp");
				rs.close();d=1;
				break;
			}				
		} rs.close();
	}
	else if (c.equals("platformad"))
	{

	ResultSet rs=stmt.executeQuery("select * from platformad");
	while(rs.next())
		{  
			if(a.equals(rs.getString(2))&&b.equals(rs.getString(3)))
			{				
				
				out.println("successful!<br/>"+"等待3秒自动跳转！！！");
				response.setHeader("refresh","3;URL=platformad.jsp");
				rs.close();d=1;
				break;
			}
		} rs.close();
	}
	else if (c.equals("lessor"))
	{
	
	ResultSet rs=stmt.executeQuery("select * from lessor");
	while(rs.next())
		{  
			if(a.equals(rs.getString(2))&&b.equals(rs.getString(3)))
			{	String e ="0";
				if(e.equals(rs.getString(6)))
				{
					session.setAttribute("llid", rs.getInt(1));
					out.println("successful!<br/>"+"等待3秒自动跳转！！！");
					response.setHeader("refresh","3;URL=lessor.jsp");
					rs.close();d=1;
					break;
				}
				else
				{
					out.println("您已被冻结！！！!<br/>"+"等待3秒自动跳转！！！");
					response.setHeader("refresh","3;URL=login.jsp");
				}
			}
		} rs.close();
	}
	else if (c.equals("tenant"))
	{

	ResultSet rs=stmt.executeQuery("select * from tenant");
	while(rs.next())
		{  
			if(a.equals(rs.getString(2))&&b.equals(rs.getString(3)))
			{	String e ="0";	
				if(e.equals(rs.getString(6)))
				{
				session.setAttribute("ttid", rs.getInt(1));
				out.println("successful!<br/>"+"等待3秒自动跳转！！！");
				response.setHeader("refresh","3;URL=tenant.jsp");
				rs.close();d=1;
				break;
				}
				else
				{
					out.println("您已被冻结！！！!<br/>"+"等待3秒自动跳转！！！");
					response.setHeader("refresh","3;URL=login.jsp");
				}
			}
		} rs.close();
	}
	if(d==0)
	{
		out.println("请输入正确的用户名和密码！！！<br/>"+"等待3秒自动跳转！！！");
		response.setHeader("refresh","3;URL=login.jsp");
	}
		
	
	
	/*  else if (request.getParameter("identity")=="platformad")
		{
		ResultSet rs=stmt.executeQuery("select * from platformad");
		}
	else if (request.getParameter("identity")=="tenant")
		{
		ResultSet rs=stmt.executeQuery("select * from tenant");
		}
	else
		{
		ResultSet rs=stmt.executeQuery("select * from lessor");
		}  */
	
	
	stmt.close();
	conn.close();  
	%>
	
</body>
</html>