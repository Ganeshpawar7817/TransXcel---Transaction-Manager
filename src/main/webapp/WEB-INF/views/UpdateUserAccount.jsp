<%@page import="bank_app.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Update Account</title>
		<style>
body{
			margin: 0px;
			padding: 0px;
			overflow: hidden;
		}
		nav{
			display: flex;
			background: silver;
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
			color: aqua;
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
		.formdiv{
			display: flex;
			justify-content: center;
			align-items: center;
			height: 90vh;
		}
		.formdiv form{
			background: lightgoldenrodyellow;
			padding: 50px;
			text-align: center;
			border: 1px solid black;
			border-radius: 10px;
			
		}
		.formdiv form input{
			text-align: center;
		}
		.formdiv form h2{
			margin-top: 0px;
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
		<div class="formdiv">
		<% 
		User user=(User)request.getAttribute("user");
		int id=user.getId();
		String name=user.getName();
		String email=user.getEmail();
		int age=user.getAge();
		String pin=user.getPin();
		String address=user.getAddress();
		%>
			<form action="updatemyaccount" method="post" onsubmit="close()">
				<h2 style="color: fuchsia; text-shadow: 2px 16px 2px olive; margin-top: 0px;padding-top: 0px">User SignUp</h2>
				id : <br><input type="number" name="id" readonly placeholder="Create your id" value="<%= id %>"><br><br>
				Name : <br><input type="text" name="name" placeholder="enter name" value="<%= name %>"><br><br>
				Age : <br><input type="number" name="age" placeholder="enter age" value="<%= age %>"><br><br>
				Email : <br><input type="text" name="email" placeholder="enter email" value="<%= email %>"><br><br>
				pin : <br><input type="text" name="pin" placeholder="enter pin" value="<%=pin %>"><br><br>
				Address : <br><textarea rows="3" placeholder="enter address here" name="address"><%= address %></textarea>
				<br><br>
				<input type="submit" name="">

			</form>
		</div>
	</div>
	<script type="text/javascript">
	function close() {
		window.close();
	}
	</script>

</body>
</html>