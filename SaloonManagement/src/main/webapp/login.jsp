<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>

<style>
body 
{
    margin: 0;
    font-family: Arial, sans-serif;
    background: url("images/profile-bg.png") no-repeat center;
    background-size: cover;
}

.login-box 
{
    width: 350px;
    margin: 100px auto;
    background: rgba(255,255,255,0.9);
    padding: 25px;
    border-radius: 10px;
}

.login-box h2 
{
    text-align: center;
    margin-bottom: 20px;
}

input[type="email"],
input[type="password"] 
{
    width: 100%;
    padding: 10px;
    margin: 8px 0;
}

button 
{
    width: 100%;
    padding: 10px;
    background: #c2185b;
    border: none;
    color: white;
    font-size: 16px;
    cursor: pointer;
}

.error 
{
    color: red;
    text-align: center;
    margin-top: 10px;
}
</style>

</head>

<body>

<div class="login-box">
    <h2>User Login</h2>

    <!-- Login Form -->
    <form action="LoginServlet" method="post">
        <input type="email" name="email" placeholder="Enter Email" required>
        <input type="password" name="password" placeholder="Enter Password" required>

        <button type="submit">Login</button>
    </form>

    <!-- Error Message -->
    <%
        String error = (String) request.getAttribute("errorMessage");
        if (error != null) 
        {
    %>
        <div class="error"><%= error %></div>
    <%
        }
    %>
</div>

</body>
</html>
