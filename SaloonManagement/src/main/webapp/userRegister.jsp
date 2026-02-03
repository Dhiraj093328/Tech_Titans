<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/userAuth.css">
</head>
<body>

<div class="auth-wrapper">
    <div class="auth-card">
        <h2>User Registration</h2>

        <form action="UserRegisterServlet" method="post">

            <div class="input-group">
                <input type="text" name="name" required>
                <label>Full Name</label>
            </div>

            <div class="input-group">
                <input type="email" name="email" required>
                <label>Email</label>
            </div>

            <div class="input-group">
                <input type="text" name="contact_no" required>
                <label>Contact Number</label>
            </div>

            <div class="input-group">
                <input type="text" name="username" required>
                <label>Username</label>
            </div>

            <div class="input-group">
                <input type="password" name="password" required>
                <label>Password</label>
            </div>

            <button class="gradient-btn">Register</button>
        </form>

        <p class="switch">
            Already have an account?
            <a href="userLogin.jsp">Login</a>
        </p>
    </div>
</div>


</body>
</html>