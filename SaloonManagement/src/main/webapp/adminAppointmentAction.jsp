<%@ page import="java.sql.*" %>
<%@ page import="test.JDBCCon" %>

<%
Integer adminId = (Integer) session.getAttribute("userId");
if (adminId == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<h2>Pending Appointments</h2>

<%
Connection con = JDBCCon.getConnection();
PreparedStatement ps = con.prepareStatement(
    "SELECT a.appointment_id, u.name, u.email, u.contact, " +
    "a.appointment_date, a.time_slot " +
    "FROM appointments a JOIN users u ON a.user_id = u.user_id " +
    "WHERE a.status='PENDING'"
);

ResultSet rs = ps.executeQuery();

while (rs.next()) {
%>

<div style="border:1px solid #ccc;padding:15px;margin:10px;">
    <b>Name:</b> <%= rs.getString("name") %><br>
    <b>Email:</b> <%= rs.getString("email") %><br>
    <b>Contact:</b> <%= rs.getString("contact") %><br>
    <b>Date & Time:</b>
    <%= rs.getDate("appointment_date") %> |
    <%= rs.getString("time_slot") %><br><br>

    <a href="UpdateAppointmentStatusServlet?id=<%=rs.getInt("appointment_id")%>&status=APPROVED">
        ✅ Accept
    </a> |
    <a href="UpdateAppointmentStatusServlet?id=<%=rs.getInt("appointment_id")%>&status=REJECTED">
        ❌ Reject
    </a>
</div>

<% } %>
