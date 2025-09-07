<%@ page import="ecosnap.model.UserTable"%>
<%@ page import="ecosnap.model.BookTable"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
</head>
<body>

	<h1>Welcome to Home Page</h1>
	<hr>

	<h2>Users</h2>
	<%
	List<UserTable> userList = (List<UserTable>) request.getAttribute("userData");
	%>
	<table border="2" width="100%">
		<tr>
			<th>Id</th>
			<th>Username</th>
			<th>Password</th>
		</tr>
		<%
		for (UserTable ut : userList) {
		%>
		<tr>
			<td><%=ut.getId()%></td>
			<td><%=ut.getUsername()%></td>
			<td><%=ut.getPassword()%></td>
		</tr>
		<%
		}
		%>
	</table>

	<hr>
	<h2>Bookings</h2>
	<%
	List<BookTable> bookingList = (List<BookTable>) request.getAttribute("bookingData");
	%>
	<table border="2" width="100%">
		<tr>
			<th>Id</th>
			<th>Full Name</th>
			<th>Email</th>
			<th>City</th>
			<th>Shoot Type</th>
			<th>Preferred Date</th>
			<th>Alternate Date</th>
			<th>Phone</th>
			<th>WhatsApp</th>
		</tr>
		<%
		for (BookTable bt : bookingList) {
		%>
		<tr>
			<td><%=bt.getId()%></td>
			<td><%=bt.getFullname()%></td>
			<td><%=bt.getEmail()%></td>
			<td><%=bt.getCity()%></td>
			<td><%=bt.getShootType()%></td>
			<td><%=bt.getPreferredDate()%></td>
			<td><%=bt.getAlternateDate()%></td>
			<td><%=bt.getPhone()%></td>
			<td><%=bt.getWhatsapp()%></td>
		</tr>
		<%
		}
		%>
	</table>

</body>
</html>
