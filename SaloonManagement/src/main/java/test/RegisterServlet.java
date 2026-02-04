package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegisterServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect to registration page if accessed via GET
        response.sendRedirect(request.getContextPath() + "userRegister.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve parameters and trim whitespace
        String name = request.getParameter("name").trim();
        String email = request.getParameter("email").trim();
        String contactNo = request.getParameter("contact_no").trim();
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();

        // Debugging (optional)
        System.out.println("Registering User:");
        System.out.println("Name: " + name);
        System.out.println("Email: " + email);
        System.out.println("Contact: " + contactNo);
        System.out.println("Username: " + username);
        System.out.println("Password: " + password);

        // Create User object
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setContactNo(contactNo);
        user.setUsername(username);
        user.setPassword(password); // For production, hash the password here

        // Save user using DAO
        UserDAO dao = new UserDAO();
        boolean success = dao.registerUser(user);

        // Redirect based on result
        if (success) {
            response.sendRedirect(request.getContextPath() + "userLogin.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "userRegister.jsp");
        }
    }
}
