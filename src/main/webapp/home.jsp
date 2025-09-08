<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="ecosnap.model.UserTable"%>
<%@ page import="ecosnap.model.BookTable"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - Home</title>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 1px solid #000;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

p.message {
	text-align: center;
	margin: 20px 0;
	font-weight: bold;
}

p.success {
	color: green;
}

p.error {
	color: red;
}

p.info {
	color: blue;
}
</style>
</head>
<body>

	<h1>Welcome to Admin Dashboard</h1>
	<hr>

	<!-- Users Table -->
	<h2>Users</h2>
	<table>
		<tr>
			<th>Id</th>
			<th>Email</th>
			<th>Password</th>
		</tr>
		<%
		List<UserTable> users = (List<UserTable>) request.getAttribute("usertable");
		if (users != null && !users.isEmpty()) {
			for (UserTable ut : users) {
		%>
		<tr>
			<td><%=ut.getId()%></td>
			<td><%=ut.getEmail()%></td>
			<td><%=ut.getPassword()%></td>
		</tr>
		<%
		}
		} else {
		%>
		<tr>
			<td colspan="3" style="text-align: center;">No users found.</td>
		</tr>
		<%
		}
		%>
	</table>

	<hr>

	<!-- Bookings Table -->
	<h2>Bookings</h2>
	<table>
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
		List<BookTable> bookings = (List<BookTable>) request.getAttribute("bookingtable");
		if (bookings != null && !bookings.isEmpty()) {
			for (BookTable bt : bookings) {
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
		} else {
		%>
		<tr>
			<td colspan="9" style="text-align: center;">No bookings found.</td>
		</tr>
		<%
		}
		%>
	</table>

</body>
</html>
