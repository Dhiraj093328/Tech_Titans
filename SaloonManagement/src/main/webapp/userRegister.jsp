<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="userAuth.css">
</head>
<body>

<div class="auth-container">
    <h2>User Registration</h2>

    <form action="UserRegisterServlet" method="post">
        <input type="text" name="name" placeholder="Full Name" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="password" placeholder="Confirm Password" required>

        <button type="submit">Register</button>
    </form>

    <p class="switch">
        Already have an account?
        <a href="userLogin.jsp">Login</a>
    </p>
</div>

</body>
</html>