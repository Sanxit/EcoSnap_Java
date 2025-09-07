<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Login</title>
<link rel="stylesheet" href="css/login.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
	integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
	rel="stylesheet" />
<link rel="shortcut icon" href="img/favicon.ico"
	type="image/x-icon" />
</head>
<body>
	<div class="auth-modal">
		<!-- <button class="close-btn" aria-label="Close">&times;</button> -->
		<a href="index.jsp" style="text-decoration: none; color: black;"><i
			class="fa-solid fa-xmark"></i></a>
		<h2>Welcome Back</h2>
		<p style="color: green">${signupsuccessful}</p>
		<p style="color: red">${error}</p>
		<br>
		<form class="auth-form" method="post" action="login">
			<label for="username">Username</label> <input type="username"
				name="username" placeholder="Enter your username" required /> <label
				for="password">Password</label> <input type="password"
				name="password" placeholder="Enter your password" required />
			<button type="submit">Continue</button>
		</form>

		<div class="divider">
			<span>OR</span>
		</div>

		<ul class="social-login">
			<li>
				<button class="social-btn google">
					<i class="ri-google-fill"></i>Continue with Google
				</button>
			</li>
		</ul>
	</div>
</body>
</html>
