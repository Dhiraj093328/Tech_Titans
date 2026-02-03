<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login Page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<style>
#loginBtn {
    border-radius: 14px;
    background: linear-gradient(135deg, #667eea, #764ba2);
    border: none;
}
#btnLoader {
    animation: fadeIn 0.3s ease-in;
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

@keyframes fadeIn {
    from { opacity: 0; }
    to   { opacity: 1; }
}
#loginBtn {
    transition: all 1.0s ease;
}
body {
	background: linear-gradient(135deg, #74ebd5, #9face6);
}
.alert {
    animation: slideDown 0.4s ease;
}

@keyframes slideDown {
    from {
        opacity: 0;
        transform: translateY(-10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
</style>
</head>
<body class="bg-light" style="background: linear-gradient(135deg, #74ebd5, #9face6);">
<jsp:include page="success.jsp"/>
<jsp:include page="header.jsp"/>
<div class="mt-4 d-flex align-items-center" style="min-height:100vh;">
<div class="container mt-4">
	<div class="row justify-content-center">
		<div class="col-12 col-sm-10 col-md-6 col-lg-4">
			<div class="card shadow-lg rounded-4">
				<div class="card-body p-4">
					<h2 class="text-center fw-bold">Admin Login</h2>
<%
String error = (String) request.getAttribute("error");
if (error != null) {
%>
<div id="loginError" class="alert alert-danger text-center fade show mt-3">
    <i class="bi bi-exclamation-triangle-fill me-2"></i>
    <%= error %>
</div>
<%
}
%>
					<form action="ShopLogin" method="post" class="needs-validation" novalidate>
						<div class="input-group mt-3">
    						<span class="input-group-text">
        						<i class="bi bi-person-fill"></i>
						    </span>
    						<input type="text" class="form-control" name="auser"
           					placeholder="Enter username" required>
    						<div class="invalid-feedback">
        						Username is required
    						</div>
						</div>
						<div class="input-group mt-3">
    						<span class="input-group-text">
        						<i class="bi bi-lock-fill"></i>
    						</span>
    						<input type="password" class="form-control" id="password"
           					name="apass" placeholder="Enter password" required minlength="6">
    						<div class="invalid-feedback">
        						Password must be at least 6 characters
    						</div>
						</div>
						<div class="form-check mt-2">
    						<input class="form-check-input" type="checkbox"
           					id="showPass" onclick="togglePassword()">
    						<label class="form-check-label" for="showPass">
        					Show Password
    						</label>
						</div>						
						<button type="submit" id="loginBtn" class="btn btn-success w-100 mt-4 fw-semibold d-flex justify-content-center align-items-center">
    						<span id="btnText">Login</span>
    						<span id="btnLoader" class="spinner-border spinner-border-sm ms-2 d-none" role="status" aria-hidden="true"></span>
						</button>
						<div  class="text-center mt-3 d-flex justify-content-between" style="max-width: 260px; margin: auto;">
							<a href="changePassword.jsp" class="text-decoration-none">
							Forgat Password?</a>
  							<a href="adminRegister.jsp" class="text-decoration-none">
    							Create Account
  							</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
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
document.addEventListener("DOMContentLoaded", () => {
    const errorBox = document.getElementById("loginError");

    if (errorBox) {
        setTimeout(() => {
            errorBox.style.opacity = "0";
            errorBox.style.transform = "translateY(-10px)";
            setTimeout(() => errorBox.remove(), 400);
        }, 3000);
    }
});
</script>
<script>
document.querySelector("form").addEventListener("submit", function (e) {

    if (!this.checkValidity()) return;

    e.preventDefault(); // pause submit briefly

    const form = this;
    const btn = document.getElementById("loginBtn");
    const text = document.getElementById("btnText");
    const loader = document.getElementById("btnLoader");

    btn.disabled = true;
    text.textContent = "Logging in";
    loader.classList.remove("d-none");

    // Minimum loader visibility (400ms)
    setTimeout(() => form.submit(), 400);
});
</script>
<script>
window.addEventListener("pageshow", function () {
    const btn = document.getElementById("loginBtn");
    const text = document.getElementById("btnText");
    const loader = document.getElementById("btnLoader");

    if (btn && text && loader) {
        btn.disabled = false;
        text.textContent = "Login";
        loader.classList.add("d-none");
    }
});
</script>
<jsp:include page="footer.jsp"/>
</body>
<script>
function togglePassword() {
    const pass = document.getElementById("password");
    pass.type = pass.type === "password" ? "text" : "password";
}
</script>
<script src="js/bootstrap.bundle.min.js"></script>
</html>