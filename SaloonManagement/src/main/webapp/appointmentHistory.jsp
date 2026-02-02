<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="test.Appointment" %>

<%
    // List sent from AppointmentHistoryServlet
    List<Appointment> list = (List<Appointment>) request.getAttribute("appointments");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Appointment History</title>
<link rel="stylesheet" href="common.css">

<style>
body 
{
    margin: 0;
    font-family: Arial, sans-serif;
    background: url("../images/salon-bg.jpg") no-repeat center;
    background-size: cover;
}

.history-box 
{
    width: 80%;
    margin: 80px auto;
    background: rgba(255,255,255,0.95);
    padding: 20px;
    border-radius: 10px;
}

.history-box h2 
{
    text-align: center;
    margin-bottom: 15px;
}

table 
{
    width: 100%;
    border-collapse: collapse;
}

th, td 
{
    padding: 10px;
    text-align: center;
    border-bottom: 1px solid #ccc;
}

th 
{
    background: #4a148c;
    color: white;
}

.status 
{
    font-weight: bold;
}

.back 
{
    text-align: center;
    margin-top: 15px;
}

.back a 
{
    padding: 8px 14px;
    background: #c2185b;
    color: white;
    text-decoration: none;
    border-radius: 5px;
}
</style>
</head>
<body>

<jsp:include page="header.jsp" />

<div class="history-box">

    <h2>My Appointment History</h2>

    <table>
        <tr>
            <th>Salon</th>
            <th>Service</th>
            <th>Date</th>
            <th>Time</th>
            <th>Status</th>
        </tr>

        <%
            if (list != null && !list.isEmpty()) {
                for (Appointment a : list) {
        %>
        <tr>
            <td><%= a.getSalonName() %></td>
            <td><%= a.getServiceName() %></td>
            <td><%= a.getDate() %></td>
            <td><%= a.getTime() %></td>
            <td class="status"><%= a.getStatus() %></td>
        </tr>
        <%
                }
            } 
            else 
            {
        %>
        <tr>
            <td colspan="5">No appointments found</td>
        </tr>
        <%
            }
        %>
    </table>

    <div class="back">
        <a href="ProfileServlet">Back to Profile</a>
    </div>

</div>

<jsp:include page="footer.jsp" />

</body>
</html>
