<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登录界面</title>
<style type="text/css">
body {
	font-family: "Microsoft Yahei";
	font-size: 20px;
	color:white;
	background-image: URL("imag/back5.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	
}
	
h1{
	text-align: center;
}
.a{
	width:600px;
	position: absolute;
	left: 720px;
	top:250px;
	}
</style>
</head>
<body>
<script type="text/javascript">
       function check(obj){
            if(document.myform.name.value==""){
              window.alert("用户名不能为空！");
              return ;
            }
            else if(document.myform.password.value=="")
            {
                window.alert("密码不能为空！");
                return ;
            }
           /*  else if(confirm("您确定要冻结吗？"))
            	{
            		myform.submit();
            	} */
            else if(true){
                for (var i=0; i<obj.length; i++)
	                {
	                    if (obj[i].checked) break;
	                }
	                if (i==obj.length) 
	                	{
	                	window.alert("您未选择身份！");
	                	return;
	                	}
            	}
            myform.submit();
       }
</script>	
	<h1>用户登录</h1>
	<hr>
<div class="a">
	<form id="myform" name="myform" action="request.jsp" method="post" >
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
		<td>身份： </td>
		<td>
		<input type="radio" name="identity" value="systemad" >系统管理员
		<input type="radio" name="identity" value="platformad" >平台管理员
		<input type="radio" name="identity" value="tenant" >租户
		<input type="radio" name="identity" value="lessor" >出租者 
		</td>
	</tr>
	<tr>
		<td><input type="button" value="登录" onclick="check(myform.identity)"> </td>
		<td><input type="button" value="返回" onclick="window.location.href='index.jsp'"> </td>
		
	</tr>
	
	
	</table>
	</form>
</div>
</body>
</html>