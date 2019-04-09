<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
<!-- <form name="regform" action="handle.jsp" method="post" >
<table>
 	<tr>
 	    <td>请输入平台管理员id</td>
		<td><input type="text" name="name" > </td>
		
	</tr>
	<tr>
		<td>
		<input type="radio" name="operation1" value="add" >增加
		<input type="radio" name="operation1" value="delete" >删除
		</td>
		<td>
		<input type="radio" name="operation1" value="update" >更新
		<input type="radio" name="operation1" value="query" >查询
		</td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="确定"> </td>		
	</tr>
</table>
</form> -->
<table>
	<tr>
	<td><input type="button" onclick="window.location.href='addplatformad.jsp'" value="增添平台管理员"></td>
	<td><input type="button" onclick="window.location.href='deleteplatformad.jsp'" value="删除平台管理员"></td>
	</tr>
	
	
</table>
<%
	String driver = "com.mysql.jdbc.Driver";
	String dbUrl = String.format("jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_messi");
	String username = "1nxyjx4mm3";
	String password1 = "m1j1iix43xm5mzwyk0jhxm2y3lkxhx0w3k50i45m";
	Class.forName(driver);
	Connection conn=DriverManager.getConnection(dbUrl,username,password1);
	Statement stmt=conn.createStatement();
	ResultSet rs=stmt.executeQuery("select * from platformad");

%>
<br>
<br>
<h2>平台管理员信息</h2>
	<hr>
<table>
	<tr>
		<th>
			<%
				out.print("平台管理员ID");
			%>
		</th>
		<th>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</th>
		<th>
			<%
				out.print("用户名");
			%>
		</th>
		<th>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</th>
		<th>
			<%
				out.print("密码");
			%>
		</th>
				<th>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</th>
		<th>
			<%
				out.print("电话");
			%>
		</th>
				<th>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</th>
		<th>
			<%
				out.print("邮箱");
			%>
		</th>
	</tr>
	<%
	while(rs.next())
	{
	%>
	<tr>
		<th>
			<%
				out.print(rs.getInt(1));
			%>
		</th>
		<th>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</th>
		<th>
			<%
				out.print(rs.getString(2));
			%>
		</th>
		<th>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</th>
		<th>
			<%
				out.print(rs.getString(3));
			%>
		</th>
				<th>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</th>
		<th>
			<%
				out.print(rs.getString(4));
			%>
		</th>
				<th>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</th>
		<th>
			<%
				out.print(rs.getString(5));
			%>
		</th>
	</tr>
	<%
	}
	%>
</table>

<%	
	rs.close();
	stmt.close();
	conn.close(); 
%>
</body>
</html>