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
	int a=0,b=0;
	int id=(int)session.getAttribute("ttid");
	int rid=Integer.parseInt(session.getAttribute("rid").toString()); 
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
	ResultSet rs=stmt.executeQuery("select state,id_reservation from reservation where id_tenant='"+id+"'");
	while(rs.next())
	{	
		
		if(rs.getInt(1)==0&&rs.getInt(2)==rid)
		{
			stmt2.executeUpdate("UPDATE reservation SET state = 1 WHERE id_tenant = '"+id+"' and id_reservation='"+rid+"'"); 
			ResultSet rs4=stmt4.executeQuery("select id_houseResource from reservation where id_reservation='"+rid+"'");
			if(rs4.next())
			{	int x = rs4.getInt(1); 
				stmt3.executeUpdate("UPDATE houseresource SET isRented = 3 WHERE id_houseResource= '"+x+"'"); 
			}	
			out.print("提交成功，请等待出租者确认订单！！！");
			response.setHeader("refresh","3;URL=tenant.jsp");
			/* response.setHeader("refresh","0;URL=contract.jsp"); */
			a-=1;	
			break;
		}
		if(rs.getInt(1)!=0&&rs.getInt(2)==rid)
		{
			out.print("该订单不是预订单，不可更新为正式订单！！！请重新操作！！！");
			response.setHeader("refresh","3;URL=tenant.jsp");
			a-=1;
			break;
		}
		if(rs.getInt(2)!=rid)
		{
			b+=1;
		}
		a+=1;
	}
	
	if(a==b)
	{
		out.print("该用户无此订单！！！请重新操作！！！");
		response.setHeader("refresh","3;URL=tenant.jsp");
	}
	
	
	
	
	
	 rs.close();
	stmt.close();
	stmt2.close();
	conn.close();  
	%>
</body>
</html>