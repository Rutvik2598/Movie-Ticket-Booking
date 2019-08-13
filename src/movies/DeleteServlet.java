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
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    	{
    		String mname=request.getParameter("mname");
    		String date=request.getParameter("sdate");
    		String time=request.getParameter("stime");
    		String tname=request.getParameter("tname");
    		String location=request.getParameter("location");
    		String screen=request.getParameter("sno");
    				
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
    			pr=con.prepareStatement("delete from shows where sh_date=? and sh_time=? and movie_name=? and th_name=? and location=? and screen_no=?");
    			System.out.println("as");
    			pr.setString(1,date);
    			pr.setString(2,time);
    			pr.setString(3,mname);
    			pr.setString(4,tname);
    			pr.setString(5,location);
    			pr.setString(6,screen);
    			System.out.println("as");
    			pr.executeUpdate();
    			System.out.println("as2");
    			response.sendRedirect("deletesuccess.jsp");
    		}
    		catch(Exception e)
    		{
    			System.out.println(e);
    		}
    	}

}
