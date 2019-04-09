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
	<% int tid=Integer.parseInt(request.getParameter("tid").toString());  %>
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
	Statement stmt5=conn.createStatement();
	Statement stmt6=conn.createStatement();
	Statement stmt7=conn.createStatement();
	stmt.executeUpdate("UPDATE reservation SET state = 2 where id_tenant='"+tid+"' and id_houseResource='"+hid+"' and state=1");//bug错在少了state=1
	stmt2.executeUpdate("UPDATE houseresource SET isRented = 1 where id_houseResource='"+hid+"'");
	ResultSet rs=stmt3.executeQuery("select id_tenant,state from reservation where id_houseResource='"+hid+"'");
	while(rs.next())
	{
		if(rs.getInt(1)!=tid)
		{	int z=rs.getInt(1);
			stmt4.executeUpdate("UPDATE reservation SET state = 5 where id_tenant= '"+z+"' and id_houseResource='"+hid+"' ");
		}
	}
	
	ResultSet rs7=stmt7.executeQuery("select id_reservation from reservation where id_tenant='"+tid+"' and id_houseResource='"+hid+"'");
	if(rs7.next())
	{	int rid = rs7.getInt(1);
		ResultSet rs6=stmt6.executeQuery("select max(id_contract) from contract");
		if(rs6.next())
		{
			int a =rs6.getInt(1);
			a+=1;
			stmt5.executeUpdate("insert into contract(id_contract,state,id_reservation) values('"+a+"',0,'"+rid+"')");
		}
	}
	out.print("确定订单成功！！！");
	response.setHeader("refresh","3;URL=lessor.jsp");
	%>
	
</body>
</html>