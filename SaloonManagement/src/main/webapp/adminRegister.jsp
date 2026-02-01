<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Registration Page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
	<div class="row justify-content-center">
		<div class="col-md-6">
			<div class="card">
				<div class="card-body">
					<h2 class="text-center mb-3">Admin Registration</h2>
					<form action="ShopRegister" method="post">
						<div class="mt-3">
							<label class="form-label">Shop Name</label>
							<input class="form-control" type="text" name="shop_name" pattern="[A-Za-z0-9 ]{3,100}"
       title="Shop name must be at least 3 characters" required>
						</div>
						<div class="mt-3">
							<label class="form-label">Registration No.</label>
							<input class="form-control" type="text" name="register_no"  pattern="[A-Za-z0-9-]{5,20}"
       title="Registration number must be 5–20 characters (letters, numbers, hyphen)" required>
						</div>
						<div class="mt-3">
							<label class="form-label">Owner Name</label>
							<input class="form-control" type="text" name="owner_name" pattern="[A-Za-z ]{3,100}"
       title="Owner name must contain only letters and spaces" required>
						</div>
						<div class="mt-3">
							<label class="form-label">Opening Time</label>
							<input class="form-control" type="time" name="opening_time" required>
						</div>
						<div class="mt-3">
							<label class="form-label">Closing Time</label>
							<input class="form-control" type="time" name="closing_time" required>
						</div>
						<div class="mt-3">
							<label class="form-label">Email</label>
							<input class="form-control" type="email" name="email"  maxlength="100" required>
						</div>
						<div class="mt-3">
							<label class="form-label">Contact No</label>
							<input class="form-control" type="text" name="contact_no"  pattern="[0-9]{10}"
       title="Contact number must be exactly 10 digits" required>
						</div>
						<div class="mt-3">
							<label class="form-label">Username</label>
							<input class="form-control" type="text" name="auser"  pattern="[A-Za-z0-9._]{5,20}"
       title="Username must be 5–20 characters (letters, numbers, . or _)" required>
						</div>
						<div class="mt-3">
							<label class="form-label">Password</label>
							<input class="form-control" type="text" name="apass" pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}"
       title="Password must contain at least 1 uppercase, 1 lowercase, 1 number and 8 characters" required>
						</div>
						<div class="mt-3">
							<button type="submit" class="btn btn-success">Register</button>
						</div>
						<div class="mt-3">
							<a href="adminRegister.jsp">Already have Account? Click here to Login.</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script src="js/bootstrap.bundle.min.js"></script>
</html>