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
		String hid = request.getParameter("hid");	
		session.setAttribute("hid",request.getParameter("hid"));
		
		switch(request.getParameter("operation4")){
			case "add":
				out.println("跳转中……-");
				if(hid==null)
				{
					out.println("输入房源号为空，请重新输入");
					response.setHeader("refresh","1;URL=lessor.jsp");
				}
				else response.setHeader("refresh","1;URL=addhouseresource.jsp");
				break;
			case "delete":
				out.println("跳转中……-");
				response.setHeader("refresh","1;URL=deletehouseresource.jsp");
				break;
			case "sign":
				out.println("跳转中……-");
				response.setHeader("refresh","1;URL=signhouseresource.jsp");
				break;
/* 			case "update":
				out.println("跳转中……-");
				response.setHeader("refresh","1;URL=updatehouseresource.jsp");
				break; */
		/* 	case "sign":
				out.println("跳转中……-");
				response.setHeader("refresh","1;URL=signhouseresource.jsp");
				break; */
			case "confirm":
			out.println("跳转中……-");
			response.setHeader("refresh","1;URL=confirmhouseresource.jsp");
			break;
			case "recover":
				out.println("跳转中……-");
				response.setHeader("refresh","1;URL=recoverhouseresource.jsp");
				break;
			default:
				out.println("请选择按钮");
				response.setHeader("refresh","1;URL=tenant.jsp");
				break;
		
		}
	
	
	%>
	
</body>
</html>