package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class TherapistRegisterServlet
 */
@WebServlet("/TherapistRegisterServlet")
public class TherapistRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TherapistRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		String name = request.getParameter("tname");
		String email = request.getParameter("tmail");
		String contact = request.getParameter("tcontact");
		String user = request.getParameter("tuser");
		String pass = request.getParameter("tpass");
		
		Therapist t = new Therapist();
		t.setName(name);
		t.setEmail(email);
		t.setContact(contact);
		t.setUsername(user);
		t.setPassword(pass);
		
		int status = TherapistDao.SaveTherapist(t);
		
		if(status > 0)
		{
			HttpSession session = request.getSession();
			session.setAttribute("successMsg", "Registration successful! 🎉 Please login");
			response.sendRedirect("therapistLogin.jsp");
			return;
		}
		else
		{
			request.setAttribute("error", "Registration failed. Please check your inputs or try again.");
		    request.getRequestDispatcher("therapistRegister.jsp").forward(request, response);
		}
		pw.close();
		
	}

}
