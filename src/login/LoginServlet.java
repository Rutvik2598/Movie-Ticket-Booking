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

import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
		{
			String email=request.getParameter("ei");
			String pw=request.getParameter("pw");
			HttpSession session=request.getSession();
			//session.setAttribute("login",null);
			int flag=0;
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			//HttpSession session=request.getSession();
			PreparedStatement pr=null;
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost/moviedb?"+"user=root&password=root");
				System.out.println("After Connection");
				st=con.createStatement();
				rs=st.executeQuery("Select * from customer");
				while(rs.next())
				{
					//System.out.println(rs.getString(1)+rs.getString(3)+email+pw);
					if(rs.getString(1).equals(email) && rs.getString(3).equals(pw))
					{
						session.setAttribute("login",email);
						flag=1;
						response.sendRedirect("home.jsp");
						break;
					}				
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
