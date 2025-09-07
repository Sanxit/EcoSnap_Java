<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Sign up</title>
<link href="css/login.css" rel="stylesheet" />
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
			<div class="form-wrapper">
				<h2>Sign Up</h2>
				<p style="color: red">${signupfail}</p>
				<br>
				<form class="login-form" action="signup" method="post">
					<label for="username">Username</label> <input type="text"
						name="username" placeholder="Create an username" required /> <label
						for="password">Password</label>
					<div class="password-wrapper">
						<input type="password" name="password"
							placeholder="Create a password" required />
					</div>

					<div class="forgot-password">
						<a href="#">Forget your password</a>
					</div>
					<div>
						<a href="">
							<button type="submit" class="submit-btn">Sign up</button>
						</a>
					</div>
				</form>

				<div class="divider">
					<span>OR</span>
				</div>

				<button class="social-btn google">
					<i class="ri-google-fill"></i> Continue with Google
				</button>

				<p class="bottom-signup">
					Don't have an account? <a href="login">Log in</a>
				</p>
			</div>
		</div>
	</div>
</body>
</html>
