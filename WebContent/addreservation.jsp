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
	int b=0;
	int hid=Integer.parseInt(request.getParameter("name2").toString()); 
	int id=Integer.parseInt(session.getAttribute("ttid").toString()); 
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
	ResultSet rs1=stmt1.executeQuery("select A.id_tenant,A.id_houseResource,A.state from reservation as A");
	ResultSet rs2=stmt2.executeQuery("select B.id_houseResource,B.isRented from houseresource as B");
	while(rs1.next())
	{
		if(rs1.getInt(1)==id&&rs1.getInt(2)==hid&&rs1.getInt(3)<3)
		{
			out.print("该房源你已预定，不能再次预定！！！请重新操作！！！");
			response.setHeader("refresh","3;URL=tenant.jsp");
			b=1;
			break;
		}
	}
	if(b==0)
	{
	while(rs2.next())
	{
		if(rs2.getInt(1)==hid&&rs2.getInt(2)==1)
		{
			out.print("该房源已被人预定，不能预定！！！请重新操作！！！");
			response.setHeader("refresh","3;URL=tenant.jsp");
			break;
		}
		else
		{
			ResultSet rs3=stmt3.executeQuery("select max(id_reservation) from reservation");
			if(rs3.next())
			{
				int a =rs3.getInt(1);
				a+=1;
				stmt4.executeUpdate("insert into reservation(id_reservation,id_houseResource,id_tenant,state) values('"+a+"','"+hid+"','"+id+"',0)");
			}
			out.print("预定成功！！！！");
			response.setHeader("refresh","3;URL=tenant.jsp");
			rs3.close();
			break;
		}
	}
	}
	%>
	<%	
	rs1.close();
	rs2.close();
	
	stmt1.close();
	stmt2.close();
	stmt3.close();
	stmt4.close();
	conn.close(); 
	%>
</body>
</html>