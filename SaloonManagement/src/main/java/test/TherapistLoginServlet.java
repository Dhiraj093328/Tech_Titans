package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
		
		String username = request.getParameter("tuser");
		String password = request.getParameter("tpass");
		
		try
		{
			Therapist t = TherapistDao.getTherapist(username);
			
			if(t!=null && t.getPassword().equals(password))
			{
				pw.print("Login success");
			}else
			{
				pw.print("Login Fail");
			}
		}catch(Exception e)
		{
			System.out.println(e);
		}
		
	}

}
