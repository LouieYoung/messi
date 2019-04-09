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
	color: white;
	text-align: center;
	background-image: URL("imag/back5.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
}

.all {
	position: absolute;
	left: 655px;
	width: 600px;
	height: 400p;
	border: 2px solid white;
	border-radius: 8px;
	margin:50px 0px;
}

.child {
	background-color: rgb(255, 90, 95);
	border: 1px solid rgb(255, 90, 95);
	border-radius: 6px;
}

.back {
	font-family: "Microsoft Yahei";
	font-size: 20px;
	font-weight: bold;
	color: white;
	margin: 15px 150px;
}
.each {
	margin: 20px 0px;
}
</style>
</head>
<body>
	<h1>出租者详细信息</h1>
	<hr>
	<%
		
		int id_lessor = Integer.parseInt(request.getParameter("id_lessor"));
		String driver = "com.mysql.jdbc.Driver";
		String dbUrl = String.format("jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_messi");
		String username = "1nxyjx4mm3";
		String password1 = "m1j1iix43xm5mzwyk0jhxm2y3lkxhx0w3k50i45m";
		Class.forName(driver);
		Connection conn=DriverManager.getConnection(dbUrl,username,password1);
		Statement stmt=conn.createStatement();
	
		ResultSet rs=stmt.executeQuery("select name,phone,email from lessor where id_lessor='"+id_lessor+"'");
		if(rs.next())
		{
	%>
	<div class="all">
		<div class="each">
			<b>姓名：<%=rs.getString(1)%></b>
		</div>
		<div class="each">
			电话：<%=rs.getString(2)%></div>
		<div class="each">
			电子邮件：<%=rs.getString(3)%></div>
	</div>
	<%
		}
	%>
	<div class="back">
		<a href="index.jsp?"><button class="child">
				<div id="child">返回首页</div>
			</button></a>
	</div>

</body>
</html>