package register;


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

import validate.Validation;
public class RegisterServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{	
		String name=request.getParameter("name");
		String email=request.getParameter("ei");
		String pw=request.getParameter("pw");
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		HttpSession session=request.getSession();
		StringBuffer errors=ValidateData(name,email,pw);
		if(errors.length()==0)
		{	
			System.out.println("Success");
			
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost/moviedb?"+"user=root&password=root");
				System.out.println("After Connection");
				st=con.createStatement();
				//System.out.println(email+" "+name+" "+pw);
				PreparedStatement pr=con.prepareStatement("insert into customer values(?,?,?)");
				pr.setString(1,email);
				pr.setString(2,name);
				pr.setString(3,pw);
				pr.executeUpdate();
				response.sendRedirect("register_success.jsp");
			}
			catch(MySQLIntegrityConstraintViolationException v)
			{
				session.setAttribute("flag","1");
				try 
				{
					response.sendRedirect("registeralert.jsp");
				}
				catch (IOException e) 
				{	
					e.printStackTrace();
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}	
		else
		{
			session.setAttribute("errors",errors.toString());
			response.sendRedirect("registerfail.jsp");
		}
		
	}
    
    StringBuffer ValidateData(String name,String email,String pw)
    {
        
        Validation vf=new Validation();
        StringBuffer errors=new StringBuffer();
        System.out.println("In validate");
        if(vf.nameValidator(name)==false)
        {
            errors.append("Invalid Username");
            System.out.println("Name");
        }
        if(vf.useridValidator(email)==false)
        {
        	 errors.append("Invalid email");
        	 System.out.println("email");
        }
        if(vf.pswdValidator(pw)==false)
        {
        	 errors.append("Invalid password");
        	 System.out.println("password");
        }
        System.out.println("after validation");
        return errors;
    }


}