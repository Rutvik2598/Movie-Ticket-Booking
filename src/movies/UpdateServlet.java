package movies;

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
 * Servlet implementation class DeleteServlet
 */
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    	{
    		String mname=request.getParameter("mname");
    		String odate=request.getParameter("osdate");
    		String ndate=request.getParameter("nsdate");
    		System.out.println(odate+ndate);
    		String otime=request.getParameter("ostime");
    		String ntime=request.getParameter("nstime");
    		String tname=request.getParameter("tname");
    		String location=request.getParameter("location");
    		String oscreen=request.getParameter("osno");
    		String nscreen=request.getParameter("nsno");
    				
    		Connection con=null;
    		Statement st=null;
    		ResultSet rs=null;
    		HttpSession session=request.getSession();
    		PreparedStatement pr=null;
    		try
    		{
    			Class.forName("com.mysql.jdbc.Driver");
    			con=DriverManager.getConnection("jdbc:mysql://localhost/moviedb?"+"user=root&password=root");
    			System.out.println("After Connection");
    			pr=con.prepareStatement("update shows set sh_date=?,sh_time=?,screen_no=? where movie_name=? and th_name=? and location=? and sh_date=? and sh_time=? and screen_no=?");
    			pr.setString(1,ndate);
    			pr.setString(2,ntime);
    			pr.setString(3,nscreen);
    			pr.setString(4,mname);
    			pr.setString(5,tname);
    			pr.setString(6,location);
    			pr.setString(7,odate);
    			pr.setString(8,otime);
    			pr.setString(9,oscreen);
    			pr.executeUpdate();
    			response.sendRedirect("updatesuccess.jsp");
    		}
    		catch(Exception e)
    		{
    			System.out.println(e);
    		}
    	}

}
