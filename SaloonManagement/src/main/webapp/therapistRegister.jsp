<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Therapist Register Page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<style>
.card {
  animation: fadeUp 0.5s ease;
}
@keyframes fadeUp {
  from { opacity: 0; transform: translateY(12px); }
  to { opacity: 1; transform: translateY(0); }
}
#registerBtn {
  border-radius: 14px;
  background: linear-gradient(135deg, #667eea, #764ba2);
  border: none;
}
</style>
</head>
<body style="background: linear-gradient(135deg, #74ebd5, #9face6);">
<jsp:include page="header.jsp"/>
<div class="mt-4 d-flex align-items-center" style="min-height:100vh;">
<div class="container mt-4">
	<div class="row justify-content-center">
		<div class="col-md-6">
			<div class="card shadow-lg rounded-4 border-0">
				<div class="card-body p-4">
					<h2 class="text-center fw-bold mb-1">Therapist Registration</h2>
					<p class="text-center text-muted mb-4">
    					Create your professional account
					</p>
					<form action="TherapistRegisterServlet" method="post" class="needs-validation" novalidate >
						<div class="mt-3">
							<label class="form-label">Name</label>
							<div class="input-group">
    							<span class="input-group-text"><i class="bi bi-person-circle"></i></span>
								<input class="form-control" type="text" id="tname" name="tname" pattern="[A-Za-z ]{3,100}"  required>
								<div class="invalid-feedback">
    								Name must contain only letters (minimum 3 characters)
  								</div>
							</div>
							
						</div>
						<div class="mt-3">
							<label class="form-label">Email</label>
							<div class="input-group">
    							<span class="input-group-text"><i class="bi bi-envelope"></i></span>
								<input class="form-control" type="email" id="tmail" name="tmail" maxlength="100" required>
								<div class="invalid-feedback">
    								Please enter a valid email address
  								</div>	
							</div>
							
						</div>
						<div class="mt-3">
							<label class="form-label">Contact No</label>
							<div class="input-group">
        						<span class="input-group-text"><i class="bi bi-telephone"></i></span>
								<input class="form-control" type="text" id="tcontact" name="tcontact" pattern="[0-9]{10}" maxlength="10"  required>
								<div class="invalid-feedback">
    								Contact number must be exactly 10 digits
  								</div>
							</div>
							
						</div>
						<div class="mt-3">
							<label class="form-label">Username</label>
							<div class="input-group">
        						<span class="input-group-text"><i class="bi bi-person-fill"></i></span>
								<input class="form-control" type="text" id="tuser" name="tuser"  pattern="[A-Za-z0-9._]{5,20}" required>
								<div class="invalid-feedback">
  									  Username must be 5–20 characters (letters, numbers, . or _)
  								</div>
							</div>
						</div>
						<div class="mt-3">
							<label class="form-label">Password</label>
							<div class="input-group">
        						<span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
								<input class="form-control" id="password" type="password" name="tpass"  pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}"  required>
								<div class="invalid-feedback">
    								Password must contain uppercase, lowercase, number & 8+ characters
  								</div>
							</div>
							
						</div>
						<div class="form-check mt-2">
    						<input class="form-check-input" type="checkbox" id="showPass" onclick="togglePassword()">
    						<label class="form-check-label" for="showPass">
        						Show Password
    						</label>
						</div>
						<div class="mt-3">
							<button type="submit" id="registerBtn" class="btn w-100 py-2 fw-semibold text-white d-flex justify-content-center align-items-center">
  								<span id="btnText">Register</span>
  								<span id="btnLoader" class="spinner-border spinner-border-sm ms-2 d-none"></span>
							</button>
						</div>
						<div class="text-center mt-3">
  							<a href="therapistLogin.jsp" class="text-decoration-none">
    							Already have an account? Login
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
function togglePassword() {
    const pass = document.getElementById("password");
    pass.type = pass.type === "password" ? "text" : "password";
}
</script>

<script>
document.querySelector("form").addEventListener("submit", function (e) {

  if (!this.checkValidity()) return;

  e.preventDefault();

  const btn = document.getElementById("registerBtn");
  const text = document.getElementById("btnText");
  const loader = document.getElementById("btnLoader");

  btn.disabled = true;
  text.textContent = "Registering";
  loader.classList.remove("d-none");

  setTimeout(() => this.submit(), 800);
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
<jsp:include page="footer.jsp"/>
</body>
<script src="js/bootstrap.bundle.min.js"></script>
</html>