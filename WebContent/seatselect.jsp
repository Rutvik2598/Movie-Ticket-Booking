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
<!DOCTYPE html>
<html>
<head>
</head>
<style>
/* The container */
body
{
	background-color:#E6E6FA;
}
.container {
	border-radius: .25em;
    display: block;
    position: relative;
    padding-left: 35px;
    margin-bottom: 12px;
    cursor: pointer;
    font-size: 22px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

/* Hide the browser's default checkbox */
.container input {
	
    position: absolute;
    opacity: 0;
    cursor: pointer;
}

/* Create a custom checkbox */
.checkmark {
border-radius: .25em;
    position: absolute;
    top: 0;
    left: 0;
    height: 25px;
    width: 25px;
    background-color:#ccc;
}

.checkmark1 {
border-radius: .25em;
    position: absolute;
    top: 0;
    left: 0;
    height: 25px;
    width: 25px;
    background-color:#6B6761;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
    background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
    background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
border-radius: .25em;
	background-color:#FF0000;
    content: "";
    position: absolute;
    display: none;
}



/* Style the checkmark/indicator */
.container .checkmark:after {
border-radius: .25em;
	background-color:#FF0000
    left: 9px;
    top: 5px;
    width: 5px;
    height: 10px;
    border: solid white;
    border-width: 0 3px 3px 0;
    -webkit-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
}
</style>
<body>
<%
Connection con=null;
Statement st=null;
ResultSet rs=null;
PreparedStatement pr=null;
int a[]=new int[61];
int i=0;
try
{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost/moviedb?"+"user=root&password=root");
	System.out.println("After Connection");
	st=con.createStatement();
	String movie_name=null;
	String th_name=null;
	String th_loc=null;
	String show_date=null;
	String show_time=null;
	String email=null;
	int price=0;
	Cookie c[]=request.getCookies();
	
	for(int k=0;k<c.length;k++)
	{
		if(c[k].getName().equals("th_name"))
		{
			th_name=(String)c[k].getValue();
			System.out.println("cookie name"+th_name);
		}
		
		if(c[k].getName().equals("th_loc"))
		{
			th_loc=(String)c[k].getValue();
			System.out.println("cookie name"+th_loc);
		}
		
		if(c[k].getName().equals("datec"))
		{
			show_date=(String)c[k].getValue();
			System.out.println("cookie name"+show_date);
		}
		if(c[k].getName().equals("showtime_ck"))
		{
			show_time=(String)c[k].getValue();
			System.out.println("cookie name"+show_time);
		}
	}	
		rs=st.executeQuery("select * from tickets ");
		while(rs.next())
		{
			System.out.println(rs.getString(1)+" "+th_name+" "+rs.getString(2)+" "+th_loc+" "+rs.getString(3)+" "+show_date+" "+rs.getString(4)+" "+show_time);
			if((rs.getString(1).equals(th_name)) && (rs.getString(2).equals(th_loc)) && (rs.getString(3).equals(show_date)) && (rs.getString(4).equals(show_time)))
			{	
				System.out.println("Matched");
				i=Integer.parseInt(rs.getString(6));
				a[i]=1;
				System.out.println("in while after 1");
				//System.out.println(i);
			}	
		}
		for(int j=0;j<60;j++)
		{
			System.out.println(a[j]);
		}
	
}
catch(Exception e)
{
	System.out.print(e);	
}
%>
<center><h3>PLATINUM:200Rs<h3></center>
<form method="post" action="confirm.jsp">
<%
	for(i=0;i<6;i++)
	{
	%>	
		<center>
		<table>
		<tr>
		<%
		for(int j=0;j<10;j++)
		{
			if(a[j+(i*10)+1]==1)
			{	
%>		
		<td>
			<label class="container">
				<input type="checkbox"  value= <%= " "+(j+(i*10)+1) %> disabled>
				<span  class="checkmark1"></span>&nbsp&nbsp&nbsp
			</label>
		</td>
		<% 
		//onclick="check( <%=(j+(i*10)+1)%z>)"
			}	
			if(a[j+(i*10)+1]==0)
			{			 
		%>		
			<td>
			<label class="container">
				<input type="checkbox" value= <%= " "+(j+(i*10)+1) %> name="seats" id="mycheck" >
				<span class="checkmark"></span>&nbsp&nbsp&nbsp
				
			</label>
		</td>
		<% 
			}
		}	
		if(i==2)
		{
			
			%>
			<center><h3>Gold:180Rs<h3></center>
			<%
		}
		
		else if(i==4)
		{
		%>
			<center><h3>Silver:150Rs<h3></center>
		<%
		}
	%>
	</tr>
	</table>
	</center>
	<%	
	}
%>
<center> <h2 font-family: "Times New Roman">Screen This Way</h2> </center>
<br>
<center>
<input type="submit" class="btn btn-primary" value="Confirm seats"></center>
</form>
<label class="container">
				<input type="checkbox"  disabled>
				<span class="checkmark1"></span>
</label>
<br>
Are Booked Seats
<br>


</body>
</html>
