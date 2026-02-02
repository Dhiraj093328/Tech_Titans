<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String errorMsg = (String) request.getAttribute("errorMessage");
    if (errorMsg == null)
    {
        errorMsg = "Something went wrong. Please try again.";
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<link rel="stylesheet" href="common.css">

<style>
body 
{
    margin: 0;
    font-family: Arial, sans-serif;
    background: url("../images/salon-bg.jpg") no-repeat center;
    background-size: cover;
}

.error-box 
{
    width: 420px;
    margin: 120px auto;
    background: rgba(255,255,255,0.95);
    padding: 25px;
    border-radius: 10px;
    text-align: center;
}

.error-box h2 
{
    color: #c62828;
}

.error-box p 
{
    margin-top: 10px;
}

.error-box a 
{
    display: inline-block;
    margin-top: 15px;
    padding: 8px 15px;
    background: #4a148c;
    color: white;
    text-decoration: none;
    border-radius: 5px;
}
</style>

</head>

<body>

<div class="error-box">
    <h2>Oops!</h2>
    <p><%= errorMsg %></p>

    <a href="ProfileServlet">Go Back</a>
</div>

</body>
</html>
