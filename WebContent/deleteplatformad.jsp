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
<h1>删除平台管理员</h1>
<form name="regform88" action="handledelete.jsp" method="post" >
<table>
 	<tr>
 	    <td>请输入平台管理员ID</td>
		<td><input type="text" name="plid" > </td>		
	</tr>
	<tr>
		<td><input type="submit" value="确定"> </td>	
		<td><input type="button" value="返回"  onclick="window.location.href='systemad.jsp'"> </td>		
	</tr>
</table>
</form>
<hr>
</body>
</html>