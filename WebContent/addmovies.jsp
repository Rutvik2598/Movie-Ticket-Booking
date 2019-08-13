<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
.body1{background-color:#E6E6FA;}

#grad2 {
    
    background-color:#4a148c;
}

</style>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>Upcoming movies</title>

<meta charset="ISO-8859-1">
<title>AddMovies</title>
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
	 
	  <button class="btn btn-info btn-lg"><a href="addshows.jsp" style="color: white">Add Shows</a></button>
	  <button class="btn btn-info btn-lg"><a href="delshows.jsp"  style="color: white" >Delete shows</a></button>
	  <button class="btn btn-info btn-lg"><a href="updateshow.jsp"  style="color: white" >Update shows</a></button>

	 <% 
	 if(!l.contains(".com"))
	  {
		  %> <button class="btn btn-info btn-lg"><a href="adminhome.jsp" style="color: white">Admin Home</a></button> <% 
	  }
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
	<center>
	<form action="MovieServlet" method="post">
		<table>
			<tr>
				<td>
					Movie Name
				</td>
				
				<td>	
					<input type="text" name="mname" />
				</td>
				
			</tr>
			<tr>		
				<td>
					Release Date
				</td>
				<td>		
					<input type="text" name="rdate" />
				</td>
			</tr>
			<tr>
				<td>		
					Genre
				</td>	
				<td>
					<input type="text" name="genre" />
				</td>
			</tr>
			<tr>
				<td>
					Theatre Name
				</td>
				<td>
					<input type="text" name="tname" />
				</td>
			</tr>
			<tr>
				<td>
					Location
				</td>
				<td>
					<input type="text" name="location" />
				</td>
			</tr>
		</table>
		<input type="submit"/>	
	</form>
</center>
</body>
</html>