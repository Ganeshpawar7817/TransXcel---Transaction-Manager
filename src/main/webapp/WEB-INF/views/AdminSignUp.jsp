<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Admin Sign Up</title>
	<style>
	body{
			margin: 0px;
			padding: 0px;
			overflow: hidden;
			
		}
		
		img{
			height: 93vh;
			width: 100vw;
		}
		.imagediv{
			height: 90vh;
			width: 100vw;
			overflow: hidden;
			<%-- background-image: url("C:\Users\hp\Desktop\My Projects\bank_app\src\main\webapp\WEB-INF\backImg\adminback2.jpg"); --%>
			background-attachment: fixed;
			background-repeat: no-repeat;
			background-position: center ;
		}
		select{
			font-weight: bold;
			font-size: medium;
			color: indianred;
			background: inherit;
			border: none;
			text-decoration: underline;
		}
		select:hover{
			color: blue;
		}
		.formdiv{
			display: flex;
			justify-content: center;
			align-items: center;
			height: 70vh;
		}
		.formdiv form{
			background: whitesmoke;
			padding: 50px;
			text-align: center;
			border: 1px solid black;
		}
		.formdiv form input{
			text-align: center;
		}
		.formdiv form h2{
			margin-top: 0px;
		}
		from a{
		color: orange;
		}
	</style>
</head>
<body>
	
	<div class="imagediv">
		<div class="formdiv">
			<form action="saveadmin" method="post">
			    <% 
			    Object atrr=request.getAttribute("id");
			    if(atrr!=null){
			    %>
			    <h3 style="color: red; text-decoration: underline;"><%=request.getAttribute("message") %> </h3>
			    <% }%>
				<h2 style="text-decoration: underline; color: hotpink;">Admin SignUp</h2>			
				<input type="text" name="email" placeholder="Enter email" required="required"><br><br>
				<input type="password" name="passcode" placeholder="enter passcode" required="required"><br><br>
				<input type="password" name="passcode2" placeholder="confirm passcode" required="required"><br><br>
				<input type="submit" name="" value="Sign Up"><br><br>
				<a href="adminlogin">Already Have an account ?</a>
			</form>
		</div>
	</div>

</body>
</html>