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
 * Servlet implementation class TherapistLoginServlet
 */
@WebServlet("/TherapistLoginServlet")
public class TherapistLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TherapistLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);

		String username = request.getParameter("tuser");
		String password = request.getParameter("tpass");
		
		try
		{
			Therapist t = TherapistDao.getTherapist(username);
			
			if (t != null && t.getPassword().equals(password)) {

			    HttpSession session = request.getSession();
			    session.setAttribute("successMsg", "Login successful!, Welcome Therapist");
			    session.setAttribute("therapist", t);

			    response.sendRedirect("HomeTherapist.html");
			    return;
			} else {

			    request.setAttribute("error", "Invalid username or password");
			    request.getRequestDispatcher("therapistLogin.jsp")
			           .forward(request, response);
			}

		}catch(Exception e)
		{
			System.out.println(e);
			request.setAttribute("error", "Something went wrong. Please try again.");
            request.getRequestDispatcher("therapistLogin.jsp").forward(request, response);
		}
		
	}

}
