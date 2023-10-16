<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>About</title>
	<style type="text/css">
		body{
			margin: 0px;
			padding: 0px;
			overflow: hidden;
			
		}
		nav{
			display: flex;
			align-items: center;
			margin: 0px;
			background: #d9ead3;
			border-radius: 10px;
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
		ul li a{
			text-decoration: underline;
			color: deepskyblue;
			font-weight: bold;
			font-size: large;
			color: #fba9d5;


		}
		a:hover{
			color: blue;
		}
		#firstitem{
			padding-left: 250px;
		}
		.main-div{
			height: 73vh;
			display: flex;
			justify-content: center;
			align-items: center;
			flex-direction: column;
		}
		.foot-div{
			float: right;
			padding-right: 30px;
			display: flex;
			align-items: center;
			flex-direction: column;
		}
		
		.foot-div h2{
			padding-top: 10px;
			margin-top: 0px;
		}
		.foot-div h3{
			padding-bottom: 0px;
			margin-bottom: 0px;
		}
		#heading{
			color: #1ca168;
			text-shadow: 2px 15px 2px pink;
		}
		#quote{
			color: #431163;
		}
		#footline{
			color: #CDEC92;
		}
		#name{
			color: #d0b783;
			font-family:"Comic Sans MS", cursive, sans-serif;
			text-decoration: underline;
			text-decoration-style: dashed;
			text-decoration-color: gainsboro;

		}
	</style>
</head>
<body>
	<nav>
		<ul>
			<li id="firstitem"><a href="userlogin">Sign In</a> </li>
			<li><a href="usersignup">Sign Up</a> </li>
			<li><a href="about">About</a> </li>
		</ul>
	</nav>
	<div class="main-div">
		<h1 id="heading">Welcome to TransXcel Bank ....</h1>
		<h2 id="quote">Now bank is in your pocket &nbsp&nbsp!!!</h2>	
	</div>
	<div class="foot-div">
		<h3 id="footline">Designed & Developed by </h3>
	    <h2 id="name">Ganesh S. Pawar</h2>
	</div>

</body>
</html>