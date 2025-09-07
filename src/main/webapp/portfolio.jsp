<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Eco Snap Photography</title>
<link rel="stylesheet" href="css/style.css" />
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
	rel="stylesheet" />
<link rel="shortcut icon" href="./assets/img/favicon.ico"
	type="image/x-icon" />
</head>
<body>
	<header class="header">
		<div class="eco-container">
			<nav class="navbar">
				<div class="navpart-1">
					<h2>
						<span>Eco</span>Snap
					</h2>
				</div>
				<div class="navpart-2">
					<ul class="navitems">
						<li><a href="index.jsp" class="act">Home</a></li>
						<li><a href="about" class="abt">About</a></li>
						<li><a href="service" class="ser">Service</a></li>
						<li><a href="portfolio" class="active">Portfolio</a></li>
						<li><a href="signup" class="user"> <svg
									xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
									width="24" height="24">
      <path fill="currentColor"
										d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z" />
    </svg>
						</a></li>

					</ul>
					<a class="hire-btn" href="signup">Booking</a>
					<div id="mySidenav" class="sidenav">
						<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
						<a href="" onclick="closeNav()">Home</a> <a href="about"
							onclick="closeNav()">About</a> <a href="service"
							onclick="closeNav()">Service</a> <a href="portfolio"
							onclick="closeNav()">Portfolio</a> <a href="signup"
							onclick="closeNav()">Booking</a> <a href="logout"
							onclick="closeNav()">Logout</a>
					</div>
					<div id="main">
						<span class="cross" onclick="openNav()">&#9776;</span>
					</div>
				</div>
			</nav>
			<p style="color: red">${logout}</p>
		</div>
	</header>
	<section class="portfolio-section">
		<div class="eco-container">
			<div class="portfolio-layout">
				<!-- Column 1 -->
				<div class="column">
					<div class="portfolio-item">
						<img src="img/mountain.jpg" alt="Image 1" />
						<div class="category-label">Travel</div>
					</div>
					<div class="portfolio-item">
						<img src="img/nepali.jpg" alt="Image 2" />
						<div class="category-label">Portfolio</div>
					</div>
				</div>

				<!-- Column 2 -->
				<div class="column tall">
					<div class="portfolio-item">
						<img src="img/weeding.jpg" alt="Image 3" />
						<div class="category-label">Wedding</div>
					</div>
				</div>

				<!-- Column 3 -->
				<div class="column">
					<div class="portfolio-item">
						<img src="img/family.jpg" alt="Image 4" />
						<div class="category-label">Family</div>
					</div>
					<div class="portfolio-item">
						<img src="img/mountain.jpg" alt="Image 5" />
						<div class="category-label">Travel</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Help Section -->
	<div class="help-section">

		<img src="img/lakee.jpg" alt="Lake" class="help-img" />

		<!-- Overlay -->
		<div class="help-overlay">
			<div class="help-content">
				<h2>
					NEED HELP WITH<br />OUR PHOTOGRAPHY?
				</h2>
				<p>
					CONTACT US · <a href="mailto:sanxitsapkota@gmail.com">SANXITSAPKOTA@GMAIL.COM</a>
				</p>
				<p>
					CALL US 24/7 · <a href="tel:+9779863021990">+977 9863021990</a>
				</p>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="site-footer">
		<div class="eco-container footer-grid">
			<!-- Quick Links -->
			<div class="footer-col">
				<h4>QUICK LINKS</h4>
				<ul>
					<li><a href="#">ABOUT US</a></li>
					<li><a href="#">SERVICE</a></li>
					<li><a href="#">PORTFOLIO</a></li>
					<li><a href="#">TESTIMONIALS</a></li>
				</ul>
			</div>

			<!-- Contact Info -->
			<div class="footer-col">
				<h4>CONTACT US</h4>
				<ul>
					<li><a href="mailto:sanxitsapkota@gmail.com">SANXITSAPKOTA@GMAIL.COM</a></li>
					<li><a href="tel:+9779863021990">+977 9863021990</a></li>
				</ul>
			</div>

			<!-- Hire Us -->
			<div class="footer-col">
				<h4>HIRE US TODAY !</h4>
				<form class="hire-form" action="book" method="post">
					<input type="email" name="email"
						placeholder="Enter email address..." required /> <a href="book"
						class="book-btn">Book</a>
				</form>

				<ul class="social-icons">
					<li><a href="#"><i class="ri-facebook-circle-fill"></i></a></li>
					<li><a href="#"><i class="ri-instagram-line"></i></a></li>
					<li><a href="#"><i class="ri-linkedin-box-fill"></i></a></li>
				</ul>
			</div>
		</div>
	</footer>
	<script src="js/script.js"></script>
</body>
</html>
