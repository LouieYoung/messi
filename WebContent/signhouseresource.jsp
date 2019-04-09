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
            if(document.myform.lpersoncard.value==""){
              window.alert("身份证号不能为空！");
              return ;
            }
            else if(document.myform.lphone.value=="")
            {
                window.alert("电话不能为空！");
                return ;
            }
           myform.submit();
       }
</script>	
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
	ResultSet rs=stmt.executeQuery("select R.id_reservation from houseresource as H,reservation as R where H.id_lessor = '"+id+"' and H.id_houseResource = '"+hid+"' and H.isRented=1 and R.id_houseResource = '"+hid+"' and R.state=2");
/* while(true)
{
	if(rs.next())
	{
		session.setAttribute("ridforcontract", rs.getInt(1));

	int rid=Integer.parseInt(session.getAttribute("ridforcontract").toString());
	ResultSet rs2=stmt2.executeQuery("select t_phone,t_personcard from contract where id_reservation='"+rid+"'"); */
/* 	if(rs2.next())
	{
		String tphone = rs.getString(1);
		String tpersoncard = rs.getString(2);
	} */
	/*  if(rs.next())
	{
		stmt2.executeUpdate("insert into contract(l_name,l_phone,l_personcard) values('"+a+"','"+hid+"','"+id+"',0)");
	
	} */
	
	
	
	
	%>




<h1>合同</h1>
	<hr>
	<p>
	<% if(rs.next())
	{
		session.setAttribute("ridforcontract", rs.getInt(1));
		int rid=Integer.parseInt(session.getAttribute("ridforcontract").toString());
		ResultSet rs2=stmt2.executeQuery("select state from contract where id_reservation='"+rid+"'");
		if(rs2.next())
		{
			if(rs2.getInt(1)!=2&&rs2.getInt(1)!=3)	
			{
				out.print("租户还未签合同");
			}
		    if(rs2.getInt(1)==2&&rs2.getInt(1)!=3)
			{
				out.print("租户已签合同");
			}
			rs2.close();
		}
	
	} %>
	</p>
		<form id="myform" name="myform" action="handlecontract2.jsp" method="post"  ><!--   -->
			<table>
				<%-- <%if(rs2.next()) {%> --%>
				<tr>  <td>出租方(简称乙方) 身份证号： </td> <td><%-- <%out.print(rs2.getString(2)); %> --%> </td></tr>
				<tr>  <td>电话： </td> <td><%-- <%out.print(rs2.getString(1)); %> --%></td> </tr>
				<%-- <%} %> --%>
				<tr>
			 	<td>  承租方(简称甲方) 身份证号：  </td>
				<td><input type="text" name="lpersoncard" id="lpersoncardid" > </td>				
				</tr>
				<tr>
			 	<td>电话：  </td>
				<td><input type="text" name="lphone" id="lphoneid" > </td>				
				</tr>
				<tr>  <td colspan="2">为了个人的房屋使用率，现甲乙双方协商一致同意订立租赁合同，条款如下： </td> </tr>
				<tr>  <td colspan="2">一、甲方将拥有产权或处置权的北京市 房屋(建筑面积 平方米)，出租给乙方居住使用。   </td> </tr>
				<tr>  <td colspan="2">二、租期从 年 月 日起至 年 月 日止。 </td> </tr>
				<tr>  <td colspan="2">三、该房屋每月租金为人民币 元整，乙方按 向甲方缴纳租金，甲方须开具收据或发票给乙方。 </td> </tr>
				<tr>  <td colspan="2">四、甲方应保证在 年 月 日之前向乙方交付房屋，否则须承担相当于一个月房租的违约金。房屋交付时，乙方应向甲方交纳 元整的室内财物押金，上述押金甲方应于合同解除时退还乙方。 </td> </tr>
				<tr>  <td colspan="2">五、租赁期间房屋的管理费、供暖费等由甲方负责交纳。 </td> </tr>
				<tr>  <td colspan="2">六、甲方应承担房屋工程质量及附属设施维修的责任，乙方发现该房屋及其附属设施有非人为损坏或故障时，须通知甲方，甲方应在接到乙方通知后3日内进行维修，逾期不维修的，乙方可代为维修，费用由甲方承担。 </td> </tr>
				<tr>  <td colspan="2">七、租赁期满或解除合同时，乙方需结清费用后退还房屋给甲方。 </td> </tr>
				<tr>  <td colspan="2">八、租赁期间，乙方有权将房屋转租给第三方。 </td> </tr>
				<tr>  <td colspan="2">九、如遇地震、火灾等不可抗力，本合同自动终止。 </td> </tr>
				<tr>  <td colspan="2">十、如遇该房屋拆迁，甲方可以解除合同，但须提前一个月通知乙方。 </td> </tr>
				<tr>  <td colspan="2">十一、如甲方未按本合同约定履行义务，应向乙方支付相当于一个月房租的违约金，且乙方有权解除合同;租赁期间，如遇有特殊情况，乙方有权解除合同，但必须提前一个月通知甲方。 </td> </tr>	
				<tr>  <td colspan="2">十二、本合同如在履行中发生纠纷，双方应通过协商解决纠纷，协商不成可起诉至人民法院处理。 </td> </tr>
				<tr>  <td colspan="2">十三、其他约定事项： </td> </tr>
				<tr>  <td colspan="2">1、甲方保证在交付该租赁房屋时备全相关家具、家电，包括：双人床一张、冰箱、电热水器、燃气灶等，且保证都能正常使用。 </td> </tr>
				<tr>  <td colspan="2">十四、本合同经双方签字或盖章后即时生效，一式两份，甲乙双方各执一份，如有未尽事宜，可经双方协商作出补充规定，均具同等法律效力。  </td> </tr>
				<tr>
					<td ><input type="button" value="确定" onclick="check()"> </td>	
					<td><input type="button" onclick="window.location.href='lessor.jsp'" value="返回">	</td>
				</tr>
			</table>
		</form>
<%

	rs.close();	
	
	//break;
	/* } */

	/* out.print("非待签合同订单，请重新输入");
	response.setHeader("refresh","3;URL=lessor.jsp"); */
	//break;



/* } */

stmt.close();	
stmt2.close();	
conn.close();

%>	
</body>
</html>