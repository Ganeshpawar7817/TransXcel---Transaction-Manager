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
		.imagediv{
			height: 90vh;
			width: 100vw;
			overflow: hidden;
			background-image: url("adminback2.jpg");
			background-attachment: fixed;
			background-repeat: no-repeat;
			background-position: center ;
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
		#customer-section-list ul #firstitem{
		margin-left: 20px
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
		
		
		
		.about-section{
			height: inherit;
			border: 2px solid mediumvioletred;
			border-radius: 5px;
			margin-left: 100px;
		}
		.about-section-list ul li a{
		color: #ffcc5c;
		}
		.about-section h3{
			margin: 0px;
			padding: 5px;
			color: #4fb09f;
		}
		.about-section-head{
			text-align: center;
		}
		#about-section-head{
			border-bottom: 2px solid pink;
			border-radius: 20px;
			text-align: center;
			margin-bottom: 0px;
			padding-bottom: 0px;
		}
		#about-section-list ul{
			margin-top: 0px;
			padding-top: 10px;
		}
	</style>
</head>
<body>
<%
Object codeObj=request.getAttribute("code");
if(codeObj!=null){
	int code=(Integer)codeObj;
	if(code==1111){
%>
<script type="text/javascript">
alert("About Info Updated Successfully !!");
</script>
<%}else if(code==2222){ %>
<script type="text/javascript">
alert("Service Updated Successfully !!");
</script>
<%}else if(code==3333){ %>
<script type="text/javascript">
alert("Service added Successfully !!");
</script>
<%}else if(code==4444) {%>
<script type="text/javascript">
alert("Service Deleted Successfully !!");
</script>
<%}} %>
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
			<li id="firstitem"><a href="viewbyid" onclick="close()">View By Id</a></li>
			<li><a href="viewbyemail" onclick="close()">View By Email.</a></li>
			<li><a href="showallusers" onclick="close()">View All</a> </li>
			
		</ul>
			</div>
		</div>
		<div class="about-section">
		<div id="about-section-head" >
		       <h3>About Section</h3>		
		</div>
		<div class="about-section-list">
		<ul>
			<li id="secitem" class="other-li"><a href="updateaboutform">Update About info</a>
			</li>
			<li id="secitem" class="other-li"><a href="addserviceform">Add Service</a>
			</li><li id="secitem" class="other-li"><a href="updatesrvicesform">Update Services</a>
			</li>
		</ul>
		</div>
		
		</div>
	</nav>
	<div class="imagediv"></div>
<script type="text/javascript">
	function close() {
		window.colse();
	}
	</script>
</body>
</html>