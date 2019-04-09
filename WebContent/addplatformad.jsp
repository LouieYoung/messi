<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h1>新增平台管理员</h1>
<hr>
<form name="regform77" action="handleadd.jsp" method="post" >
<table>
	<tr>
		<td>用户名： </td>
		<td><input type="text" name="name" > </td>
	</tr>
	<tr>
		<td>密码： </td>
		<td><input type="text" name="password" > </td>
	</tr>
		<tr>
		<td>电话： </td>
		<td><input type="text" name="phone" > </td>
	</tr>
		<tr>
		<td>邮箱： </td>
		<td><input type="text" name="email" > </td>
	</tr>
	<tr>
		<td ><input type="submit" value="确定"> </td>	
		<td ><input type="button" value="返回" onclick="window.location.href='systemad.jsp'"> </td>		
	</tr>
</table>
</form>
</body>
</html>