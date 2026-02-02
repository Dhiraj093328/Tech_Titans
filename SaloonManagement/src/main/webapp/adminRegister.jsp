<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Registration Page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<style>
body {
    min-height: 100vh;
    background: linear-gradient(135deg, #667eea, #764ba2);
}
#registerBtn {
    transition: all 0.3s ease;
}
.form-control:focus {
    border-color: #198754;
    box-shadow: 0 0 0 .15rem rgba(25,135,84,.25);
}
.input-group-text {
    background-color: #f8f9fa;
}
.form-control {
    transition: all 0.2s ease;
}

.form-control:focus {
    transform: scale(1.01);
}
#registerBtn {
    border-radius: 14px;
    background: linear-gradient(135deg, #667eea, #764ba2);
    border: none;
}

#registerBtn:hover {
    transform: translateY(-1px);
    box-shadow: 0 6px 18px rgba(0,0,0,0.15);
}
.card {
    animation: fadeUp 0.5s ease;
}

@keyframes fadeUp {
    from {
        opacity: 0;
        transform: translateY(10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
</style>

</head>
<body class="d-flex align-items-center">
<div class="container mt-4">
	<div class="row justify-content-center">
		<div class="col-12 col-sm-10 col-md-8 col-lg-6">
			<div class="card shadow-lg rounded-4 border-0">
				<div class="card-body p-4 p-md-5">
					<div class="text-center mb-3">
    					<div class="bg-success bg-opacity-10 rounded-circle d-inline-flex align-items-center justify-content-center" style="width:64px;height:64px;">
        					<i class="bi bi-shop fs-3 text-success"></i>
    					</div>
					</div>
					<h2 class="text-center fw-bold mb-1">Create Admin Account</h2>
					<p class="text-center text-muted mb-4">
    					Register your shop to get started
					</p>
					<form action="ShopRegister" method="post" class="needs-validation" novalidate>
						<h6 class="text-uppercase fw-semibold text-primary mt-4 mb-3">
    						Shop Details
						</h6>
						<div class="mt-3">
    						<label class="form-label">Shop Name</label>
    						<input type="text" class="form-control" name="shop_name" pattern="[A-Za-z0-9 ]{3,100}" required>
    						<div class="invalid-feedback">
        						Shop name Required and must be at least 3 characters
    						</div>
						</div>
						<div class="mt-3">
    						<label class="form-label">Registration No.</label>
    						<input type="text" class="form-control" name="register_no" pattern="[A-Za-z0-9-]{5,20}" required>
    						<div class="invalid-feedback">
        						Shop Registerd Number Required
    						</div>
						</div>
						<div class="mt-3">
    						<label class="form-label">Owner Name</label>
    						<input type="text" class="form-control" name="owner_name" pattern="[A-Za-z ]{3,100}" required>
    						<div class="invalid-feedback">
        						Shop OwnerName must contain only letters (minimum 3 characters)
    						</div>
						</div>
						<div class="mt-3">
							<label class="form-label">Opening Time</label>
							<input class="form-control" type="time" name="opening_time" required>
							<div class="invalid-feedback">
        						Shop Opening Time Required
    						</div>
						</div>
						<div class="mt-3">
							<label class="form-label">Closing Time</label>
							<input class="form-control" type="time" name="closing_time" required>
							<div class="invalid-feedback">
        						Shop Closing Time Required
    						</div>
						</div>
						<h6 class="text-uppercase fw-semibold text-primary mt-4 mb-3">
						Contact Information</h6>
						<div class="mt-3">
    						<label class="form-label">Email</label>
    						<div class="input-group">
        						<span class="input-group-text"><i class="bi bi-envelope"></i></span>
        						<input type="email" class="form-control" name="email" required>
        						<div class="invalid-feedback">
        							Please enter a valid email address
    							</div>
    						</div>
						</div>
						<div class="mt-3">
    						<label class="form-label">Contact No</label>
    						<div class="input-group">
        						<span class="input-group-text"><i class="bi bi-telephone"></i></span>
        						<input type="text" class="form-control" name="contact_no" pattern="[0-9]{10}" required>
        						<div class="invalid-feedback">
        							Shop Contact number must be exactly 10 digits
    							</div>
    						</div>
						</div>
						<h6 class="text-uppercase fw-semibold text-primary mt-4 mb-3">
						Account Credentials</h6>
						<div class="mt-3">
    						<label class="form-label">Username</label>
    						<div class="input-group">
        						<span class="input-group-text"><i class="bi bi-person"></i></span>
        						<input type="text" class="form-control" name="auser" required>
        						<div class="invalid-feedback">
        							Shop Username must be 5–20 characters (letters, numbers, . or _)
    							</div>
    						</div>
						</div>
						<div class="mt-3">
    						<label class="form-label">Password</label>
    						<div class="input-group">
        						<span class="input-group-text"><i class="bi bi-lock"></i></span>
        						<input type="password" class="form-control" id="password" name="apass" required>
        						<div class="invalid-feedback">
        							Shop Password must contain uppercase, lowercase, number & 8+ characters
    							</div>
    						</div>
						</div>
						<div class="form-check mt-2">
    						<input class="form-check-input" type="checkbox" id="showPass" onclick="togglePassword()">
    						<label class="form-check-label" for="showPass">
        						Show Password
    						</label>
						</div>
						<hr class="my-4">
						<button type="submit" id="registerBtn" class="btn btn-primary w-100 fw-semibold py-2 d-flex justify-content-center align-items-center">
    						<span id="btnText">Register</span>
    						<span id="btnLoader" class="spinner-border spinner-border-sm ms-2 d-none"></span>
						</button>
						<div class="text-center mt-3">
    						<a href="adminLogin.jsp" class="text-decoration-none">
        						Already have an account? Login
    						</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
function togglePassword() {
    const pass = document.getElementById("password");
    pass.type = pass.type === "password" ? "text" : "password";
}
</script>
<script>
(() => {
    'use strict';
    const forms = document.querySelectorAll('.needs-validation');

    Array.from(forms).forEach(form => {
        form.addEventListener('submit', event => {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }, false);
    });
})();
</script>
<script>
window.addEventListener("pageshow", function () {
    const btn = document.getElementById("registerBtn");
    const text = document.getElementById("btnText");
    const loader = document.getElementById("btnLoader");

    if (btn && text && loader) {
        btn.disabled = false;
        text.textContent = "Register";
        loader.classList.add("d-none");
    }
});
</script>
<script>
document.querySelector("form").addEventListener("submit", function (e) {

    if (!this.checkValidity()) return;

    e.preventDefault(); // pause submit

    const form = this;
    const btn = document.getElementById("registerBtn");
    const text = document.getElementById("btnText");
    const loader = document.getElementById("btnLoader");

    btn.disabled = true;
    text.textContent = "Registering";
    loader.classList.remove("d-none");

    setTimeout(() => {
        form.submit(); // real submit after delay
    }, 800);
});
</script>
</body>
<script src="js/bootstrap.bundle.min.js"></script>
</html>