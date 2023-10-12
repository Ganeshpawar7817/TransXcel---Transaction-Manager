<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>UserHome</title>
	<style>
	body{
			margin: 0px;
			padding: 0px;
			overflow: hidden;
		}
		nav{
			display: flex;
			background: aqua;
			border: 1px solid grey;
			border-radius: 100px;
		
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
			color: maroon;
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
		<%--	background-image: url("../backImg/customerback2.jpg") ; --%>
			background-attachment: fill;
			background-repeat: no-repeat;
			background-position: center ;

		}
	</style>
</head>
<body>
	<nav>
		<ul>
			
			<li><a href="transfermoney" onclick="close()" id="firstitem">Transfer Money</a> </li>
			<li><a href="checkbalance" onclick="close()">Account Balance</a> </li>
			<li><a href="viewuser" onclick="close()">My Account </a> </li>
			<li><a href="checkpinpage" onclick="close()">Update Account</a> </li>			
			<li><a href="viewhistory" onclick="close()">Transaction History</a> </li>

		</ul>
	</nav>
	<div class="imagediv">
	<% 
	Object codeObj=request.getAttribute("code");
	
	if(codeObj!=null){
	int code=(Integer)codeObj;
	if(code==100){
	double balance=(Double)request.getAttribute("balance");
	%> 
	<script type="text/javascript">
	alert("Your Account balance is '"+<%=balance %>+"'");
	</script>
	
	<%}else if(code==333){ %>
	
	<script type="text/javascript">
	alert("Account Updated SuccessFully !!");
	</script>
	<%}else if(code==0){ %>
	<script type="text/javascript">
	alert("Sorry Account Not Found ??");
	</script>
	<%} else if(code==222){ %>
			
				<script type="text/javascript">
				alert("Transaction Successful !!");
				</script>
				
			
	<%}} %>
	
	<script type="text/javascript">
	function confirm() {
		alert("Are you sure want to delete your account ??")
	}
	function close() {
		window.close();
	}
	</script>
	
	</div>
</body>
</html>