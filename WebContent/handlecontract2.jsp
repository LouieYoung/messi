<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
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
		int rid=Integer.parseInt(session.getAttribute("ridforcontract").toString());
		String phone=request.getParameter("lphone"); 
	 	String personcard=request.getParameter("lpersoncard"); 
	   /*  int id=(int)session.getAttribute("id");  */
	    int id=Integer.parseInt(session.getAttribute("llid").toString()); 
	    int hid=Integer.parseInt(session.getAttribute("hid").toString()); 
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
	Statement stmt4=conn.createStatement();
	Statement stmt5=conn.createStatement();
	Statement stmt6=conn.createStatement();
	ResultSet rs=stmt.executeQuery("select name from lessor where id_lessor='"+id+"'");
	ResultSet rs2=stmt2.executeQuery("select state from contract where id_reservation='"+rid+"'");
	if(rs.next())
	{
		String name=rs.getString(1);
		stmt3.executeUpdate("update contract set l_name='"+name+"',l_phone='"+phone+"',l_personcard='"+personcard+"' where id_reservation='"+rid+"'");
		
		if(rs2.next())
		{
			if(rs2.getInt(1)==0)
			{
				stmt.executeUpdate("update contract set state=1 where id_reservation='"+rid+"'");
				out.print("您已签署成功，请等待对方签署！！！");
			}
			if(rs2.getInt(1)==2)
			{
				stmt4.executeUpdate("update contract set state=3 where id_reservation='"+rid+"'");		
				stmt5.executeUpdate("UPDATE reservation SET state = 3 WHERE id_reservation='"+rid+"'");
				stmt6.executeUpdate("UPDATE houseresource SET isRented = 2 WHERE id_houseResource=(select A.id_houseResource from reservation as A where A.id_reservation='"+rid+"')");
				out.print("双方都已签署合同，订单生效！！！");
			}
			rs2.close();
		}

		response.setHeader("refresh","3;URL=lessor.jsp"); 
		rs.close();
	}
	/* stmt3.executeUpdate("UPDATE reservation SET state = 2 WHERE id_reservation='"+rid+"'");
	stmt4.executeUpdate("UPDATE houseresource SET isRented = 2 WHERE id_houseResource='"+hid+"'");  */
	
	
	stmt.close();
	stmt2.close();
	stmt3.close();
	stmt4.close(); 
	stmt5.close(); 
	stmt6.close(); 
	conn.close();

	%>
</body>
</html>