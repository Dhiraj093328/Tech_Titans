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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet 
{

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {

        // 1️)Get form data
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection con = DBConnection.getConnection()) 
        {

            // 2)SQL query
            String sql = "SELECT user_id FROM users WHERE email=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            // 3️)If user exists
            if (rs.next()) 
            {

                int userId = rs.getInt("user_id");

                // 4️)Create session
                HttpSession session = request.getSession();
                session.setAttribute("userId", userId);

                // 5️)Redirect to dashboard or profile
                response.sendRedirect("ProfileServlet");

            } 
            else 
            {
                // 6️)Login failed
                request.setAttribute("errorMessage", "Invalid Email or Password");
                request.getRequestDispatcher("login.jsp")
                       .forward(request, response);
            }

        } 
        catch (Exception e) 
        {
            System.out.println(e);
            request.setAttribute("errorMessage", "Server error");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
