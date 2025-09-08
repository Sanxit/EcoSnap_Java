<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="ecosnap.model.UserTable"%>
<%@ page import="ecosnap.model.BookTable"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard Panel</title>
<link rel="stylesheet" href="css/dashboard.css">
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
	rel="stylesheet">
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<style>
/* Table styling */
table {
	border-collapse: collapse;
	width: 100%;
	margin-top: 15px;
	background-color: #fff;
	color: #000;
}

th, td {
	border: 1px solid #000;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

/* Dark mode table styling */
body.dark table {
	background-color: #222;
	color: #fff;
}

body.dark table th {
	background-color: #444;
	color: #fff;
	border-color: #666;
}

body.dark table td {
	border-color: #666;
}

/* Hide sections by default */
#userDataSection, #bookingSection {
	display: none;
}

/* Dashboard boxes */
.boxes {
	display: flex;
	gap: 20px;
	margin-bottom: 40px;
}

.box {
	flex: 1;
	background: #fff;
	padding: 20px;
	border-radius: 10px;
	text-align: center;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

body.dark .box {
	background: #333;
	color: #fff;
}

.box i {
	font-size: 28px;
	margin-bottom: 10px;
	display: block;
}

.box .text {
	font-weight: bold;
	margin-bottom: 5px;
}

.box .number {
	font-size: 22px;
}

/* Section title */
.title {
	display: flex;
	align-items: center;
	font-size: 24px;
	margin-bottom: 20px;
}

.title i {
	margin-right: 10px;
}

/* Recent Activity - plain list styling */
.activity {
	margin-top: 30px;
	background: none; /* remove box background */
	box-shadow: none; /* remove shadow */
	padding: 0; /* remove extra padding */
}

body.dark .activity {
	color: #fff;
}

.activity .title {
	display: flex;
	align-items: center;
	font-size: 22px;
	margin-bottom: 15px;
}

.activity .title i {
	margin-right: 10px;
}

.activity .activity-data {
	display: flex;
	gap: 40px;
}

.activity .data-title {
	font-weight: bold;
	display: block;
	margin-bottom: 10px;
}

.activity .data-list {
	display: block;
	margin-bottom: 5px;
}

/* Optional: make Recent Activity scrollable if long */
.activity .activity-data {
	max-height: auto;
	overflow-y: auto;
}

/* Dark mode for scrollable content */
body.dark .activity .data-list {
	color: #fff;
}
</style>
</head>
<body>
	<%
	List<UserTable> users = (List<UserTable>) session.getAttribute("usertable");
	List<BookTable> bookings = (List<BookTable>) session.getAttribute("bookingtable");
	%>

	<!-- Sidebar navigation -->
	<nav>
		<div class="logo-name">
			<div class="logo-image">
				<img src="img/logo.png" alt="">
			</div>
			<a href="index.jsp" class="logo_name"><h2>
					<span>Eco</span> Snap
				</h2></a>
		</div>

		<div class="menu-items">
			<ul class="nav-links">
				<li><a href="#" id="dashboardLink"><i
						class="ri-home-3-line"></i> <span class="link-name">Dashboard</span></a></li>
				<li><a href="#" id="userDataLink"><i
						class="ri-user-add-line"></i> <span class="link-name">User
							Data</span></a></li>
				<li><a href="#" id="bookingLink"><i
						class="ri-bookmark-3-line"></i> <span class="link-name">Bookings</span></a></li>
			</ul>

			<ul class="logout-mode">
				<li><a href="logout"><i class="ri-logout-box-line"></i> <span
						class="link-name">Logout</span></a></li>
				<li class="mode"><a href="#"><i class="ri-moon-line"></i><span
						class="link-name">Dark Mode</span></a>
					<div class="mode-toggle">
						<span class="switch"></span>
					</div></li>
			</ul>
		</div>
	</nav>

	<section class="dashboard">
		<div class="top">
			<i class="ri-menu-line sidebar-toggle"></i>
			<div class="search-box">
				<i class="ri-search-line"></i> <input type="text"
					placeholder="Search here..." />
			</div>
		</div>

		<div class="dash-content">
			<!-- Dashboard Section -->
			<div id="dashboardSection" class="overview">
				<div class="title">
					<i class="ri-dashboard-line"></i> <span class="text">Dashboard</span>
				</div>

				<!-- Dashboard boxes -->
				<div class="boxes">
					<div class="box box1">
						<i class="ri-user-line"></i> <span class="text">Users</span> <span
							class="number"><%=(users != null) ? users.size() : 0%></span>
					</div>
					<div class="box box2">
						<i class="ri-user-add-line"></i> <span class="text">Signup</span>
						<span class="number"><%=(users != null) ? users.size() : 0%></span>
					</div>
					<div class="box box3">
						<i class="ri-bookmark-3-line"></i> <span class="text">Booking</span>
						<span class="number"><%=(bookings != null) ? bookings.size() : 0%></span>
					</div>
				</div>

				<!-- Recent Activity (no box wrapper) -->
				<div class="activity">
					<div class="title">
						<i class="ri-history-line"></i> <span class="text">Recent
							Activity</span>
					</div>

					<div class="activity-data">
						<div class="data email">
							<span class="data-title">Email</span>
							<%
							if (users != null && !users.isEmpty()) {
								for (UserTable ut : users) {
							%>
							<span class="data-list"><%=ut.getEmail()%></span>
							<%
							}
							} else {
							%>
							<span class="data-list">No users found</span>
							<%
							}
							%>
						</div>

						<div class="data status">
							<span class="data-title">Status</span>
							<%
							if (users != null && !users.isEmpty()) {
								for (UserTable ut : users) {
									boolean hasBooking = false;
									if (bookings != null && !bookings.isEmpty()) {
								for (BookTable bt : bookings) {
									if (bt.getEmail().equalsIgnoreCase(ut.getEmail())) {
										hasBooking = true;
										break;
									}
								}
									}
							%>
							<span class="data-list"><%=hasBooking ? "Booked" : "Passive"%></span>
							<%
							}
							} else {
							%>
							<span class="data-list">-</span>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</div>
			<!-- End of dashboardSection -->




			<!-- User Data Section -->
			<div id="userDataSection">
				<div class="title">
					<i class="ri-user-2-line"></i> <span class="text">User Data</span>
				</div>
				<table>
					<tr>
						<th>Id</th>
						<th>Email</th>
						<th>Password</th>
					</tr>
					<%
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
			</div>

			<!-- Booking Section -->
			<div id="bookingSection">
				<div class="title">
					<i class="ri-book-line"></i> <span class="text">Bookings</span>
				</div>
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
						<td colspan="9" style="text-align: center;">No bookings
							found.</td>
					</tr>
					<%
					}
					%>
				</table>
			</div>
		</div>
	</section>

	<script>
// Dark mode toggle
const body = document.querySelector("body"),
      modeToggle = body.querySelector(".mode-toggle"),
      sidebar = body.querySelector("nav"),
      sidebarToggle = body.querySelector(".sidebar-toggle");

if (localStorage.getItem("mode") === "dark") body.classList.add("dark");

modeToggle.addEventListener("click", () => {
    body.classList.toggle("dark");
    localStorage.setItem("mode", body.classList.contains("dark") ? "dark" : "light");
});

// Sidebar toggle
if (localStorage.getItem("status") === "close") sidebar.classList.add("close");

sidebarToggle.addEventListener("click", () => {
    sidebar.classList.toggle("close");
    localStorage.setItem("status", sidebar.classList.contains("close") ? "close" : "open");
});

// Section switching
const dashboardLink = document.getElementById("dashboardLink"),
      userDataLink = document.getElementById("userDataLink"),
      bookingLink = document.getElementById("bookingLink"),
      dashboardSection = document.getElementById("dashboardSection"),
      userDataSection = document.getElementById("userDataSection"),
      bookingSection = document.getElementById("bookingSection");

// Show dashboard by default
dashboardSection.style.display = "block";

dashboardLink.addEventListener("click", () => {
    dashboardSection.style.display = "block";
    userDataSection.style.display = "none";
    bookingSection.style.display = "none";
});

userDataLink.addEventListener("click", () => {
    dashboardSection.style.display = "none";
    userDataSection.style.display = "block";
    bookingSection.style.display = "none";
});

bookingLink.addEventListener("click", () => {
    dashboardSection.style.display = "none";
    userDataSection.style.display = "none";
    bookingSection.style.display = "block";
});
</script>
</body>
</html>
