<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>租房网</title>
<style type="text/css">
body {
	font-family: "Microsoft Yahei";
	font-size: 20px;
	color:white;
	background-image: URL("imag/back5.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
}

h1 {
	text-align: center;
}

#top {
	position: absolute;
	right: 25px;
	top: 25px;
}

#all {
	position: absolute;
	left: 250px;
}

#show {
	width: 430px;
	height: 350px;
	margin: 15px;
	float: left;
}

#button {
	width: 430px;
	height: 350px;
	margin: 15px;
	float: left;
}

#child {
	font-family: "Microsoft Yahei";
	font-size: 20px;
	font-weight: bold;
	color: rgb(0, 132, 137);
	margin: 15px 32px;
}

.child {
	background-color: white;
	border: 1px solid rgb(0, 132, 137);
	border-radius: 6px;
}

.registe {
	color: rgb(0, 132, 137);
	font-family: "Microsoft Yahei";
	font-size: 20px;
	font-weight: bold;
	background-color: white;
	border: 1px solid rgb(0, 132, 137);
	border-radius: 6px;
}

.login {
	color: rgb(0, 132, 137);
	font-family: "Microsoft Yahei";
	font-size: 20px;
	font-weight: bold;
	background-color: white;
	border: 1px solid rgb(0, 132, 137);
	border-radius: 6px;
}
</style>
</head>
<body>
	<h1>首页</h1>
	<div id="top">
		<a href="signin.jsp?"><button class="registe">注册</button></a> <a
			href="login.jsp?"><button class="login">登录</button></a>
	</div>
	<hr>
	<div id="all">
		<h2>房屋推荐</h2>
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
		ResultSet rs2=stmt2.executeQuery("select rent,evaluation,acreage,id_houseResource from houseresource");
		while(rs2.next())
		{	/* int id =Integer.parseInt(rs2.getInt(4).toString()); */
			int id =rs2.getInt(4);
			double weight=0.5*rs2.getDouble(1)+0.3*rs2.getInt(2)+0.2*rs2.getDouble(3);
			stmt3.executeUpdate("update houseresource set weight='"+weight+"' where id_houseResource='"+id+"'");
		}
		ResultSet rs=stmt.executeQuery("select id_houseResource,picture,rent,city,architechturalType,evaluation from houseresource order by weight");
		
		while(rs.next())
		{
		%>
		<!-- 循环开始 -->
		<div id="show">
			<a href="details.jsp?hid=<%=rs.getInt(1)%>" title="点击查看房屋信息"><img
				src="imag/<%=rs.getString(2)%>" width="430" height="290"
				border="1"></a> <br> <a
				href="details.jsp?hid=<%=rs.getInt(1)%>" title="点击查看房屋信息">¥<b><%=rs.getDouble(3)%></b>/月
				&nbsp; <%=rs.getString(4)%>-<%=rs.getString(5)%></a> <br>
			<%=rs.getInt(6)%>条评价
		</div>
		<!-- 循环结束 -->
		<%
		}
		%>
		<div id="button">
			<a href="AllHouse.jsp?"><button class="child">
					<div id="child">查看全部房源</div>
				</button></a>
		</div>

	</div>
</body>
</html>