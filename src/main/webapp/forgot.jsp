<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Forgot Password</title>
<link rel="stylesheet" href="css/login.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
	rel="stylesheet" />
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
</head>
<body>
	<div class="login-container">
		<div class="left-panel">
			<img src="img/homecamera.png" alt="Camera" class="bg-img" />
			<div class="overlay-text">
				<span class="dot"></span>
				<h1>Capture your moment with us.</h1>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
					Morbi lobortis maximus nunc, ac rhoncus odio congue quis. Sed ac
					semper orci, eu porttitor lacus.</p>
			</div>
		</div>

		<div class="right-panel">
			<%
			String passErrorMsg = (String) session.getAttribute("passerror");
			if (passErrorMsg != null) {
			%>
			<p style="color: red; text-align: center; margin: 20px 0;"><%=passErrorMsg%></p>
			<%
			session.removeAttribute("passerror");
			}
			%>
			<div class="form-wrapper">
				<h2>Forgot Password?</h2>

				<form class="login-form"
					action="<%=request.getContextPath()%>/forgotpassword" method="post">
					<label for="email">Email</label> <input type="email" id="email"
						name="email" placeholder="Enter your email" required /> <label
						for="oldPassword">Old Password</label>
					<div class="password-wrapper">
						<input type="password" id="oldPassword" name="oldPassword"
							placeholder="Enter your old password" required />
					</div>

					<label for="newPassword">New Password</label>
					<div class="password-wrapper">
						<input type="password" id="newPassword" name="newPassword"
							placeholder="Enter your new password" required />
					</div>

					<div>
						<button type="submit" class="submit-btn">Change Password</button>
					</div>
				</form>

				<p class="bottom-signup">
					Remembered your password? <a href="login.jsp">Log in</a>
				</p>
			</div>
		</div>
	</div>
</body>
</html>
