<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login | Salon Management</title>
<link rel="stylesheet" href="css/userAuth.css">
</head>
<body>

<div class="auth-container">
    <h2>User Login</h2>

    <form action="UserLoginServlet" method="post">
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>

        <button type="submit">Login</button>
    </form>

    <p class="switch">
        New user?
        <a href="userRegister.jsp">Register here</a>
    </p>
</div>

</body>
</html>