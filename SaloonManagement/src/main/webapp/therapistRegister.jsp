<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Therapist Register Page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
	<div class="row justify-content-center">
		<div class="col-md-6">
			<div class="card">
				<div class="card-body">
					<h2 class="text-center mb-3">Therapist Registration Page</h2>
					<form action="TherapistRegisterServlet" method="post">
						<div class="mt-3">
							<label class="form-label">Name</label>
							<input class="form-control" type="text" name="tname" pattern="[A-Za-z ]{3,100}"
       title="Name must contain only letters and spaces (min 3 characters)" required>
						</div>
						<div class="mt-3">
							<label class="form-label">Email</label>
							<input class="form-control" type="email" name="tmail" maxlength="100"
       title="Enter a valid email address" required>
						</div>
						<div class="mt-3">
							<label class="form-lable">Contact No</label>
							<input class="form-control" type="text" name="tcontact" pattern="[0-9]{10}"
       maxlength="10"
       title="Contact number must be exactly 10 digits" required>
						</div>
						<div class="mt-3">
							<label class="form-label">Username</label>
							<input class="form-control" type="text" name="tuser"  pattern="[A-Za-z0-9._]{5,20}"
       title="Username must be 5–20 characters (letters, numbers, . or _)" required>
						</div>
						<div class="mt-3">
							<label class="form-label">Password</label>
							<input class="form-control" type="text" name="tpass"  pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}"
       title="Password must contain at least 1 uppercase, 1 lowercase, 1 number and 8 characters" required>
						</div>
						<div class="mt-3">
							<button type="submit" class="btn btn-success">Register</button>
						</div>
						<div>
							<a href="therapistLogin.jsp">Alredey have Account? Click here to Login</a>
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