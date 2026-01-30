package test;
import java.io.IOException;

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
		String salon=request.getParameter("salon");
		String name=request.getParameter("customerName");
		String mobile=request.getParameter("mobile");
		String service=request.getParameter("service");
		String date=request.getParameter("date");
		String time=request.getParameter("time");
		
		response.setContentType("text/html");
		response.getWriter().println("<h2>Appointment Booked</h2>");
		response.getWriter().println("<br>Name: "+name);
		response.getWriter().println("<br>Service:"+service);
		
	}
	}


