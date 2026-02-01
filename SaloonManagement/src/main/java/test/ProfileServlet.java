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

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet 
{

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {

        HttpSession session = request.getSession(false);

        //if (session == null || session.getAttribute("userId") == null) 
        //{
          //  response.sendRedirect("login.jsp");
          //  return;
        //}

        int userId = (int) session.getAttribute("userId");

        try (Connection con = DBConnection.getConnection()) 
        {

            String sql = "SELECT name, email, phone, address FROM users WHERE user_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) 
            {
                User user = new User();
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));

                request.setAttribute("user", user);
                request.getRequestDispatcher("profile.jsp") .forward(request, response);
            } 
            else 
            {
                request.setAttribute("errorMessage", "User profile not found");
                request.getRequestDispatcher("error.jsp") .forward(request, response);
            }

        } 
        catch (Exception e) 
        {
            System.out.println(e);
            request.setAttribute("errorMessage", "Unable to load profile");
            request.getRequestDispatcher("error.jsp") .forward(request, response);
        }
    }
}
