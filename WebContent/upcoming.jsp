<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
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
	  <button class="btn btn-info btn-lg"><a href="latest.jsp"  style="color: white" >Latest Movies</a></button>
	  <button class="btn btn-info btn-lg"><a href="upcoming.jsp" style="color: white">Upcoming Movies</a></button>

	 
	  <%if(l!=null)
	  {
		  if(!l.contains(".com"))
		  {
			  %> <button class="btn btn-info btn-lg"><a href="adminhome.jsp" style="color: white">Admin Home</a></button> <% 
		  }
		  %>
	  	<div align=right><a href="Logout.jsp" style="color: white">Logout</a></div>
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
  </div>
</nav>
<font style="font-family:Times New Roman;"><h1><center>Upcoming Movies</center></h1></font>
<form  method="post">
  <table class="table table-active table-bordered" >
    <tbody>
    
      <tr>
        <td height="500" width="300">
		<center><img src="Venom-Poster-New_1200_1703_81_s.jpg" height="500" width="300"></img>
		</td>
        
         <td height="500" width="400"><center><img src="Thugs.jpg" height="500" width="300"></img>
         </td>
       
      </tr>
      <tr>
    <td height="500" width="400">
		<center><img src="aquaboy.jpg" height="500" width="300"></img></td>
        
	 <td height="500" width="400">
		<center><img src="elroyale.jpg" height="500" width="300"></img></td>
        
    </tr>
    
    <tr>
    <td height="500" width="400">
		<center><img src="andha.jpg" height="500" width="300"></img></td>
        
	 <td height="500" width="400">
		<center><img src="avengers.jpg" height="500" width="300"></img></td>
        
    </tr>
    </tbody>
    </table>
</form>

<div class="col-md-12" style="background-color:#4a148c">
<div class="footer">
  <h6><a href="#">About us</a></h6>
  <h6><a href="#">Privacy Policy</a></h6>
  <h6><a href="#">Purchase Policy</a></h6>
</div>
</div>
</body>
</html>
