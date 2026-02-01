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
public class ChangePasswordServlet extends HttpServlet {

    // 🔹 LOAD CHANGE PASSWORD PAGE
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        request.getRequestDispatcher("changePassword.jsp")
               .forward(request, response);
    }

    // 🔹 UPDATE PASSWORD
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");

        try (Connection con = DBConnection.getConnection()) {

            // 1️⃣ Verify old password
            PreparedStatement ps = con.prepareStatement(
                "SELECT password FROM users WHERE user_id=?"
            );
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String dbPassword = rs.getString("password");

                if (!dbPassword.equals(oldPassword)) {
                    request.setAttribute("errorMessage", "Old password is incorrect");
                    request.getRequestDispatcher("changePassword.jsp")
                           .forward(request, response);
                    return;
                }
            }

            // 2️⃣ Update new password
            PreparedStatement updatePs = con.prepareStatement(
                "UPDATE users SET password=? WHERE user_id=?"
            );
            updatePs.setString(1, newPassword);
            updatePs.setInt(2, userId);
            updatePs.executeUpdate();

            // 3️⃣ Redirect with success flag
            response.sendRedirect("ProfileServlet?password=changed");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unable to change password");
            request.getRequestDispatcher("changePassword.jsp")
                   .forward(request, response);
        }
    }
}
