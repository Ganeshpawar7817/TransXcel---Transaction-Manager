<%@page import="bank_app.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Show User</title>
<style>
	body{
			margin: 0px;
			padding: 0px;
			overflow: hidden;
			
		}
		nav{
			display: flex;
			background: orange;
			margin: 0px;
			
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
			color: black;
			font-weight: bold;
			font-size: large;

		}
		a:hover{
			color: blue;
		}
		#firstitem{
			padding: 0px 30px 0px 200px;
		}
		img{
			height: 93vh;
			width: 100vw;
		}
		.imagediv{
			height: 90vh;
			width: 100vw;
			overflow: hidden;
			background-image: url("adminback2.jpg");
			background-attachment: fixed;
			background-repeat: no-repeat;
			background-position: center ;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
		}
		.message{
			font-size:larger;
			padding: 5px;
			text-shadow: 1px 5px 3px hotpink;
		}
		
		table{
			background: whitesmoke;
			text-align: center;
			border-bottom: 1px solid lightgreen;
			border-radius: 10px;
			color: green;
		}
		table th,td{
		border-bottom: 1px solid lightgreen;
		border-radius: 20px;
		}
		
	</style>
</head>
<body>
	<% 
	User user=(User)request.getAttribute("user");
	String from=(String)request.getAttribute("from");
	
	%>
<script type="text/javascript">
console.log("show user page <<");
</script>
	<nav>
		<ul>
			<%if(from.equals("admin")){ %>
			<li id="firstitem"><a href="adminhome">Home</a> </li>
			<%}else{ %>
			<li id="firstitem"><a href="userhome">Home</a> </li>
			<%} %>
			<li><a href="#" onclick="back()">Back</a> </li>
		</ul>
	</nav>
 

		
	<div class="imagediv">
		<div >
				<h3 class="message">User Credentials</h3>
			</div>

	<table  cellspacing="0px" cellpadding="10px">
			<tbody>

				<tr>
					<th>Id</th>
				
				    <td>${user.id } </td>
				   
				</tr>
				<tr>
					<th>Name</th>
				    <td> ${user.name }</td>
				</tr>
				<tr>
					<th>Age</th>
				    <td>${user.age }</td>
				</tr>
				<tr>
					<th>Pin</th>
					
				    <td>****</td>
				  
				</tr>
				<tr>
					<th>Address</th>
				    <td>${user.address }</td>
				</tr>
			</tbody>
		</table> 
		
	</div>
	<script type="text/javascript">
	
	function back() {
		window.history.back();
	}
	function go2() {
		window.history.go(-2);
	}
	function close() {
		window.colse();
	}

	</script>
	
	

</body>
</html>