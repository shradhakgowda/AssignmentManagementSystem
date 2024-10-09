<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AssignEase</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	<link rel="icon" href="https://th.bing.com/th/id/OIP.0ZS5CeNTu8-AaZB9tSAg5gHaHa?w=200&h=198&c=7&r=0&o=5&dpr=1.5&pid=1.7" type="image/x-icon">
	
<style>
    .container {
        margin-top: 50px;
    }
    .form-container {
        background-color: #f9f9f9;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .alert {
        margin-bottom: 20px;
    }
    body {
        background-image: url('https://img.freepik.com/free-photo/vivid-blurred-colorful-wallpaper-background_58702-3440.jpg'); /* Replace with your image URL */
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-position: center;
    }
    .btn-disabled {
        pointer-events: none;
        opacity: 0.6;
    }
</style>
</head>
<body>
	<jsp:include page="../common/Header.jsp"></jsp:include>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-8 col-lg-6 form-container m-3">
				<h2 class="text-center">Register Here</h2>

				<form action="<%=request.getContextPath()%>/register" method="post" onsubmit="return validateForm()">
					<div class="form-group">
						<label for="username">Username:</label>
						<input type="text" class="form-control" id="username" placeholder="Username" name="username" required onkeyup="validateUsername()">
						<div id="usernameValidation" class="mt-2"></div>
					</div>

					<div class="form-group">
						<label for="email">Email:</label>
						<input type="email" class="form-control" id="email" placeholder="Email" name="email" required onkeyup="validateEmail()">
						<div id="emailValidation" class="mt-2"></div>
					</div>

					<div class="form-group">
						<label for="password">Password:</label>
						<input type="password" class="form-control" id="password" placeholder="Password" name="password" required onkeyup="validatePassword()">
						<div id="passwordValidation" class="mt-2"></div>
					</div>

					<div class="form-group">
						<label for="confirmPassword">Confirm Password:</label>
						<input type="password" class="form-control" id="confirmPassword" placeholder="Confirm Password" name="confirmPassword" required onkeyup="validatePassword()">
						<div id="confirmPasswordValidation" class="mt-2"></div>
					</div>

					<div class="form-group">
						<label for="role">Role:</label>
						<select id="role" name="role" class="form-control" required onchange="validateRole()">
							<option value="">Select Role</option>
							<option value="student">Student</option>
							<option value="instructor">Instructor</option>
						</select>
						<div id="roleValidation" class="mt-2"></div>
					</div>
					<button type="submit" id="registerButton" class="btn btn-primary btn-block btn-disabled">Register</button>
				</form>
			</div>
		</div>

	<script>
		function validateUsername() {
			var username = document.getElementById("username").value;
			var usernameValidation = document.getElementById("usernameValidation");
			if (username.length < 3) {
				usernameValidation.innerHTML = "<span class='text-danger'>Username must be at least 3 characters long.</span>";
			} else {
				usernameValidation.innerHTML = "";
			}
			validateForm();
		}

		function validateEmail() {
			var email = document.getElementById("email").value;
			var emailValidation = document.getElementById("emailValidation");
			var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			if (!emailPattern.test(email)) {
				emailValidation.innerHTML = "<span class='text-danger'>Enter a valid email address.</span>";
			} else {
				emailValidation.innerHTML = "";
			}
			validateForm();
		}

		function validatePassword() {
			var password = document.getElementById("password").value;
			var confirmPassword = document.getElementById("confirmPassword").value;
			var passwordValidation = document.getElementById("passwordValidation");
			var confirmPasswordValidation = document.getElementById("confirmPasswordValidation");

			var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{12,}$/;
			var passwordValid = passwordPattern.test(password);
			var passwordsMatch = password === confirmPassword;

			if (password.length === 0) {
				passwordValidation.innerHTML = "";
			} else if (!passwordValid) {
				passwordValidation.innerHTML = "<span class='text-danger'>Password must be at least 12 characters long, with at least one uppercase letter, one lowercase letter, one digit, and one special character.</span>";
			} else {
				passwordValidation.innerHTML = "<span class='text-success'>Password is strong.</span>";
			}

			if (confirmPassword.length === 0) {
				confirmPasswordValidation.innerHTML = "";
			} else if (!passwordsMatch) {
				confirmPasswordValidation.innerHTML = "<span class='text-danger'>Passwords do not match.</span>";
			} else {
				confirmPasswordValidation.innerHTML = "<span class='text-success'>Passwords match.</span>";
			}
			validateForm();
		}

		function validateRole() {
			var role = document.getElementById("role").value;
			var roleValidation = document.getElementById("roleValidation");
			if (role === "") {
				roleValidation.innerHTML = "<span class='text-danger'>Please select a role.</span>";
			} else {
				roleValidation.innerHTML = "";
			}
			validateForm();
		}

		function validateForm() {
			var username = document.getElementById("username").value;
			var email = document.getElementById("email").value;
			var password = document.getElementById("password").value;
			var confirmPassword = document.getElementById("confirmPassword").value;
			var role = document.getElementById("role").value;
			var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{12,}$/;
			var usernameValid = username.length >= 3;
			var emailValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
			var passwordValid = passwordPattern.test(password);
			var passwordsMatch = password === confirmPassword;
			var roleValid = role !== "";

			var allValid = usernameValid && emailValid && passwordValid && passwordsMatch && roleValid;
			document.getElementById("registerButton").classList.toggle("btn-disabled", !allValid);
			return allValid;
		}
	</script>
</body>
</html>
