<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<tr>
    <th>User</th>
    <th>Service</th>
    <th>Date</th>
    <th>Time</th>
    <th>Status</th>
    <th>Action</th>
</tr>

<tr>
    <td>Shreya</td>
    <td>Facial</td>
    <td>2026-02-01</td>
    <td>11:00 AM</td>
    <td>Pending</td>
    <td>
        <a href="UpdateAppointmentStatusServlet?id=1&status=Approved">Approve</a> |
        <a href="UpdateAppointmentStatusServlet?id=1&status=Rejected">Reject</a>
    </td>
</tr>
</table>

</body>
</html>