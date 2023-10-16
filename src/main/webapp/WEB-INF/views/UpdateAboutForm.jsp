<%@page import="bank_app.dto.About"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Admin Home</title>
	<style>
	body{
			margin: 0px;
			padding: 0px;
			overflow: hidden;
			
		}
		nav{
			display: flex;
			justify-content: center;
			align-items: center;
			margin: 0px;
			background: #EEEEDD;
			border-radius: 10px;
		}
		nav ul{
			display: flex;
			list-style: none;
			margin: 0px;
			padding: 10px 0px;
		}
		nav ul li{
			padding: 0px 30px;
		}
		.customer-section ul li a{
			text-decoration: underline;
			color: deepskyblue;
			font-weight: bold;
			font-size: large;

		}
		a:hover{
			color: blue;
		}
		#firstitem{
			padding: 0px 0px 0px 0px;
		}
		img{
			height: 93vh;
			width: 100vw;
		}
		.imagediv{
			height: 80vh;
			width: 100vw;
			overflow: hidden;
/*			background-image: url("adminback2.jpg");*/
			background-attachment: fixed;
			background-repeat: no-repeat;
			background-position: center ;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		.list-1 li a{
			text-align: center;
			margin-top: 20px;
		}
		.customer-section{
			height: inherit;
			border: 2px solid mediumvioletred;
			border-radius: 5px;
			margin-left: 100px;
		}
		.customer-section h3{
			margin: 0px;
			padding: 5px;
			color: coral;
		}
		.customer-section-head{
			text-align: center;
		}
		#customer-section-head{
			border-bottom: 2px solid pink;
			border-radius: 20px;
			text-align: center;
			margin-bottom: 0px;
			padding-bottom: 0px;
		}
		#customer-section-list ul{
			margin-top: 0px;
			padding-top: 10px;
		}
		.other-li a{
			color: mediumvioletred;
			font-weight: bold;
			font-size: large;
			text-decoration: none;
		}
		nav ul li a:hover{
			color: blue;
		}
		form{
			border: 2px solid violet;
			border-radius: 5px;
			padding: 20px;
			background: ghostwhite;
			text-align: center;
			color: mediumvioletred;
		}
		form textarea:hover{
			background: lightcyan;

		}
		#submit:hover{
			text-align: center;
			background: blue;
		}

	</style>
</head>
<body>
<%
About about=(About)request.getAttribute("about");
%>
	<nav>
		<ul class="list-1">
			<li id="firstitem" class="other-li"><a href="adminhome">Home</a>
			</li>

		</ul>
		<div class="customer-section">
			<div id="customer-section-head">
				<h3>Customer Section</h3>
			</div>

			<div id="customer-section-list">
				<ul >
			<li><a href="viewbyid">View By Id</a> </li>

			<li><a href="viewbyemail">View By AccNo.</a></li>
			<li><a href="shoallusers">View All</a></li>
		
		</ul>
			</div>
		</div>
		<ul>
			<li id="secitem" class="other-li"><a href="Home.html">About Us</a>
			</li>
		</ul>
	</nav>
	<div class="imagediv">
		<form action="updateabout" method="post">
			<h2 style="color: rebeccapurple; text-decoration: underline; text-decoration-color: palevioletred ;">Update About page</h2>
			Update Marquee :- <br>
			<textarea rows="2" cols="30" name="marquee">
				<%= about.getMarquee() %>
			</textarea ><br><br>
			Update About Us :- <br>
			<textarea name="info" rows="7" cols="30">
				<%= about.getInfo() %>
			</textarea><br><br>
			<input type="submit" value="update" style="color: blue;background: wheat; border: 1.5px solid green; border-radius: 4px;" id="submit">

		</form>
	</div>

</body>
</html>