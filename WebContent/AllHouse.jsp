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
	background-image: URL("imag/back3.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
}

#show {
	margin: 10px;
	float: left;
}

#all {
	position: absolute;
	left: 260px;
}

.search {
	position: absolute;
	right: 100px;
	top: 50px;
}

.word {
	background-color: white;
	border: 1px solid rgb(0, 132, 137);
	border-radius: 8px;
	color: rgb(0, 132, 137);
}
</style>
</head>
<body>
	<h1>所有房源</h1>
<!-- 	<div class="search">
		<form action="search.jsp" method="post">
			<input name="search" value="" class="word" size=30
				placeholder="请输入房屋类型或房屋地址"> <input type="submit" value="搜素"
				class="word">
		</form>
	</div>  -->  
	<hr>
	<div id="all">
		<%
		String driver = "com.mysql.jdbc.Driver";
		String dbUrl = String.format("jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_messi");
		String username = "1nxyjx4mm3";
		String password1 = "m1j1iix43xm5mzwyk0jhxm2y3lkxhx0w3k50i45m";
		Class.forName(driver);
		Connection conn=DriverManager.getConnection(dbUrl,username,password1);
		Statement stmt=conn.createStatement();

		ResultSet rs=stmt.executeQuery("select id_houseResource,picture,rent,city,architechturalType,evaluation from houseresource");
		while(rs.next())
		{
		%>
		<!-- 循环开始 -->
		<div id="show">
			<a href="details.jsp?hid=<%=rs.getInt(1)%>" title="点击查看房屋信息"><img
				src="imag/<%=rs.getString(2)%>" width="322.5" height="217.5"
				border="1"></a> <br> <a
				href="details.jsp?hid=<%=rs.getInt(1)%>" title="点击查看房屋信息">¥<b><%=rs.getDouble(3)%></b>/月
				&nbsp; <%=rs.getString(4)%>-<%=rs.getString(5)%></a> <br>
			<%=rs.getInt(6)%>条评价
		</div>
		<!-- 循环结束 -->
		<%
			}
		%>
	</div>
</body>
</html>
