<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="test.User" %>

<%
    User user = (User) request.getAttribute("user");

    if (user == null) {
%>
        <h2 style="color:red; text-align:center; margin-top:50px;">
            ❌ Profile data not available <br>
            Please access this page via ProfileServlet
        </h2>
<%
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>

<link rel="stylesheet" href="profile.css">
<link rel="stylesheet" href="common.css">

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: url("../images/salon-bg.jpg") no-repeat center;
    background-size: cover;
}

.profile-box {
    width: 400px;
    margin: 80px auto;
    background: rgba(255,255,255,0.9);
    padding: 20px;
    border-radius: 10px;
}

.profile-box h2 {
    text-align: center;
}

.row {
    margin: 10px 0;
}

.row label {
    font-weight: bold;
}

.actions {
    text-align: center;
    margin-top: 15px;
}

.actions a {
    text-decoration: none;
    background: #c2185b;
    color: white;
    padding: 8px 14px;
    margin: 5px;
    border-radius: 5px;
}
</style>
</head>

<body>

<jsp:include page="header.jsp" />

<div class="profile-box">

    <h2>My Profile</h2>

    <div class="row">
        <label>Name :</label>
        <%= user.getName() %>
    </div>

    <div class="row">
        <label>Email :</label>
        <%= user.getEmail() %>
    </div>

    <div class="row">
        <label>Phone :</label>
        <%= user.getPhone() %>
    </div>

    <div class="row">
        <label>Address :</label>
        <%= user.getAddress() %>
    </div>

    <div class="actions">
        <a href="editProfile.jsp">Edit Profile</a>
        <a href="changePassword.jsp">Change Password</a>
        <a href="AppointmentHistoryServlet">Appointments</a>
    </div>

</div>

<jsp:include page="footer.jsp" />

</body>
</html>
