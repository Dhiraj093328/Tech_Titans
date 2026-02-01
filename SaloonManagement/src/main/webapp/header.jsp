<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String userName = (String) session.getAttribute("userName");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Salon Appointment System</title>

    <link rel="stylesheet" href="common.css">
    
<style>
.header {
    background: #4a148c;
    padding: 15px 30px;
    color: white;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo {
    font-size: 22px;
    font-weight: bold;
}

.nav a {
    color: white;
    text-decoration: none;
    margin-left: 15px;
    font-weight: bold;
}

.nav a:hover {
    text-decoration: underline;
}
</style>

</head>

<body>

<div class="header">

    <div class="logo">
        ✂️ Salon Booking
    </div>

    <div class="nav">
        <a href="ProfileServlet">Profile</a>
        <a href="AppointmentHistoryServlet">Appointments</a>
        <a href="NotificationServlet">Notifications</a>
        <a href="LogoutServlet">Logout</a>
    </div>
        

</div>
