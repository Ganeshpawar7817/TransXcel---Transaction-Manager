<%@page import="bank_app.dto.BankService"%>
<%@page import="java.util.List"%>
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
			height: 80vh;
			width: 100vw;
			overflow: hidden;
		<%--	background-image: url("adminback2.jpg"); --%>
			background-attachment: fixed;
			background-repeat: no-repeat;
			background-position: center ;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
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
		table{
			border: 2px solid mediumvioletred;
			background: lightcyan;
			padding: 20px;
			row-gap: 10px;
			column-gap: 10px;
		}
		td{
			border: 1px solid pink;
			margin: 10px 10px;
		}
		.id{
			width: 30px;
		}
		input{
			margin-right: 15px;			
			margin-bottom: 10px;
			text-align: center;
		}

	</style>
</head>
<body>
<% 
List<BankService> services=(List<BankService>)request.getAttribute("services"); 
Object codeObj=request.getAttribute("code");
if(codeObj!=null){
int code=(Integer)codeObj;	
if(code==111){
%>
<script type="text/javascript">
      document.alert(" service updated successfully !! "");
</script>

<%
}else if(code==222){
%>
<script type="text/javascript">
       document.alert("service deleted successfully !!")
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
			<li><a href="viewbyid">View By Id</a> </li>

			<li><a href="viewbyemail">View By AccNo.</a></li>
			<li><a href="showallusers">View All</a></li>
		
		</ul>
			</div>
		</div>
		<ul>
			<li id="secitem" class="other-li"><a href="Home.html">About Us</a>
			</li>
		</ul>
	</nav>
	<div class="imagediv">
		<h1>Update Schemes</h1>
		<table>
			<tbody>
			<%
			for(BankService service:services){ 
			%>
				<tr>
					<form action="updateservice" method="post">
						<td>
							<input type="number" name="id" value="<%= service.getId() %>" class="id" readonly="readonly">
						</td>
						<td>
							<input type="text" name="service" value="<%=service.getService() %>">
						</td>
						<td>
							<input type="submit" name="" value="Update" >
						</td>
				<%--		<td>
							<a href="deleteservice?id=<%=service.getId() %>">
								<button type="button">Delete</button>
							</a>
						</td>  --%>
					</form>
				</tr>
				<%} %>
			</tbody>
		</table>

	</div>
	<h1>iside </h1>
<h1><%=codeObj %> </h1>
</body>
</html>