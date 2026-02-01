<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login Page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
	<div class="row justify-content-center">
		<div class="col-md-6">
			<div class="card">
				<div class="card-body">
					<h2 class="text-center mb-3">Admin Login</h2>
					<form action="ShopLogin" method="post">
						<div class="mt-3">
							<label class="form-label">Username</label>
							<input class="form-control" type="text" name="auser" required>
						</div>
						<div class="mt-3">
							<label class="form-label">Password</label>
							<input class="form-control" type="text" name="apass" required>
						</div>
						<div class="mt-3">
							<button type="submit" class="btn btn-success">Submit</button>
						</div>
						<div class="mt-3">
							<a href="adminRegister.jsp">Don't have Account? Click here to Register Account.</a>
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