package test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AppointmentHistoryServlet")
public class AppointmentHistoryServlet extends HttpServlet 
{

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {

        // 1️)Get session
        HttpSession session = request.getSession(false);

        // Session check
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<Appointment> list = new ArrayList<>();

        try {
            //2)DB connection
            con = DBConnection.getConnection();

            //3)SQL to fetch appointment history
            String sql = "SELECT salon_name, service_name, appointment_date, " +
                         "appointment_time, status FROM appointments WHERE user_id=?";

            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            // 4️)Store records in list
            while (rs.next()) 
            {
                Appointment a = new Appointment();
                a.setSalonName(rs.getString("salon_name"));
                a.setServiceName(rs.getString("service_name"));
                a.setDate(rs.getDate("appointment_date"));
                a.setTime(rs.getTime("appointment_time"));
                a.setStatus(rs.getString("status"));

                list.add(a);
            }

            // 5️)Send list to JSP
            request.setAttribute("appointments", list);
            request.getRequestDispatcher("appointmentHistory.jsp") .forward(request, response);

        } 
        catch (Exception e) 
        {
            System.out.println(e);
            request.setAttribute("errorMessage", "Unable to load appointment history");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
