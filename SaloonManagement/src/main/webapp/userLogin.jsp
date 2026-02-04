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

<div class="auth-wrapper">
    <div class="auth-card">
        <h2>User Login</h2>
        
        <!-- ERROR MESSAGE -->
    <%
        String error = request.getParameter("error");
        if (error != null) {
    %>
        <p style="color:red; text-align:center;">
            Wrong username or password
        </p>
    <%
        }
    %>

        <form action="UserLogin" method="post">

            <div class="input-group">
                <input type="text" name="username" required>
                <label>Username</label>
            </div>

            <div class="input-group">
                <input type="password" name="password" required>
                <label>Password</label>
            </div>

            <button class="gradient-btn">Login</button>
        </form>

        <p class="switch">
            New user?
            <a href="userRegister.jsp">Register here</a>
        </p>
    </div>
</div>

</body>
</html>