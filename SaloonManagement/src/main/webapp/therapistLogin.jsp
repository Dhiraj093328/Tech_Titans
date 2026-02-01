<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Therapist Login Page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
	<div class="row justify-content-center">
		<div class="col-md-6">
			<div class="card">
				<div class="card-body">
					<h2 class="text-center mb-3">Therapist Login</h2>
					<form action="TherapistLoginServlet" method="post">
						<div class="mt-3">
							<label class="form-label">Username</label>
							<input class="form-control" type="text" name="tuser" required>
						</div>
						<div class="mt-3">
							<label class="form-label">Password</label>
							<input class="form-control" type="text" name="tpass" required>
						</div>
						<div class="mt-3">
							<button type="submit" class="btn btn-success">Submit</button>
						</div>
						<div class="mt-3">
							<a href="therapistRegister.jsp">Don't have Account? Click here to Register Account</a>
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