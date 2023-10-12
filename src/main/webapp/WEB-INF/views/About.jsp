<%@page import="bank_app.dto.BankService"%>
<%@page import="bank_app.dto.About"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>About</title>
	<style type="text/css">
		nav{
			
		}
		p{
			margin: 10px 150px 0px 150px;
			padding: 30px;
			border: 2px solid violet;
			border-radius: 20px;
			color:#3b722e;
		}
		ul{
			padding-left: 250px;
		}
		ul li{
		color: #ff9a9a;
		}
		marquee{
			margin: 0px 240px 0px 140px;
			padding: 10px 10px;
			background: aqua;
			color: goldenrod;
			font-weight: bolder;
			font-size: 900;
			border: 2px solid gainsboro;
			border-radius: 5px;
		}
	</style>

</head>
<body>
<%
About about=(About)request.getAttribute("about");
List<BankService> services=about.getServices();
%>
	<div>
		<h1 style="color: #008877;">Our Services :-</h1>
	
	    <ul>
	    <%for(BankService service:services){ %>
	    <li><%=service %> </li>
	    <%} %>
	    </ul>
	    <marquee>Visit to our nearest branch for more information .....</marquee>
	</div>
	
	<h1 style="color:#ffc6eb">About Us :-</h1>
	<p>
	<%=about.getInfo() %>
		
	</p>
	

</body>
</html>