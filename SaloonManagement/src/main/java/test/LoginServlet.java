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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection con = DBConnection.getConnection();
        		PreparedStatement ps = con.prepareStatement("SELECT user_id, name FROM users WHERE email=? AND password=?")) 
        {

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) 
            {

                int userId = rs.getInt("user_id");
                String userName = rs.getString("name");   //FETCH NAME

                // Create session
                HttpSession session = request.getSession();
                session.setAttribute("userId", userId);
                session.setAttribute("userName", userName); //STORE NAME

                // Redirect to DashboardServlet
                response.sendRedirect("DashboardServlet");

            } 
            else 
            {
                request.setAttribute("errorMessage", "Invalid email or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } 
        catch (Exception e)
        {
            System.out.println(e);
            request.setAttribute("errorMessage", "Something went wrong");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
