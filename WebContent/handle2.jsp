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
	<%
		request.setCharacterEncoding("utf-8");
	%>
	
	<% 
	String r = request.getParameter("rid");
	
	session.setAttribute("rid",request.getParameter("rid"));
	
	switch(request.getParameter("operation5")){
		case "submit":
			out.println("跳转中……-");
			if(r==null)
			{
				out.println("输入订单号为空，请重新输入");
				response.setHeader("refresh","1;URL=tenant.jsp");
			}
			else response.setHeader("refresh","1;URL=submitreservation.jsp");
			break;
		case "sign":
			out.println("跳转中……-");
			response.setHeader("refresh","1;URL=contract.jsp");
			break;
		case "delete":
			out.println("跳转中……-");
			response.setHeader("refresh","1;URL=deletereservation.jsp");
			break;
		case "update":
			out.println("跳转中……-");
			response.setHeader("refresh","1;URL=updatereservation.jsp");
			break;
		case "query":
			out.println("跳转中……-");
			response.setHeader("refresh","1;URL=queryreservation.jsp");
			break;
		default:
			out.println("请选择按钮");
			response.setHeader("refresh","1;URL=tenant.jsp");
			break;
	}
	
	
	%>
	
</body>
</html>