package test;
import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class BookAppointmentServlet
 */
@WebServlet("/BookAppointmentServlet")
public class BookAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public BookAppointmentServlet() {
      
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String service = request.getParameter("service");
		String date = request.getParameter("date");
		String time = request.getParameter("time");

		// DEBUG (check console)
		System.out.println(service + " " + date + " " + time);

		// set attributes
		request.setAttribute("service", service);
		request.setAttribute("date", date);
		request.setAttribute("time", time);

		RequestDispatcher rd = request.getRequestDispatcher("appointmentSuccess.jsp");
		rd.forward(request, response);
		
	}
	}


