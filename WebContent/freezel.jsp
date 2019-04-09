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
<% //int tid=Integer.parseInt(request.getParameter("tid").toString()); 
	/* int tid = (int)request.getParameter("tid"); */
	int lid =Integer.parseInt(request.getParameter("lid").toString());
	int flag=0;
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
	ResultSet rs2=stmt2.executeQuery("select id_lessor,state from lessor where id_lessor='"+lid+"'");
%>

	<%
	while(rs2.next())
	{
		if(rs2.getInt(1)==lid)	
		{
			if(rs2.getInt(2)==0)
			{
				stmt.executeUpdate("update lessor set state=1  WHERE id_lessor = '"+lid+"'");
				out.print("冻结成功！！！");
				response.setHeader("refresh","3;URL=platformad.jsp");
				flag=1;
				break;
			}
			else
			{
				out.print("该出租者已经被冻结，请重新操作！！！");
				response.setHeader("refresh","3;URL=platformad.jsp");
				flag=1;
				break;
				
			}
		}
	}
	if(flag==0)
	{
		out.print("无此人，请重新输入！！！");
		response.setHeader("refresh","3;URL=platformad.jsp");
	}
	%>
</body>
</html>