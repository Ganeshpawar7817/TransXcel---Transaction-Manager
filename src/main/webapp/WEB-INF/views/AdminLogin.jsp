<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Admin Login</title>
	<style type="text/css">
		body{
			margin: 0px;
			padding: 0px;
			overflow: hidden;
			
		}
		
		.imagediv{
			height: 90vh;
			width: 100vw;
			overflow: hidden;
			<%-- background-image: url("/bank_app/src/main/webapp/WEB-INF/backImg/adminback2.jpg"); --%>
			background-attachment: fixed;
			background-repeat: no-repeat;
			background-position: center ;
		}
		
		.admin{
			display: flex;
			justify-content: center;
			align-items: center;
			height: 90vh;
		}
		.admin form{
			padding: 30px;
			background: aqua;
			border: 1px solid black;
			border-radius: 10px;
			text-align: center;
		}
		 form h1{
		color: maroon;
		}
		.admin form input{
			border-radius: 3px;
			border: 1px solid black;
			text-align: center;
		}
		#sbt{
			background: lightsteelblue;
		}
		.input form a:hover{
			color: indianred;
		}
		form a{
		color: red;
		font-weight: bolder;
		}
		form a:hover{
		color: blue;
		}



		
	
	</style>
</head>
<body>
	<nav>
		
	</nav>
	<div class="imagediv">
		<div class="admin">
		<form action="signincheck" method="post">
		    <%Object idObj=request.getAttribute("id");
		      Object codeObj=request.getAttribute("code");
		      Object messageObj=request.getAttribute("message");
		    if(codeObj!=null &&(Integer)codeObj!=111){ %>
		    <h2 style="color: green; text-decoration:underline " ><%= request.getAttribute("message") %></h2>
		    <%} else if(codeObj!=null&&((Integer)codeObj)==111){%>
		    <h2 style="color: green; text-decoration: underline;"><%=(String) messageObj %> </h2>
		    <script type="text/javascript">
		         alert("Remember your id is "+ <%= idObj %>);
		         alert("Don't share it with anyone !!");
		    </script>
		    <%} %>		    
			<h1 align="center">Admin</h1>
			<input type="email" name="email" placeholder="email" required="required"><br>
			<br> <input type="password" name="password"
				placeholder="password" required="required"><br>
			<br> <input type="submit" name="" id="sbt"><br>
			<br>
			<a href="adminsignup">Don't have an account?</a>
		</form>
		

	</div>
	</div>
</body>
</html>