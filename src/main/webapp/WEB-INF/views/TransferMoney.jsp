<%@page import="javax.persistence.criteria.CriteriaBuilder.In"%>
<%@page import="com.google.inject.spi.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Transfer Money</title>
	<style>
	body{
			margin: 0px;
			padding: 0px;
			overflow: hidden;
		}
		nav{
			display: flex;
			background: fuchsia;
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
		nav ul li a{
			text-decoration: underline;
			color: blue;
			font-weight: bold;
			font-size: large;

		}
		a:hover{
			color: goldenrod;
		}
		#firstitem{
			padding: 0px 30px 0px 260px;
		}
		img{
			height: 93vh;
			width: 100vw;
		}
		.imagediv{
			height: 100vh;
			width: 100vw;
			overflow: hidden;
			background-image: url("customerback2.jpg") ;
			background-attachment: fill;
			background-repeat: no-repeat;
			background-position: center ;

		}

.md {
	display: flex;
	flex-direction: column;
	border: 2px solid grey;
	justify-content: center;
	height: 73vh;
	align-items: center;
	background-color: inherit;

}

input {
	text-align: center;
	border: none;
	padding: 2px;
	color: blue;
}

h1 {
	color: gold;
}
form{
	background: white;
	padding: 50px;
	text-align: center;
	border:1px solid green;
	border-radius: 30px;
}
form input{
	border-radius: 5px;
	border: 1px solid red;
}
form input:hover{
	border: 1px solid green;
	background: lime;
}
form #msg{
color: lime;
text-decoration: underline;

}
form a:hover{
	color: blue;
}
</style>
</head>
<body>
	<nav>
		<ul>
			<li id="firstitem"><a href="userhome">Home</a> </li>
		
			<li><a href="checkbalance" onclick="close()">Account Balance</a> </li>
			<li><a href="viewuser" onclick="close()">My Account </a> </li>
			<li><a href="checkpinpage" onclick="close()">Update Account</a> </li>			
			<li><a href="viewhistory" onclick="close()">Transaction History</a> </li>
		
		</ul>
	</nav>
	<div class="imagediv"> 
		<div class="md">
		<form action="maketransaction" method="post">
		<h1 style="text-decoration: pink underline;">Transaction</h1>
		
		<%
		Object codeObj=request.getAttribute("code");
		if(codeObj!=null){
		int code=(Integer)codeObj;
		if(code==0||code==10||code==20||code==30){
		%>
		<h2 id="msg"><%= (String) request.getAttribute("message") %> </h2>
		<%}} %>

			<input type="text" name="receiver.email" placeholder="receivers email" required="required"><br>
			<br> <input type="number" name="amount" placeholder="Enter amount" required="required"><br>
			<br>
			<input type="text" name="pin" placeholder="your pin" required="required"><br>
			<br>
			 <input type="submit" class="button">
			<br><br>
		</form>
	</div>
		
	</div>
</body>
</html>