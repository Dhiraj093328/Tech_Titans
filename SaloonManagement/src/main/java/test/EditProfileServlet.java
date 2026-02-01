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

@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get existing session (do NOT create new)
        HttpSession session = request.getSession(false);

        // Login check
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                     "SELECT name, email, phone, address FROM users WHERE user_id=?")) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));

                // Send user object to JSP
                request.setAttribute("user", user);

                // Forward to edit profile page
                request.getRequestDispatcher("editProfile.jsp")
                       .forward(request, response);

            } else {
                request.setAttribute("errorMessage", "User not found");
                request.getRequestDispatcher("error.jsp")
                       .forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unable to load profile");
            request.getRequestDispatcher("error.jsp")
                   .forward(request, response);
        }
    }
}
