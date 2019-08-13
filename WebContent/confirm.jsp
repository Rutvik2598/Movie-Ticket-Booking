<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.IOException"%>
<%@ page import= "java.sql.DriverManager"%>
<%@page  import ="java.sql.PreparedStatement"%>
<%@page import= "java.sql.ResultSet"%>
<%@page import ="java.sql.Statement"%>
<%@page import ="java.util.ArrayList"%>
<%@page import ="java.sql.Connection"%>
<%@page import ="javax.servlet.ServletException"%>
<%@page import ="javax.servlet.http.HttpServlet"%>
<%@page import ="javax.servlet.http.HttpServletRequest"%>
<%@page import ="javax.servlet.http.HttpServletResponse"%>
<%@page import ="javax.servlet.http.HttpSession"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
    
<!DOCTYPE html>
<html>
<head>
<style>
.body1{background-color:#E6E6FA;}

#grad2 {
    
    background-color:#4a148c;
}
.ticket
{
		background-image:url("ticket.jpg");
    	background-repeat: no-repeat;
        background-position: center;
        background-size:500px 225px; 
        background-color:#E6E6FA;
}
</style>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>Upcoming movies</title>

<meta charset="ISO-8859-1">
<title>Confirm</title>
</head>
<body class="body1">
<div>
	
</div>
<div id="grad2">
<nav class="navbar navbar-light">  <div class="container-fluid">
  	
      
	<font style="font-family:Algerian;"><h1><b><a href="home.jsp" style="color: white">TixFlix</a></b></h1></font>
	<h4 style="color:white;" >
	<%String l=(String)session.getAttribute("login");
		if(l!=null)
		{	
			out.print("Welcome "+l);
		}
		session.setAttribute("flag","0");
	%>
	</h4>
	<br>
	  <button class="btn btn-info btn-lg"><a href="home.jsp" class="active"  style="color: white">Home</a></button>
	 
	 <% 
	
	  %>
	  <%if(l!=null)
	  {
		  %>
	  	<div align=right><a href="Logout.jsp" style="color:white">Logout</a></div>
	  	<%
	  } 
	  else
	  {
		  %>
		  <ul class="nav navbar-nav navbar-right">
		  <li><a href="Register.jsp"><span class="glyphicon glyphicon-user"> Sign-up</a></span></li>
	  	  <li><a href="Login.jsp"><span class="glyphicon glyphicon-log-in"> Login</a></span></li>
	  	  </ul>
	  	  <% 
	  }
	  %>
	    </div>
  
</nav>
</div>
<%
String[] seats=request.getParameterValues("seats");
Connection con=null;
Statement st=null;
ResultSet rs=null;
PreparedStatement pr,pr1=null;
String movie_name=null;
String th_name=null;
String th_loc=null;
String show_date=null;
String show_time=null;
String email=null;
String screen=null;
int price=0,price1=0;
try
{
	
	Cookie cookies[]=request.getCookies();
	for(Cookie c: cookies)
	{
		if(c.getName().equals("th_name"))
		{
			th_name=c.getValue();
		}
		if(c.getName().equals("email_ck"))
		{
			email=c.getValue();
		}
		if(c.getName().equals("th_loc"))
		{
			th_loc=c.getValue();
		}
		if(c.getName().equals("ck1"))
		{
			movie_name=c.getValue();
		}
		if(c.getName().equals("datec"))
		{
			show_date=c.getValue();
			
		}
		if(c.getName().equals("showtime_ck"))
		{
			show_time=c.getValue();
		}
	}
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost/moviedb?"+"user=root&password=root");
	st=con.createStatement();
	for(int i=0;i<seats.length;i++)
	{	
		if(Integer.parseInt(seats[i])<=20)
		{
			price+=200;
			price1=200;
		}
		else if(Integer.parseInt(seats[i])>20 && Integer.parseInt(seats[i])<=40)
		{
			price+=180;
			price1=180;
		}
		
		else if(Integer.parseInt(seats[i])>40 && Integer.parseInt(seats[i])<=60)
		{
			price+=150;
			price1=150;
		}
		rs=st.executeQuery("select * from shows");
		while(rs.next())
		{
			if((rs.getString(4).equals(th_name)) && (rs.getString(3).equals(movie_name)) && (rs.getString(5).equals(th_loc)) && (rs.getString(1).equals(show_date)) && (rs.getString(2).equals(show_time)))
			{	
				screen=rs.getString(6);
			}	
		}		
		pr=con.prepareStatement("insert into tickets values(?,?,?,?,?,?,?,?)");
		pr.setString(1,th_name);
		pr.setString(2,th_loc);
		pr.setString(3,show_date);
		pr.setString(4,show_time);
		pr.setString(5,screen);
		pr.setString(6,seats[i]);
		pr.setInt(7,price1);
		pr.setString(8,email);
		pr.executeUpdate();
	}
}
catch(Exception e)
{
	System.out.println(e);
}
%>
<center><h1>Your Bookings</h1></center>
<div class="container">
<div class="ticket">
<br>
<br>
<center>
Movie Name:<% out.print(movie_name); %>
<br>
Theatre Name:<% out.print((String)th_name+" "+(String)th_loc); %>
<br>
Date:
<% out.print((String)show_date); %>
<br>
Time:
<% out.print((String)show_time); %>
<br>
Screen No:
<%
rs=st.executeQuery("select * from shows");
while(rs.next())
{
	if((rs.getString(4).equals(th_name)) && (rs.getString(3).equals(movie_name)) && (rs.getString(5).equals(th_loc)) && (rs.getString(1).equals(show_date)) && (rs.getString(2).equals(show_time)))
	{	
		out.print(rs.getString(6));
	}	
}
%>
<br>
Total Price:<% out.print(price); %>
<br>
Seats No:
<% 
if(seats!=null)
{
	for(int i=0;i<seats.length;i++)
	{
		out.print(seats[i]+" ");
	}
}
else
{
	%>
	<script>
		alert("Please select seats");
		window.location="seatselect.jsp";
	</script>
	<% 
}
%>
<br>
</center>
<br>
<br>
</div>
</div>
<br>
<br>
<center><button onclick="myFunction()">Print Your Ticket</button></center>

<script>
function myFunction() {
    window.print();
}
</script>
</body>
</html>