package test;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class ShopLogin
 */
@WebServlet("/ShopLogin")
public class ShopLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		
		String user = request.getParameter("auser");
		String pass = request.getParameter("apass");
		
		try
		{
			Shop_Owner s = Shop_OwnerDao.getShopOwner(user);
			
			if (s != null && s.getPassword().equals(pass))
			 {
	                
	                HttpSession session = request.getSession();
		        	session.setAttribute("successMsg", "Welcome back, Admin!");
		        	response.sendRedirect("HomeOwner.html");
	         }else
	         {
	        	 request.setAttribute("error", "Invalid username or password");
	             request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
	             return;
	         }
		}catch(Exception e)
		{
			System.out.println(e);
			request.setAttribute("error", "Something went wrong. Please try again.");
            request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
		}
		
	}

}
