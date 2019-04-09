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
<% int id=(int)session.getAttribute("ttid"); %>
<% int rid=Integer.parseInt(session.getAttribute("rid").toString());  %>
<% String phone=request.getParameter("tphone"); %>
<% String personcard=request.getParameter("tpersoncard"); %>
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
	//ResultSet rs=stmt.executeQuery("select * from reservation where reservation.id_tenant = '"+id+"'");
	//ResultSet rs=stmt.executeQuery("select reservation.id_reservation,reservation.id_houseResource,lessor.name from lessor,houseresource,reservation where lessor.id_lessor=houseresource.id_lessor and houseresource.id_houseResource=reservation.id_houseResource and reservation.id_tenant = '"+id+"'");
	/* ResultSet rs2=stmt2.executeQuery("select max(id_contract) from contract"); */
	ResultSet rs3=stmt3.executeQuery("select name from tenant where id_tenant='"+id+"'");
	ResultSet rs6=stmt6.executeQuery("select state from contract where id_reservation='"+rid+"'");
	if(rs3.next())
	{		
		String name = rs3.getString(1);
		stmt.executeUpdate("update contract set t_name='"+name+"',t_phone='"+phone+"',t_personcard='"+personcard+"' where id_reservation='"+rid+"'");
		if(rs6.next())
		{
			if(rs6.getInt(1)==0)//出租者未签合同
			{
				stmt.executeUpdate("update contract set state=2 where id_reservation='"+rid+"'");
				out.print("您已签署成功，请等待对方签署！！！");
			}
			if(rs6.getInt(1)==1)//出租者签了合同
			{
				stmt.executeUpdate("update contract set state=3 where id_reservation='"+rid+"'");		
				stmt4.executeUpdate("UPDATE reservation SET state = 3 WHERE id_tenant = '"+id+"' and id_reservation='"+rid+"'");
				stmt5.executeUpdate("UPDATE houseresource SET isRented = 2 WHERE id_houseResource=(select A.id_houseResource from reservation as A where A.id_reservation='"+rid+"')");
				out.print("双方都已签署合同，订单生效！！！");
			}	
		rs6.close();
		}
		
		response.setHeader("refresh","3;URL=tenant.jsp");
		
	rs3.close();
	}
	
	
	stmt.close();
	stmt2.close();
	stmt3.close();
	stmt4.close();
	conn.close();
	%>
</body>
</html>