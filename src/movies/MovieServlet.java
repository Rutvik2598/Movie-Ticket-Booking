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
 * Servlet implementation class MovieServlet
 */
public class MovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String mname=request.getParameter("mname");
		String date=request.getParameter("rdate");
		String genre=request.getParameter("genre");
		String tname=request.getParameter("tname");
		String location=request.getParameter("location");
				
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
			pr=con.prepareStatement("insert into movie_list values(?,?,?,?,?)");
			pr.setString(1,mname);
			pr.setString(2,tname);
			pr.setString(3,location);
			pr.setString(4,date);
			pr.setString(5,genre);
			pr.executeUpdate();
			response.sendRedirect("addmovies.jsp");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
