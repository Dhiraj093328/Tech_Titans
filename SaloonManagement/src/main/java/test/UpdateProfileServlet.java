package test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import test.DBConnection;
import test.DBConnection;
import test.DBConnection;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {

        // 1️)Get session
        HttpSession session = request.getSession(false);

        // If session expired
        if (session == null || session.getAttribute("userId") == null) 
        {
            response.sendRedirect("login.jsp");
            return;
        }

        // 2️)Get userId from session
        int userId = (int) session.getAttribute("userId");

        // 3️)Read form data
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        Connection con = null;
        PreparedStatement ps = null;

        try 
        {
            // 4️)DB connection
            Connection con1 = DBConnection.getConnection();

            // 5️)SQL update query
            String sql = "UPDATE users SET name=?, phone=?, address=? WHERE user_id=?";
            ps = con1.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, address);
            ps.setInt(4, userId);

            // 6️)Execute update
            int rows = ps.executeUpdate();

            if (rows > 0) 
            {
                // 7️)Redirect back to profile page
                response.sendRedirect("ProfileServlet");
            } 
            else 
            {
                request.setAttribute("errorMessage", "Profile update failed");
                request.getRequestDispatcher("error.jsp") .forward(request, response);
            }

        } 
        catch (Exception e) 
        {
            System.out.println(e);
            request.setAttribute("errorMessage", "Error updating profile");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
