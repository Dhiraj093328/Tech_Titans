package test;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.sendRedirect("userRegister.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Name: " + req.getParameter("name"));
		System.out.println("Email: " + req.getParameter("email"));
		System.out.println("Contact: " + req.getParameter("contact_no"));
		System.out.println("Username: " + req.getParameter("username"));
		System.out.println("Password: " + req.getParameter("password"));
		User user = new User();
        user.setName(req.getParameter("name"));
        user.setEmail(req.getParameter("email"));
        user.setContactNo(req.getParameter("contact_no"));

        user.setUsername(req.getParameter("username"));
        user.setPassword(req.getParameter("password"));

        UserDAO dao = new UserDAO();
        boolean success = dao.registerUser(user);

        if (success) {
            resp.sendRedirect("userLogin.jsp");
        } else {
            resp.sendRedirect("userRegister.jsp");
        }
	}

}
