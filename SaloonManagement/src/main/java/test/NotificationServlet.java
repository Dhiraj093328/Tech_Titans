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

@WebServlet("/NotificationServlet")
public class NotificationServlet extends HttpServlet 
{

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {

        // 1️)Get session
        HttpSession session = request.getSession(false);

        // Session validation
       if (session == null || session.getAttribute("userId") == null) 
       {
             response.sendRedirect("login.jsp");
             return;
        }

        int userId = (int) session.getAttribute("userId");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<Notification> list = new ArrayList<>();

        try 
        {
            // 2️)DB connection
            con = DBConnection.getConnection();

            // 3️)Fetch notifications
            String sql = "SELECT message, is_read, created_at " +
                         "FROM notifications WHERE user_id=? ORDER BY created_at DESC";

            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            // 4️)Store data in list
            while (rs.next())
            {
                Notification n = new Notification();
                n.setMessage(rs.getString("message"));
                n.setRead(rs.getBoolean("is_read"));
                n.setCreatedAt(rs.getTimestamp("created_at"));

                list.add(n);
            }

            // 5️)Mark notifications as read
            String updateSql = "UPDATE notifications SET is_read=TRUE WHERE user_id=?";
            ps = con.prepareStatement(updateSql);
            ps.setInt(1, userId);
            ps.executeUpdate();

            //6)Send list to JSP
            request.setAttribute("notifications", list);
            request.getRequestDispatcher("notifications.jsp") .forward(request, response);

        } 
        catch (Exception e) 
        {
            System.out.println(e);
            request.setAttribute("errorMessage", "Unable to load notifications");
            request.getRequestDispatcher("error.jsp")  .forward(request, response);
        }
    }
}
