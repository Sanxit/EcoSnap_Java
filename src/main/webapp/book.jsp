<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Eco Snap Photography</title>
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/book.css" />
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
	rel="stylesheet" />
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
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
						<li><a href="index.jsp" class="index.jsp">Home</a></li>
						<li><a href="about" class="abt">About</a></li>
						<li><a href="service" class="ser">Service</a></li>
						<li><a href="portfolio" class="por">Portfolio</a></li>
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
	<section class="booking">
		<div class="eco-container">
			<h2 class="section-title">MAKE A BOOKING</h2>
			<div class="booking-steps">
				<div class="booking-step">
					<span class="step-number">1</span> <img src="img/1.png"
						alt="Person filling out a form" />
					<p>
						fill in the form below <br /> and let us know a few details
					</p>
				</div>

				<div class="booking-step">
					<span class="step-number">2</span> <img src="img/2.jpg"
						alt="Person filling out a form" />
					<p>
						we will follow up witin <br /> 24 hours with more information
					</p>
				</div>

				<div class="booking-step">
					<span class="step-number">3</span> <img src="img/3.jpg"
						alt="Person filling out a form" />
					<p>
						once we agree on details<br /> we will connect you with the <br />
						best match photographer
					</p>
				</div>
			</div>
		</div>
	</section>
	<%
	if (request.getAttribute("booksuccess") != null) {
	%>
	<p style="color: green; font-weight: bold;">Booking successful!</p>
	<%
	}
	%>

	<%
	if (request.getAttribute("bookfail") != null) {
	%>
	<p style="color: red; font-weight: bold;">Booking failed. Please
		try again.</p>
	<%
	}
	%>

	<div class="eco-container">
		<div class="service-pad">
			<article class="service-card">
				<div class="service-info">
					<h3 class="service-title">EcoSnap Photography</h3>
					<div class="service-meta">
						<span>Experience: <strong>3 years</strong></span> | <span>Type:
							<strong>individual</strong>
						</span> | <span>Delivery Time: <strong>2 weeks</strong></span>
					</div>
					<div class="service-tags">
						<span class="tag">Wedding Ceremony</span>
					</div>
					<p class="service-location">Service Location: Kathmandu</p>
					<button class="details-btn">Details</button>
				</div>

				<div class="service-image">
					<img src="img/weeding.jpg" alt="wedding" />
					<div class="price-badge">
						<span>Wedding Ceremony</span> <strong>Rs. 35000</strong> <em>(per
							day)</em>
					</div>
					<div class="enquiry-tag">ENQUIRE</div>
				</div>
			</article>
		</div>
	</div>

	<section class="form-tab-section">
		<div class="eco-container">
			<div class="form-pad">
				<div class="form-tabs">
					<button class="tab-title active" onclick="switchTab('photoshoot')">
						01. Photoshoot details</button>
					<button class="tab-title" onclick="switchTab('personal')">
						02. Personal details</button>
				</div>
				<div class="form-wrapper">
					<form id="bookingForm" action="book" method="post">
						<!-- Step 1: Photoshoot Details -->
						<div class="form-page active" id="photoshootForm">
							<label for="city">Confirm the city<span class="required">*</span></label>
							<input type="text" name="city" id="city" required /> <label
								for="type">Describe the type of photo shoot you'd like
								to book<span class="required">*</span>
							</label>
							<textarea name="shootType" id="type"
								placeholder="What? How long? Where? How many people?" required></textarea>

							<label for="date">Preferred date for photo shoot<span
								class="required">*</span></label> <input type="date"
								name="preferredDate" id="date" required /> <label
								for="alternate-date">Alternate dates if not available?</label> <input
								type="text" name="alternateDate" id="alternate-date" />

							<p>
								We only work with professional photographers. Starts at
								Rs.25,000. Does this fit your budget?<span class="required">*</span>
							</p>
							<label for="budget" class="checkbox-label"> YES <input
								type="checkbox" name="budget" id="budget" value="yes" required />
							</label>

							<div class="button-group">
								<button type="button" class="form-button" id="nextToPersonal">Next</button>
							</div>
						</div>

						<!-- Step 2: Personal Details -->
						<div class="form-page" id="personalForm">
							<label for="fullname">Your full name<span
								class="required">*</span></label> <input type="text" name="fullname"
								id="fullname" required /> <label for="email">Email<span
								class="required">*</span></label> <input type="email" name="email"
								id="email" required /> <label for="phone">Phone number<span
								class="required">*</span></label> <input type="tel" name="phone"
								id="phone" required /> <label for="whatsapp">WhatsApp</label> <input
								type="tel" name="whatsapp" id="whatsapp" />

							<div class="button-group">
								<button type="button" class="form-button" id="backToPhotoshoot">Previous</button>
								<button type="submit" class="form-button">SEND</button>
							</div>
						</div>
					</form>
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
