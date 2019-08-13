package login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginAdminServlet
 */
public class LoginAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String email=request.getParameter("ei");
		String pw=request.getParameter("pw");
		HttpSession session=request.getSession();
		//session.setAttribute("login",null);
		int flag=0;
		try
		{
			
				if(("Rutvik").equals(email) && ("rutvik123").equals(pw))
				{
					session.setAttribute("login",email);
					flag=1;
					response.sendRedirect("adminhome.jsp");
				}
				if(("Sanket").equals(email) && ("sanket123").equals(pw))
				{
					session.setAttribute("login",email);
					flag=1;
					response.sendRedirect("adminhome.jsp");
				}
				if(("Vishal").equals(email) && ("vishal123").equals(pw))
				{
					session.setAttribute("login",email);
					flag=1;
					response.sendRedirect("adminhome.jsp");
				}
				if(("Rajat").equals(email) && ("rajat123").equals(pw))
				{
					session.setAttribute("login",email);
					flag=1;
					response.sendRedirect("adminhome.jsp");
				}
			if(flag==0)
			{
				response.sendRedirect("loginfail.jsp");
			}
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
