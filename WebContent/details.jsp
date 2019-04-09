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

h2 {
	text-align: center;
}

.father {
	margin: 20px
}

.child {
	background-color: rgb(255, 90, 95);
	border: 1px solid rgb(255, 90, 95);
	border-radius: 6px;
}

.word {
	font-family: "Microsoft Yahei";
	font-size: 20px;
	font-weight: bold;
	color: white;
	margin: 15px 150px;
}

.all {
	position: absolute;
	left: 145px;
}

.history {
	margin: 20px;
	float: left;
}
.x{
color:white;
}
</style>
</head>
<body>
	<h1>房屋详情</h1>
	<hr>
	<%
		int hid =Integer.parseInt(request.getParameter("hid"));
		String driver = "com.mysql.jdbc.Driver";
		String dbUrl = String.format("jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_messi");
		String username = "1nxyjx4mm3";
		String password1 = "m1j1iix43xm5mzwyk0jhxm2y3lkxhx0w3k50i45m";
		Class.forName(driver);
		Connection conn=DriverManager.getConnection(dbUrl,username,password1);
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery("select id_houseResource,picture,rent,city,district,street,architechturalType,evaluation,acreage from houseresource where id_houseResource = '"+hid+"'");
		
		if(rs.next())
		{
	%>
	<div class="main">
		<a href="details.jsp?id=<%=rs.getInt(1)%>" title="点击查看房屋信息"><img
			src="imag/<%=rs.getString(2)%>" width="860" height="580"
			border="1"></a> <br> ¥ <b><%=rs.getDouble(3)%></b>/月 &nbsp;<%=rs.getString(4)%><%=rs.getString(5)%><%=rs.getString(6)%>-<%=rs.getString(7)%><br>
		<%=rs.getString(8)%>条评价 <br> 面积：<%=rs.getString(9)%>㎡ <br>
		地址：<%=rs.getString(4)%><%=rs.getString(5)%><%=rs.getString(6)%><br> 
		<div class="x">
		<a href="Lessor2.jsp?id_lessor=<%=rs.getString(1)%>" title="点击查看出租者信息">点击查看出租者信息</a></div>
	</div>
	<%
		}
	%>
	<div class="father">
		<a href="login.jsp?"><button class="child">
				<div class="word">登录系统预订</div>
			</button></a>
	</div>
<%-- 	<!-- 浏览过的房源 -->
	<%
		String list = "";
		//从客户端获得Cookie集合
		Cookie[] cookies = request.getCookies();
		//遍历这个Cookie集合
		if (cookies != null && cookies.length > 0) {
			for (Cookie c : cookies) {
				if (c.getName().equals("ListViewCookie")) {
					list = c.getValue();
				}
			}
			list += request.getParameter("id") + "a";
			//如果浏览记录超过1000条，清零。
			String[] arr = list.split("a");
			if (arr != null && arr.length > 0) {
				if (arr.length >= 1000) {
					list = "";
				}
			}
			Cookie cookie = new Cookie("ListViewCookie", list);
			response.addCookie(cookie);
		}
	%>

	<div class="all">
		<h2>最近浏览</h2>
		<%
			ArrayList<HouseResource> houselist = houseDAO.getViewList(list);
			if (houselist != null && houselist.size() > 0) {
				for (HouseResource h : houselist) {
		%>
		<div class="history">
			<a href="details.jsp?id=<%=h.getID()%>" title="点击查看房屋信息"><img
				src="imag/<%=h.getPicture()%>" width="287" height="193" border="1"></a>
			<br> ¥ <b><%=h.getPrice()%></b>/月 &nbsp;<%=h.getCity()%><%=h.getDistrict()%><%=h.getStreet()%>-<%=h.getArchitecturalType()%><br>
			<%=h.getEvaluation()%>条评价 <br> 面积：<%=h.getAcreage()%>㎡ <br>
			地址：<%=h.getCity()%><%=h.getDistrict()%><%=h.getStreet()%><br> <a
				href="Lessors.jsp?ownerID=<%=h.getOwnerID()%>" title="点击查看出租者信息">点击查看出租者信息</a>
		</div>

		<%
			}
			}
		%>
	</div> --%>
</body>
</html>