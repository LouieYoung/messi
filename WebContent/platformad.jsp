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
       function freeze(){
            if(document.myform.tid.value==""){
              window.alert("ID不能为空！");
              return ;
            }
            else if(confirm("您确定要冻结吗？"))
            	{
            		myform.submit();
            	}
            else return;
       }
        function thaw(){
            //document.myform.method="post";
           /*  document.loginform.target="rightframe"; */
            document.myform.action="thaw.jsp";
            if(document.myform.tid.value==""){
                window.alert("ID不能为空！");
                return ;
              }
            else if(confirm("您确定要解冻吗？"))
        	{
            	document.myform.submit();
        	}
            else return;
        }
       
    </script>
    <script type="text/javascript">
       function freeze2(){
            if(document.regform.lid.value==""){
              window.alert("ID不能为空！");
              return ;
            }
            else if(confirm("您确定要冻结吗？"))
            	{
            	regform.submit();
            	}
            else return;
       }
        function thaw2(){
            //document.myform.method="post";
           /*  document.loginform.target="rightframe"; */
            document.regform.action="thaw2.jsp";
            if(document.regform.lid.value==""){
                window.alert("ID不能为空！");
                return ;
              }
            else if(confirm("您确定要解冻吗？"))
        	{
            	document.regform.submit();
        	}
            else return;
        }
       
    </script>
<table>
	<tr>
		<td>
			<form id="myform" name="myform" action="freezet.jsp" method="post" >
			<table>
			 	<tr>
			 	    <td>请输入租户ID</td>
					<td><input type="text" name="tid" > </td>
					
				</tr>
<!-- 				<tr>
					<td>
					<input type="radio" name="operation2" value="add" >增加
					<input type="radio" name="operation2" value="delete" >删除
					</td>
					<td>
					<input type="radio" name="operation2" value="update" >更新
					<input type="radio" name="operation2" value="query" >查询
					</td>
				</tr> -->
				<tr>
					<td><input type="button" value="冻结" onclick="freeze()"> </td>		
					<td><input type="button" value="解冻" onclick="thaw()"> </td>	
				</tr>
			</table>
			</form>
		</td>
		<td>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</td>
		<td>
			<form name="regform" action="freezel.jsp" method="post" >
			<table>
			 	<tr>
			 	    <td>请输入出租者ID</td>
					<td><input type="text" name="lid" > </td>
					
				</tr>
				<!-- <tr>
					<td>
					<input type="radio" name="operation3" value="add" >增加
					<input type="radio" name="operation3" value="delete" >删除
					</td>
					<td>
					<input type="radio" name="operation3" value="update" >更新
					<input type="radio" name="operation3" value="query" >查询
					</td>
				</tr> -->
				<tr>
					<td><input type="button" value="冻结" onclick="freeze2()"> </td>		
					<td><input type="button" value="解冻" onclick="thaw2()"> </td>		
				</tr>
			</table>
			</form>
		</td>
	</tr>
	<%
	String driver = "com.mysql.jdbc.Driver";
	String dbUrl = String.format("jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_messi");
	String username = "1nxyjx4mm3";
	String password1 = "m1j1iix43xm5mzwyk0jhxm2y3lkxhx0w3k50i45m";
	Class.forName(driver);
	Connection conn=DriverManager.getConnection(dbUrl,username,password1);
	Statement stmt=conn.createStatement();
	%>
	<tr>
		<td>
			<%

				ResultSet rs=stmt.executeQuery("select * from tenant");
			
			%>
			<br>
			<br>
			<h2>租户信息</h2>
				<hr>
			<table>
				<tr>
					<th>
						<%
							out.print("租户ID");
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
										<th>
					<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
					</th>
					<th>
						<%
							out.print("租户状态");
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
											<th>
					<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
					</th>
					<th>
						<%
							if(rs.getInt(6)==0)
							{
								out.print("正常");
							}
							else{out.print("冻结");}
						%>
					</th>
				</tr>
				<%
				}rs.close();
				%>
			</table>
		</td>
		<td>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</td>
		<td>
			<%

				rs=stmt.executeQuery("select * from lessor");
			
			%>
			<br>
			<br>
			<h2>出租者信息</h2>
				<hr>
			<table>
				<tr>
					<th>
						<%
							out.print("出租者ID");
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
															<th>
					<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
					</th>
					<th>
						<%
							out.print("出租者状态");
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
															<th>
					<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
					</th>
					<th>
						<%
						if(rs.getInt(6)==0)
						{
							out.print("正常");
						}
						else{out.print("冻结");}
						%>
					</th>
				</tr>
				<%
				}rs.close();
				%>
			</table>
		</td>
	</tr>
</table>	
	<%	
		stmt.close();
		conn.close(); 
	%>

</body>
</html>