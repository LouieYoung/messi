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
	int id=(int)session.getAttribute("ttid");
	int rid=Integer.parseInt(session.getAttribute("rid").toString()); 
	String driver = "com.mysql.jdbc.Driver";
	String dbUrl = String.format("jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_messi");
	String username = "1nxyjx4mm3";
	String password1 = "m1j1iix43xm5mzwyk0jhxm2y3lkxhx0w3k50i45m";
	Class.forName(driver);
	Connection conn=DriverManager.getConnection(dbUrl,username,password1);
	Statement stmt1=conn.createStatement();
	Statement stmt2=conn.createStatement();
	Statement stmt3=conn.createStatement();
	Statement stmt4=conn.createStatement();
	ResultSet rs=stmt1.executeQuery("select state from reservation where id_reservation='"+rid+"'");
	while(rs.next())
	{
		if(rs.getInt(1)==0)
		{
			stmt2.executeUpdate("delete from reservation WHERE id_tenant = '"+id+"' and id_reservation='"+rid+"'");
			out.print("删除成功！！！");
			response.setHeader("refresh","3;URL=tenant.jsp");
		}
		else if(rs.getInt(1)==1)
		{
			
			ResultSet rs2=stmt3.executeQuery("select count(1) from reservation where id_houseResource in(select id_houseResource from reservation where id_reservation='"+rid+"' and state =1)");
			if(rs2.next())
			{
				if(rs2.getInt(1)==1)
				{
				stmt4.executeUpdate("update houseresource set isRented=0 where id_houseResource in (select id_hR from (select H.id_houseResource as id_hR from houseresource as H,reservation as R where R.id_reservation='"+rid+"' and H.id_houseResource = R.id_houseResource and R.state =1) as a)");
				stmt2.executeUpdate("delete from reservation WHERE id_tenant = '"+id+"' and id_reservation='"+rid+"'");
				out.print("删除成功！！！");
				response.setHeader("refresh","3;URL=tenant.jsp");
				}
			}
			rs2.close();
		}
		else
		{
			out.print("该订单不是待确认订单，不能删除！！！请重新操作！！！");
			response.setHeader("refresh","3;URL=tenant.jsp");
		}
	}
	%>
	<%	
	rs.close();
	stmt1.close();
	stmt2.close();
	stmt3.close();
	stmt4.close();
	conn.close();
	%>
<!-- 	stmt3.executeUpdate("update houseresource set houseresource.isRented=0 from houseresource,reservation where count(reservation.state=0)=1 and reservation.id_houseResource=houseresource.id_houseResource and reservation.id_reservation='"+rid+"'");
			 -->
</body>
</html>