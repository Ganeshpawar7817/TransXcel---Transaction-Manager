<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>User Sign Up</title>
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
			height: 100vh;
			width: 100vw;
			overflow: hidden;
		<%--	background-image: url("../backImg/customerback2.jpg") ; --%>
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
			padding: 30px;
			margin-top:60px;
			border: 1px solid black;
			text-align: center;
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
	
	<div class="imagediv"> 
		<div class="formdiv">
			<form action="saveuser" method="post">
				<h2>User SignUp</h2>
				<%Object codeObj=request.getAttribute("code");
				if(codeObj!=null&&((Integer)codeObj==0||(Integer)codeObj==10||(Integer)codeObj==20)){
				%>
				<h2 style="color: red; text-decoration: underline;"><%= (String) request.getAttribute("message") %> </h2>
				<%} %>
				Name : <br><input type="text" name="name" placeholder="enter name" required="required"><br><br>
				Age : <br><input type="number" name="age" placeholder="enter age" required="required"><br><br>Email : <br>
				<input type="text" name="email" placeholder="enter email" required="required"><br><br>
				pin : <br><input type="number" name="pin" placeholder="enter pin" required="required"><br><br>
				<br><input type="number" name="pin2" placeholder="re-enter pin" required="required"><br><br>
				Address : <br><textarea rows="3" placeholder="enter address here" name="address" required="required"></textarea>
				<br><br>
				<input type="submit" name=""> <br><br>
				<a href="userlogin">Already Have an Account ??</a>

			</form>
		</div>
	</div>

</body>
</html>