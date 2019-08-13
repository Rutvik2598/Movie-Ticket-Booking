package book;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;


public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
		{
			
			try
			{
				HttpSession session=request.getSession();
				String show=request.getParameter("showtime");
				System.out.println("Time is   "+show);
				ArrayList<String> t=(ArrayList)session.getAttribute("theatre");
				ArrayList<String> l=(ArrayList)session.getAttribute("location");
				//String l=(String)request.getParameter("l");
				int check=Integer.parseInt(request.getParameter("index"));
				Cookie showtime_ck=new Cookie("showtime_ck",show);
				response.addCookie(showtime_ck);
				String theatre=t.get(check);
				String location=l.get(check);
				System.out.println(theatre+location);
				Cookie th_name=new Cookie("th_name",theatre);
				response.addCookie(th_name);
				Cookie th_loc=new Cookie("th_loc",location);
				response.addCookie(th_loc);
				//System.out.println(show+l+t);
  				response.sendRedirect("seatselect.jsp");
				System.out.println(check);
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
			
		}
}
