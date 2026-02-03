<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="test.Notification" %>

<%
    List<Notification> list = (List<Notification>) request.getAttribute("notifications");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notifications</title>

<link rel="stylesheet" href="common.css">

<style>
/* Neon Background*/
body 
{
    margin: 0;
    font-family: "Poppins", Arial, sans-serif;
    background: radial-gradient(circle at top,
        #2a0845,
        #0f051d 70%);
    min-height: 100vh;
}

/* Neon Card */
.notify-box
 {
    width: 70%;
    max-width: 850px;
    margin: 120px auto;
    background: rgba(255, 255, 255, 0.08);
    backdrop-filter: blur(18px);
    padding: 35px;
    border-radius: 22px;

    box-shadow:
        0 0 25px rgba(255, 0, 255, 0.35),
        0 0 60px rgba(138, 43, 226, 0.25);

    animation: glowFade 1s ease-in-out;
}

/*Neon Title */
.notify-box h2
 {
    text-align: center;
    font-size: 34px;
    margin-bottom: 30px;
    color: #f5c6ff;
    text-shadow:
        0 0 10px #ff00ff,
        0 0 20px #c77dff;
}

/* Notification Card*/
.notify 
{
    padding: 18px 20px;
    margin-bottom: 18px;
    border-radius: 14px;
    background: rgba(255, 255, 255, 0.12);
    border-left: 5px solid #ff00ff;
    color: #fff;

    box-shadow:
        0 0 12px rgba(255, 0, 255, 0.4);

    transition: all 0.3s ease;
}

.notify:hover 
{
    transform: translateY(-4px) scale(1.01);
    box-shadow:
        0 0 20px rgba(255, 0, 255, 0.7),
        0 0 40px rgba(138, 43, 226, 0.6);
}

/*Unread Neon*/
.notify.unread 
{
    border-left-color: #00e5ff;
    box-shadow:
        0 0 15px rgba(0, 229, 255, 0.6),
        0 0 35px rgba(0, 229, 255, 0.4);
    font-weight: 600;
}

/* Time*/
.time 
{
    margin-top: 8px;
    font-size: 13px;
    color: #ddd;
    text-align: right;
}

/* Empty State*/
.empty 
{
    text-align: center;
    color: #e0b3ff;
    font-size: 18px;
}

.empty small 
{
    color: #ccc;
}

/* Neon Button */
.back
 {
    text-align: center;
    margin-top: 35px;
}

.back a 
{
    padding: 14px 36px;
    border-radius: 40px;
    text-decoration: none;
    font-size: 17px;
    color: white;

    background: linear-gradient(90deg,
        #ff00ff,
        #8a2be2,
        #00e5ff);

    box-shadow:
        0 0 15px #ff00ff,
        0 0 30px #8a2be2;

    transition: all 0.3s ease;
}

.back a:hover 
{
    transform: scale(1.08);
    box-shadow:
        0 0 25px #ff00ff,
        0 0 55px #00e5ff;
}

/* Animation */
@keyframes glowFade {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

</style>

</head>

<body>

<jsp:include page="header.jsp" />

<div class="notify-box">

    <h2>My Notifications</h2>

    <%
        if (list != null && !list.isEmpty()) 
        {
            for (Notification n : list) 
            {
    %>
        <div class="notify <%= n.isRead() ? "" : "unread" %>">
            <%= n.getMessage() %>
            <div class="time"><%= n.getCreatedAt() %></div>
        </div>
    <%
            }
        } 
        else 
        {
    %>
        <div class="empty">
            🔔 No notifications available <br>
            <small>You’re all caught up!</small>
        </div>
    <%
        }
    %>

    <div class="back">
        <a href="ProfileServlet">← Back to Profile</a>
    </div>

</div>

<script src="notification.js"></script>

<jsp:include page="footer.jsp" />

</body>
</html>
