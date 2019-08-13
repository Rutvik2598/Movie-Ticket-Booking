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
<title>Book Tickets</title>
<style>
/* The container */
.container {
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
    position: absolute;
    top: 0;
    left: 0;
    height: 25px;
    width: 25px;
    background-color: #eee;
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
    content: "";
    position: absolute;
    display: none;
}



/* Style the checkmark/indicator */
.container .checkmark:after {
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
	rs=st.executeQuery("select * from tickets");
	while(rs.next())
	{
		i=Integer.parseInt(rs.getString(6));
		a[i]=1;
		//System.out.println(i);
	}
}
catch(Exception e)
{
	
}
%>
<center><h3>PLATINUM:200Rs<h3></center>
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
				<input type="checkbox" value= <%= " "+(j+(i*10)+1) %> onclick="check( <%=(j+(i*10)+1)%>)" disabled>
				<span class="checkmark"></span>&nbsp&nbsp&nbsp
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
				<input type="checkbox" value= <%= " "+(j+(i*10)+1) %> id="mycheck" >
				<span class="checkmark"></span>&nbsp&nbsp&nbsp
				
			</label>
		</td>
		<% 
			}
		}	
		if(i==2)
		{
			
			%>
			<script>check(6)</script>
			<center><h3>Gold:150Rs<h3></center>
			<%
		}
		
		else if(i==4)
		{
		%>
			<center><h3>Silver:100Rs<h3></center>
		<%
		}
	%>
	</tr>
	</table>
	</center>
	<%	
	}
%>
<center> <img src="screen.png"> </center>
<input type="submit" value="Confirm seats">
<button onclick="check1()" >bbbgb</button>
<p id="demo"></p>
<script type="text/javascript">
	int ar[61];
	int i=0;
	function check1()
	{
		ar[i]=document.getElementById("mycheck").value;
		document.getElementById("demo").innerHTML=ar[i++];
		document.write("ljguk.jb");
	}
</script>
<label class="container">
				<input type="checkbox"  disabled>
				<span class="checkmark"></span>
</label>
Are Booked Seats
</body>
</html>
