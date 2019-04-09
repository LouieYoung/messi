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
<script type="text/javascript">
       function check(obj){
            if(document.myform.hid.value==""){
              window.alert("房源ID不能为空！");
              return ;
            }
            else if(true){
                for (var i=0; i<obj.length; i++)
	                {
	                    if (obj[i].checked) break;
	                }
	                if (i==obj.length) 
	                	{
	                	window.alert("您未选择操作！");
	                	return;
	                	}
            	}
       		myform.submit();
       }
</script>	
<% int id=(int)session.getAttribute("llid"); %>
<form name="myform" action="handlelessor.jsp" method="post" >
	<table>
	 	<tr>
	 	    <td>请输入房源ID</td>
			<td><input type="text" name="hid" > </td>
			
		</tr>
		<tr>
			<td>
			<input type="button" name="operation4" onclick="window.location.href='addforhouseresource.jsp'" value="增加房源(不用输入ID)" ><!-- 若输入的房源ID不存在则以该ID为新房源ID，否则找最大的加1 -->
			<input type="radio" name="operation4" value="delete" >删除房源
			<!-- <input type="radio" name="operation4" value="update" >更新 -->
			</td>
			<td>
			<input type="radio" name="operation4" value="confirm" >确认订单
			<input type="radio" name="operation4" value="recover" >恢复为可出租状态
			</td>
			<td>
			<input type="radio" name="operation4" value="sign" >签合同
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="确定" onclick="check(myform.operation4)"> </td>		
		</tr>
	</table>
</form>
	
	<% 
	String driver = "com.mysql.jdbc.Driver";
	String dbUrl = String.format("jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_messi");
	String username = "1nxyjx4mm3";
	String password1 = "m1j1iix43xm5mzwyk0jhxm2y3lkxhx0w3k50i45m";
	Class.forName(driver);
	Connection conn=DriverManager.getConnection(dbUrl,username,password1);
	Statement stmt=conn.createStatement();
	ResultSet rs=stmt.executeQuery("select id_houseResource,rent,isRented,city,district,street,architechturalType,acreage from houseresource where id_lessor = '"+id+"'");

	%>
<br>
<br>
<h2>我的房源信息</h2>
	<hr>
<table>
	<tr>
		<th>
			<%
				out.print("我的房源ID");
			%>
		</th>
		<th>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</th>
		<th>
			<%
				out.print("租价");
			%>
		</th>
		<th>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</th>
		<th>
			<%
				out.print("房屋状态");
			%>
		</th>
		<th>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</th>
		<th>
			<%
				out.print("地址");
			%>
		</th>
		<th>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</th>
		<th>
			<%
				out.print("房屋类型");
			%>
		</th>
		<th>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</th>
		<th>
			<%
				out.print("房屋面积");
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
				out.print(rs.getDouble(2));
			%>
		</th>
		<th>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</th>
		<th>
			<%
				if(rs.getInt(3)==1)
				{
					out.print("待签合同");
				}
				else if(rs.getInt(3)==0)
				{
					out.print("可被租");
				}
				else if(rs.getInt(3)==2)
				{
					out.print("已被租");
				}
				else
				{
					out.print("可被租(有用户提交了订单)");
				}
			%>
		</th>
		<th>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</th>
		<th>
			<%
				out.print(rs.getString(4)+"-"+rs.getString(5)+"-"+rs.getString(6));
			%>
		</th>
			<th>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</th>
		<th>
			<%
				out.print(rs.getString(7));
			%>
		</th>
			<th>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</th>
		<th>
			<%
				out.print(rs.getDouble(8));
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