<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
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
 <script type="text/javascript">
       function check(){
            if(document.myform.tid.value==""){
              window.alert("租户ID不能为空！");
              return ;
            }
           myform.submit();
       }
</script>	
	<form id="myform" name="myform" action="handleconfirm.jsp" method="post" >
		<table>
		 	<tr>
		 	    <td>请输入要确认的租户ID</td>
				<td><input type="text" name="tid" > </td>
				
			</tr>
			<tr>
				<td ><input type="button" value="确定" onclick="check()"> </td>
				<td ><input type="button" onclick="window.location.href='lessor.jsp'" value="返回">	</td>	
			</tr>
		</table>
	</form>
	<hr>
	<% int id=(int)session.getAttribute("llid"); %>
	<% int hid=Integer.parseInt(session.getAttribute("hid").toString());  %>
	<%
	String driver = "com.mysql.jdbc.Driver";
	String dbUrl = String.format("jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_messi");
	String username = "1nxyjx4mm3";
	String password1 = "m1j1iix43xm5mzwyk0jhxm2y3lkxhx0w3k50i45m";
	Class.forName(driver);
	Connection conn=DriverManager.getConnection(dbUrl,username,password1);
	Statement stmt=conn.createStatement();
	Statement stmt2=conn.createStatement();
	ResultSet rs=stmt.executeQuery("select T.name,T.id_tenant,T.phone,T.email from reservation as R,tenant as T where R.id_houseResource='"+hid+"' and R.id_tenant=T.id_tenant and R.state =1");
	%>
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
				out.print("租户姓名");
			%>
		</th>
		<th>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</th>
		<th>
			<%
				out.print("租户电话");
			%>
		</th>
		<th>
		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
		</th>
			<th>
			<%
				out.print("租户邮箱");
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
	    				out.print(rs.getInt(2));
	    			%>
	    		</th>
	    		<th>
	    		<%out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); %>
	    		</th>
	    		<th>
	    			<%
	    				out.print(rs.getString(1));
	    			
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
	  </tr>
	  <%} %>
	</table>
	<%
	rs.close();
	stmt.close();
	stmt2.close();
	conn.close();
	%>
</body>
</html>