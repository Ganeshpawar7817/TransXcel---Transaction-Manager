<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Check Balance</title>
	<style>
	body{
			margin: 0px;
			padding: 0px;
			overflow: hidden;
		}
		nav{
			display: flex;
			background: grey;
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
			color: yellow;
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
			height: 93vh;
			width: 100vw;
			overflow: hidden;
			display: flex;
			justify-content: center;
			align-items: center;
		<%--	background-image: url("customerback2.jpg") ; --%>
			
			background-attachment: fill;
			background-repeat: no-repeat;
			background-position: center ;

		}
		form{
			border: 2px solid green;
			border-radius: 20px;
			text-align: center;
			padding: 40px;
			margin: 0px;
		}
		form input{
			text-align: center;
		}
	</style>
</head>
<body>
	<nav>
		<ul>
			<li id="firstitem"><a href="userhome">Home</a> </li>
			<li><a href="transfermoney" onclick="close()" >Transfer Money</a> </li>
			<li><a href="checkbalance" onclick="close()">Account Balance</a> </li>
			<li><a href="viewuser" onclick="close()">My Account </a> </li>			
			<li><a href="viewhistory" onclick="close()">Transaction History</a> </li>		

		</ul>
	</nav>
   
	<div class="imagediv"> 
		<form action="updateaccountcheckpin">
		 <%
    Object codeObj=request.getAttribute("code");
    if(codeObj!=null){
    	int code=(Integer)codeObj;
    	if(code==0){ %>
    	<h1 id="msg" style=" color:red ; text-decoration: underline;">Incorrect Pin ??</h1> 
    	
    	<%}}%>
			
			<input type="password" name="pin" placeholder="Enter Pin"><br><br>
			<input type="submit" name="" style="color: blue;">
		</form>
	</div>

</body>
</html>