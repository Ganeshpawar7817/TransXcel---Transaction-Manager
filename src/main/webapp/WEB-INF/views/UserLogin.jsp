<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>User Login</title>
	<style>
	body{
			margin: 0px;
			padding: 0px;
			overflow: hidden;
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
	text-decoration: underline;
	text-decoration-style: dotted;	
	text-decoration-color: gray;
	
}
form{
	background: fuchsia;
	padding: 50px;
	border: 1px solid black;
	border-radius: 30px;
	text-align: center
}
form input{
	border-radius: 5px;
}
form a{
color: lime;
font-weight: 900;
font-size: medium;
}
form a:hover{
	color: blue;
	
}

</style>
</head>
<body>
	
	<div class="imagediv"> 
		<div class="md">
		<form action="userlogincheck" method="post">
		<h1>Login</h1>
		<% Object code=request.getAttribute("code");
		if(code!=null&&(Integer)code==111){
		%>
		<h2 style="color: green; text-decoration: underline;"><%= (String)request.getAttribute("message") %></h2>
		<%} else if(code!=null&&(Integer)code==0){%>
		
		<h2 style="color: maroon; text-decoration: underline;"><%=(String)request.getAttribute("message") %></h2>
		<%} %>

			<input type="string" name="email" placeholder="email" required="required"><br>
			<br> <input type="text" name="pin" placeholder="pin" required="required"><br>
			<br> <input type="submit" class="button">
			<br><br> <a href="usersignup">Doesn't have account ?</a>
		</form>
		
	</div>
	</div>
</body>
</html>