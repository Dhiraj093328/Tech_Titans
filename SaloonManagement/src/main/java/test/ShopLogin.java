package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
		
		String user = request.getParameter("auser");
		String pass = request.getParameter("apass");
		
		try
		{
			Shop_Owner s = Shop_OwnerDao.getShopOwner(user);
			
			if(s!=null && s.getPassword().equals(pass))
			{
				pw.print("login success");
			}
			else
			{
				pw.print("login fails");
			}
		}catch(Exception e)
		{
			System.out.println(e);
		}
		
	}

}
