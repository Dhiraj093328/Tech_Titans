package test;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateAppointmentStatusServlet")
public class UpdateAppointmentStatusServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException{

        int appointmentId = Integer.parseInt(req.getParameter("appointmentId"));
        String status = req.getParameter("status"); // APPROVED / REJECTED

        Connection con = JDBCCon.getConnection();

        try {
            // 1️⃣ Update appointment status
            PreparedStatement ps = con.prepareStatement(
                "UPDATE appointments SET status=? WHERE appointment_id=?"
            );
            ps.setString(1, status);
            ps.setInt(2, appointmentId);
            ps.executeUpdate();

            // 2️⃣ Fetch user email
            PreparedStatement ps2 = con.prepareStatement(
                "SELECT u.email FROM users u " +
                "JOIN appointments a ON u.user_id=a.user_id " +
                "WHERE a.appointment_id=?"
            );
            ps2.setInt(1, appointmentId);
            ResultSet rs = ps2.executeQuery();

            if (rs.next()) {
                String email = rs.getString("email");

                // 3️⃣ Send email
                MailUtil.sendMail(
                    email,
                    "Appointment " + status,
                    "Your appointment has been " + status
                );
            }

            res.sendRedirect("adminAppointments.jsp?msg=updated");

        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("adminAppointments.jsp?error=true");
        }
    }
}

