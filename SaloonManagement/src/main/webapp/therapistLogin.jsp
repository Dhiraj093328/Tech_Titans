<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Therapist Login Page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<style>
.alert {
    transition: opacity 0.5s ease, transform 0.5s ease;
}

.alert:not(.show) {
    opacity: 0;
    transform: translateY(-10px);
}
#loginBtn {
    border-radius: 14px;
    background: linear-gradient(135deg, #667eea, #764ba2);
    border: none;
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
body {
	background: linear-gradient(135deg, #74ebd5, #9face6);
}
</style>
</head>
<body class="bg-light d-flex align-items-center" style="min-height:100vh;">
<div class="container">
	<div class="row justify-content-center">
		<div class="col-12 col-sm-10 col-md-6 col-lg-5">
      		<div class="card shadow-lg rounded-4">
				<div class="card-body p-4">
					<h2 class="text-center fw-bold">Therapist Login</h2>
<%
String error   = (String) request.getAttribute("error");
%>


<% if (error != null) { %>
<div id="errorMsg" class="alert alert-danger text-center fade show">
    <i class="bi bi-exclamation-triangle-fill me-2"></i>
    <%= error %>
</div>
<% } %>

					<form action="TherapistLoginServlet" method="post" class="needs-validation" novalidate>
						<div class="input-group mt-3">
    							<span class="input-group-text"><i class="bi bi-person-fill"></i></span>
    							<input type="text" class="form-control" name="tuser" placeholder="Enter username" required minlength="4">
    							<div class="invalid-feedback">
      								Please enter your username (min 4 characters)
    							</div>
						</div>
						<div class="input-group mt-3">
    							<span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
    							<input type="password" class="form-control" id="password" name="tpass" placeholder="Enter password" required minlength="6">
    						<div class="invalid-feedback">
						      Password must be at last 6 characters
  							</div>
						</div>
						<div class="form-check mt-3">
  							<input class="form-check-input" type="checkbox" onclick="togglePassword()">
  							<label class="form-check-label">Show Password</label>
						</div>						
						<div class="mt-3">
							<button type="submit" id="loginBtn" class="btn btn-success w-100 py-2 fw-semibold d-flex justify-content-center align-items-center">
  								<span id="btnText">Login</span>
  								<span id="btnLoader" class="spinner-border spinner-border-sm ms-2 d-none"></span>
							</button>
						</div>
						<div  class="text-center mt-3 d-flex justify-content-between" style="max-width: 260px; margin: auto;">
							<a href="forgat" class="text-decoration-none">
							Forgat Password?</a>
  							<a href="therapistRegister.jsp" class="text-decoration-none">
    							Create Account
  							</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
document.querySelector("form").addEventListener("submit", function (e) {

  if (!this.checkValidity()) return;

  e.preventDefault();

  const btn = document.getElementById("loginBtn");
  const text = document.getElementById("btnText");
  const loader = document.getElementById("btnLoader");

  btn.disabled = true;
  text.textContent = "Logging in";
  loader.classList.remove("d-none");

  setTimeout(() => this.submit(), 800);
});
</script>
<script>
window.addEventListener("DOMContentLoaded", () => {

    const success = document.getElementById("successMsg");
    const error   = document.getElementById("errorMsg");

    if (error) {
        setTimeout(() => {
            error.classList.remove("show");
            setTimeout(() => error.remove(), 300);
        }, 2000);
    }

});
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
<script>
function togglePassword() {
  const p = document.getElementById("password");
  p.type = p.type === "password" ? "text" : "password";
}
</script>
</body>
<script src="js/bootstrap.bundle.min.js"></script>
</html>