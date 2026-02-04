<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // Session check
    Integer userId = (Integer) session.getAttribute("userId");
    String userName = (String) session.getAttribute("userName");

    //if (userId == null) 
    //{
     //   response.sendRedirect("login.jsp");
     //   return;
    //}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>

<!-- CSS -->
<link rel="stylesheet" href="common.css">
<link rel="stylesheet" href="dashboard.css">

</head>
<body>

<!-- Header -->
<jsp:include page="header.jsp" />

<div class="dashboard">

    <!-- Welcome Box -->
    <div class="welcome-box">
        <h2>Welcome, <%= userName %> 👋</h2>
        <p>Manage your profile, appointments and notifications from here.</p>
    </div>

    <!-- Dashboard Cards -->
    <div class="cards">

        <!-- Profile Card -->
        <div class="card">
            <h3>My Profile</h3>
            <p>View and update your profile details</p>
            <a href="ProfileServlet">View Profile</a>
        </div>

        <!-- Appointment History -->
        <div class="card">
            <h3>Appointments</h3>
            <p>View your appointment history</p>
            <a href="AppointmentHistoryServlet">View Appointments</a>
        </div>

        <!-- Notifications -->
        <div class="card">
            <h3>Notifications</h3>
            <p>Check latest updates and alerts</p>
            <a href="NotificationServlet">View Notifications</a>
        </div>

        <!-- Change Password -->
        <div class="card">
            <h3>Security</h3>
            <p>Change your account password</p>
            <a href="changePassword.jsp">Change Password</a>
        </div>

    </div>
</div>

<!-- Footer -->
<jsp:include page="footer.jsp" />

</body>
</html>
