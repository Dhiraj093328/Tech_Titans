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

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get existing session
        HttpSession session = request.getSession(false);

        // Check login
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get logged-in user id
        int userId = (int) session.getAttribute("userId");

        // Get updated values from form
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "UPDATE users SET name=?, phone=?, address=? WHERE user_id=?")) {

            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, address);
            ps.setInt(4, userId);

            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated > 0) {
                // ✅ Success → redirect with flag
                response.sendRedirect("ProfileServlet?success=updated");
            } else {
                // ❌ No update happened
                response.sendRedirect("ProfileServlet?error=updateFailed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ProfileServlet?error=exception");
        }
    }
}
