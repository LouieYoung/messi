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
	text-align: center;
}
.a{
	width:300px;
	position: absolute;
	left: 810px;
	top:250px;
	}
</style>
</head>
<body>
<script type="text/javascript">
       function check(obj){
            if(document.myform.type.value==""){
              window.alert("建筑类型不能为空！");
              return ;
            }
            else if(document.myform.acreage.value=="")
            {
                window.alert("面积不能为空！");
                return ;
            }
            else if(document.myform.price.value=="")
            {
                window.alert("价格不能为空！");
                return ;
            }
            else if(document.myform.price.value=="")
            {
                window.alert("密码不能为空！");
                return ;
            }

            else if(document.myform.city.value=="")
            {
                window.alert("城市不能为空！");
                return ;
            }

            else if(document.myform.district.value=="")
            {
                window.alert("区域不能为空！");
                return ;
            }
            else if(document.myform.street.value=="")
            {
                window.alert("街道不能为空！");
                return ;
            }

             myform.submit();
       }
</script>	
	<h1>填写房源信息</h1>
	<hr>
<div class="a">
<form id="myform" name="myform"action="handleaddhouse.jsp" method="POST">
<table>
	<tr>
	<td>建筑类型:</td>
    <td><input type="text" name="type"></td>
	</tr>
	<tr>
	<td>面积:</td>
    <td><input type="text" name="acreage"></td>
	</tr>
	<tr>
	<td>价格:</td>
    <td><input type="text" name="price"></td>
	</tr>
	<tr>
	<td>城市:</td>
    <td><input type="text" name="city"></td>
	</tr>
	<tr>
	<td>区域:</td>
    <td><input type="text" name="district"></td>
	</tr>
	<tr>
	<td>街道:</td>
    <td><input type="text" name="street"></td>
	</tr>
	<tr>
	<td><input type="button" value="提交" onclick="check()"></td>
	<td><input type="button" value="返回" onclick="window.location.href='lessor.jsp' "></td>
	</tr>
</table>
</form>
</div>	
</body>
</html>