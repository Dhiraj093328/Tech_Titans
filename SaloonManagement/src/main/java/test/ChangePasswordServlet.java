package test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet 
{

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {

        // 1️)Get session
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) 
        {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        // 2️)Read form values
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try 
        {
            //3)DB connection
            con = DBConnection.getConnection();

            //4)Verify old password
            String checkSql = "SELECT password FROM users WHERE user_id=?";
            ps = con.prepareStatement(checkSql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            if (rs.next()) 
            {
                String dbPassword = rs.getString("password");

                // 5️)Compare old password
                if (dbPassword.equals(oldPassword)) 
                {

                    // 6️)Update new password
                    String updateSql = "UPDATE users SET password=? WHERE user_id=?";
                    ps = con.prepareStatement(updateSql);
                    ps.setString(1, newPassword);
                    ps.setInt(2, userId);
                    ps.executeUpdate();

                    // 7️)Redirect to profile
                    response.sendRedirect("ProfileServlet");

                } 
                else 
                {
                    request.setAttribute("errorMessage", "Old password is incorrect");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            }

        } 
        catch (Exception e) 
        {
            System.out.println(e);
            request.setAttribute("errorMessage", "Error changing password");
            request.getRequestDispatcher("error.jsp") .forward(request, response);
        }
    }
}
