<%@page import="bank_app.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	margin: 0px;
	padding: 0px;
	overflow: hidden;
}

nav {
	display: flex;
	background: lightsteelblue;
	margin: 0px;
}

nav ul {
	display: flex;
	list-style: none;
	margin: 0px;
	padding: 10px 0px;
}

nav ul li {
	padding: 0px 30px;
}

nav ul li a {
	text-decoration: underline;
	color: indianred;
	font-weight: bold;
	font-size: large;
}

a:hover {
	color: blue;
}

#firstitem {
	padding: 0px 30px 0px 360px;
}

img {
	height: 93vh;
	width: 100vw;
}

.imagediv {
	height: 90vh;
	width: 100vw;
	overflow: hidden; 
<%--background-image:	url("/bank_app/src/main/webapp/WEB-INF/backImg/adminback2.jpg"); --%>
	background-attachment : fixed;
	background-repeat: no-repeat;
	background-position: center;
}
</style>
<body>
	<nav>
		<ul>
			<li id="firstitem"><a href="viewbyid" onclick="close()">View
					By Id</a></li>
			<li><a href="viewbyemail" onclick="close()">View By Email.</a></li>
			<li><a href="showallusers" onclick="close()">View All</a></li>
		</ul>
	</nav>
	<% 
	User user=(User)request.getAttribute("user");
	
	%>
		
	<div class="imagediv">
		<div >
				<h3 class="message">User Credentials</h3>
			</div>

	<table border="1px solid black" cellspacing="0px" cellpadding="10px">
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

</body>
</html>