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
			border-bottom-radius: 10px;
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
		
		.imagediv{
		
			height: 90vh;
			width: 100vw;
			overflow: hidden;
			background-image: url("adminback2.jpg");
			display: flex;
			justify-content: center;
			align-items: center;
			background-attachment: fixed;
			background-repeat: no-repeat;
			background-position: center ;
		}
		form{
			text-align: center;
			padding: 20px;
			background: antiquewhite;
			border-radius: 20px;
		}
		
	</style>
</head>
<body>
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
			<li><a href="viewbyemail" onclick="close()">View By Email.</a></li>
			<li><a href="showallusers" onclick="close()">View All</a> </li>
			<li><a href="#">Add Account</a></li>
		</ul>
			</div>
		</div>
		<ul>
			<li id="secitem" class="other-li"><a href="#">About Us</a>
			</li>
		</ul>
	</nav>
	<div class="imagediv">
		<form action="viewuserbyid" onsubmit="close()">
		
			<h2 style="color: blue; text-decoration: underline;text-decoration-color: aliceblue;">User Credentials</h2>
			<%
			Object codeObj = request.getAttribute("code");
			if (codeObj != null) {
				int code = (Integer) codeObj;
				if (code == 0) {
			%>
			<h2 style="color: red; text-decoration: underline;">Id Not Found</h2>
			<%}} %>
			<input type="number" name="id" placeholder="Enter Id" style="text-align: center;" required="required"><br><br>
			<input type="submit" name="">
		</form>
	</div>
<script type="text/javascript">

function back() {
	history.back();
}
function go2() {
	history.go(-2);
}
	function close() {
		window.colse();
	}
	</script>
</body>
</html>