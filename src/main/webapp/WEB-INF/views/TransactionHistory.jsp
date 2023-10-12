<%@page import="java.time.LocalDateTime"%>
<%@page import="bank_app.dto.Transaction"%>
<%@page import="java.util.List"%>
<%@page import="bank_app.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored ="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>History</title>
<style>
body {
	margin: 0px;
	padding: 0px;
	overflow: hidden;
}

nav {
	display: flex;
	background: lightyellow;
	border: 2px solid goldenrod;
	border-radius: 10px;
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
	color: darkcyan;
	font-weight: bold;
	font-size: large;
}

a:hover {
	color: goldenrod;
}

#firstitem {
	padding: 0px 30px 0px 260px;
}

img {
	height: 93vh;
	width: 100vw;
}

.imagediv {
	height: 93vh;
	width: 100vw;
	overflow: hidden;
<%--	background-image: url("customerback2.jpg"); --%>
	display: flex;
	justify-content: center;
	align-items: center;
	background-attachment: fill;
	background-repeat: no-repeat;
	background-position: center;
}

table {
	border: 1px solid greenyellow;
	margin-top:0px;
	padding-top:0px
	background: whitesmoke;
	border-radius: 10px;
	text-align: center;
	padding: 10px;
}

table th {
	border: 1px solid lightsalmon;
	border-radius: 10px;
}
table th,td{
padding: 10px
}

table thead {
	margin: 0px;
	padding: 0px;
}

table tbody td {
	border-bottom: 1px solid goldenrod;
	border-radius: 10px;
}
</style>
</head>
<body>
	<nav>
		<ul>
			<li id="firstitem"><a href="userhome">Home</a></li>
			
			<li><a href="transfermoney" onclick="close()">Transfer Money</a> </li>
			<li><a href="checkbalance" onclick="close()">Account Balance</a> </li>
			<li><a href="viewuser" onclick="close()">My Account </a> </li>
			<li><a href="checkpinpage" onclick="close()">Update Account</a> </li>						
			
		</ul>
	</nav>

	<%
List<Transaction> transactions=(List<Transaction>) request.getAttribute("transactions");

%>
	<div class="imagediv">
	
	<%
	if(transactions!=null){
	%>
	
		<table>

			<thead>
				<tr>
				    <th>t.Id</th>
					<th>Date</th>
					<th>time</th>
					<th>transaction type</th>
					<th>to</th>
					<th>from</th>
					<th>Amount</th>
				</tr>
			</thead>

			<tbody>
				<% 
	    	for(Transaction transaction:transactions){
	    		
	    		//fetching date
	    		LocalDateTime dateTime=transaction.getDate();
	    		
	    		//setting date & time in req. format
	    		String date=dateTime.getDayOfMonth()+"-"+dateTime.getMonth()+"-"+dateTime.getYear();
	    		String time=dateTime.getHour()+":"+dateTime.getMinute()+":"+dateTime.getSecond();
	    		
	    	    //transaction type for further authentication  >>
	    		String tTyape=transaction.getType();
	    		User receiver=transaction.getReceiver();
	    		
	    		
	    	%>
				<tr>
				    <td><%= transaction.getId() %> </td>
					<td><%= date %></td>
					<td><%= time %></td>
					<td><%= tTyape %> </td>
					<% 
					if(receiver!=null){
					
	    			if(tTyape.equals("debited")){    			
	    			%>
	    			
					<td><%= receiver.getName()%></td>
					<td>-</td>
					<% } else {%>
					<td>-</td>
					<td><%= receiver.getName()%></td>

					<% } } else {%>
					<td>-</td>
					<td>-</td>
					<%} %>
					<td><%=transaction.getAmount() %> </td>
				</tr>
				<%} %>
				
			</tbody>
		</table>
		<% } else{ %>
		<h2 style="color=green ">No Transactions Done Yet... </h2>
		<%} %>
	</div>

</body>
</html>