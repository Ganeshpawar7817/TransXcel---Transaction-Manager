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
			height: 93vh;
			width: 100vw;
			overflow: hidden;
			background-image: url("customerback2.jpg") ;
			display: flex;
			align-items: center;
			justify-content: center;
			background-attachment: fill;
			background-repeat: no-repeat;
			background-position: center ;

		}
	</style>
</head>
<body>
	<nav>
		<ul>
			<li id="firstitem" onclick="close()"><a href="userhome">Home</a> </li>
			<li><a href="#" onclick="close()">Transfer Money</a> </li>
			<li><a href="viewaccount" onclick="close()">View Account</a> </li>
			<li><a href="checkbalance" onclick="close()">Check Balance</a> </li>
			<li><a href="#" onclick="close()">Update Account</a> </li>

		</ul>
	</nav>
	<div class="imagediv"> 
		<form action="showuser/balance" style="text-align: center;">
		    <input type="text" name="email" placeholder="Enter your email" style="text-align: center;"><br><br>
			<input type="password" name="pin" placeholder="Enter Pin" style="text-align: center;"><br><br>
			<input type="submit" name="" style="color: blue;">
		</form>
	</div>
	<script type="text/javascript">
	function close() {
		window.close();
	}
	</script>

</body>
</html>