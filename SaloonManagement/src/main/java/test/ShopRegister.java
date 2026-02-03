package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;

/**
 * Servlet implementation class ShopRegister
 */
@WebServlet("/ShopRegister")
public class ShopRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		String Shop_name = request.getParameter("shop_name");
		String Register_No = request.getParameter("register_no");
		String Owner_Name = request.getParameter("owner_name");
		Time Open_Time = Time.valueOf(request.getParameter("opening_time")+":00");
		Time Close_Time = Time.valueOf(request.getParameter("closing_time")+":00");
		String Email = request.getParameter("email");
		String Contact_no = request.getParameter("contact_no");
		String User = request.getParameter("auser");
		String Pass = request.getParameter("apass");
		
		Shop_Owner s = new Shop_Owner();
		s.setShop_name(Shop_name);
		s.setRegistration_no(Register_No);
		s.setOwner_name(Owner_Name);
		s.setOpening_time(Open_Time);
		s.setClosing_time(Close_Time);
		s.setEmail(Email);
		s.setContact_no(Contact_no);
		s.setUsername(User);
		s.setPassword(Pass);
		
		int status = Shop_OwnerDao.saveShopOwner(s);
		
		if(status > 0)
		{
			HttpSession session = request.getSession();
			session.setAttribute("successMsg", "Registration successful! 🎉 Please login");
			response.sendRedirect("adminLogin.jsp");
			return;

		}else
		{
			request.setAttribute("error", "Registration failed. Please check your inputs or try again.");
		    request.getRequestDispatcher("adminRegister.jsp").forward(request, response);
		}
		
		
	}

}
