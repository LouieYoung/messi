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
<% int id=(int)session.getAttribute("ttid");

%>
<script type="text/javascript">
       function check(obj){
            if(document.myform.rid.value==""){
              window.alert("订单ID不能为空！");
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
<script type="text/javascript">
       function check2(){
            if(document.regform.name2.value==""){
              window.alert("房源ID不能为空！");
              return ;
            }
          
    
            regform.submit();
       }
</script>	
<table>
<tr>
	<td>
		<form id="myform" name="myform" action="handle2.jsp" method="post"  >
			<table>
			 	<tr>
			 	    <td>请输入待提交订单ID</td>
					<td><input type="text" name="rid"> </td>
					
				</tr>
				<tr>
					<td>
					<input type="radio" name="operation5" id="operation5" value="submit" >提交为正式订单
					</td>
					<td>
					<input type="radio" name="operation5" id="operation5" value="delete" >删除非正式订单
					<!-- <input type="radio" name="operation5" id="operation" value="update" >更新 -->
					<!-- <input type="radio" name="operation5" id="operation" value="query" >查询 -->
					</td>
					<td>
					<input type="radio" name="operation5" id="operation5" value="sign" >签合同
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="确定" onclick="check(myform.operation5)"> </td>		
				</tr>
			</table>
		</form>
	</td>
	<td>
	<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
	</td>
	<td>
		<form id="regform" name="regform" action="addreservation.jsp" method="post" >
			<table>
			 	<tr>
			 	    <td>请输入房源ID</td>
					<td><input type="text" name="name2" > </td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="添加为预订单" onclick="check2()"> </td>		
				</tr>
			</table>
		</form>
	</td>
</tr>
<tr>
	<td>
	<% 
	String driver = "com.mysql.jdbc.Driver";
	String dbUrl = String.format("jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_messi");
	String username = "1nxyjx4mm3";
	String password1 = "m1j1iix43xm5mzwyk0jhxm2y3lkxhx0w3k50i45m";
	Class.forName(driver);
	Connection conn=DriverManager.getConnection(dbUrl,username,password1);
	Statement stmt=conn.createStatement();
	//ResultSet rs=stmt.executeQuery("select * from reservation where reservation.id_tenant = '"+id+"'");
	//ResultSet rs=stmt.executeQuery("select reservation.id_reservation,reservation.id_houseResource,lessor.name from lessor,houseresource,reservation where lessor.id_lessor=houseresource.id_lessor and houseresource.id_houseResource=reservation.id_houseResource and reservation.id_tenant = '"+id+"'");
	ResultSet rs=stmt.executeQuery("select C.id_reservation,C.id_houseResource,A.name,C.state from lessor as A,houseresource as B,reservation as C where A.id_lessor = B .id_lessor and B.id_houseResource =C.id_houseResource and C.id_tenant = '"+id+"'");
	%>
<br>
<br>
<h2>我的订单信息</h2>
	<hr>

<table>
	<tr>
		<th>
			<%
				out.print("我的订单ID");
			%>
		</th>
		<th>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</th>
		<th>
			<%
				out.print("房源ID");
			%>
		</th>
		<th>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</th>
		
		<th>
			<%
				out.print("出租者姓名");
			%>
		</th>
		<th>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</th>
		
		<th>
			<%
				out.print("订单状态");
			%>
		</th>
	</tr>
	<tr>
		<%
		while(rs.next())
		{
			switch(rs.getInt(4))
			{
			case 0:
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
	    				out.print(rs.getInt(2));
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
	    				out.print("预订单");
	    			%>
	    		</th>
	    	</tr>
		<% 
	       break;
	       case 1:
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
	    				out.print(rs.getInt(2));
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
	    				out.print("等待出租者确认");
	    			%>
	    		</th>
			</tr>
		<% 
	       break;
	       case 2:
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
	    				out.print(rs.getInt(2));
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
	    				out.print("出租者已确认订单(可签合同)");
	    			%>
	    		</th>
	    	</tr>
	    <%
	    	break;
	        case 3:
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
	    				out.print(rs.getInt(2));
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
	    				out.print("生效订单");
	    			%>
	    		</th>
	    	</tr>
	    	<%
	    	break;
	        case 4:
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
	    				out.print(rs.getInt(2));
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
	    				out.print("历史订单");
	    			%>
	    		</th>
	    	</tr>
	    	<%
	    	break;
	        case 5:
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
	    				out.print(rs.getInt(2));
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
	    				out.print("失效订单");
	    			%>
	    		</th>
	    	</tr>
		<%
			break;
			}
	}
	%>
	<!-- </tr> -->
	</table>
	<%	
		rs.close();
	 	//rs2.close();
	%>
	</td>
	<td>
	<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
	</td>
	<td>
	<% 
		rs=stmt.executeQuery("select id_houseResource,rent,isRented,city,district,street,architechturalType,acreage from houseresource where isRented =0 or isRented=3");
	%>
	<h2>可租房源信息</h2>
		<hr>
	<table>
		<tr>
			<th>
				<%
					out.print("可租房源ID");
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
		stmt.close();
		conn.close(); 
	%>
	</td>
</tr>
</table>
</body>
</html>