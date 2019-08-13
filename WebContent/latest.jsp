<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>

.SELECT1 
	{
    	background-color: #f44336; /* Green */
    	border-radius: 8px;
    	color: white;
    	padding: 7px 10px;
    	text-align: center;
   		text-decoration: none;
    	display: inline-block;
    	font-size: 16px;
    	margin-right:40px;
    	margin-left:16px;
	}


#grad2 {
    
    background-color:#4a148c;
}
.body1{background-color:#E6E6FA;}
</style>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Latest Movies</title>
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
</nav>
</div>
<font style="font-family:Times New Roman;"><h1><center>Latest Movies</center></h1></font>


<form action="TheatreServlet" method="post">
<center>
Date:
  <select class="SELECT1" name="dateselect">
    
  		<option value="a">Fri 05/10</option>
  		<option value="b">Sat 06/10</option>
  		<option value="c">Sun 07/10</option>
  		<option value="d">Mon 08/10</option>
	</select>
</center>
  
  <table class="table table-active table-bordered" >
    <tbody>
    
      <tr>
        <td height="500" width="300">
		<center><img src="Sui.jpg" height="500" width="300"></img><br><input type="submit" class="btn btn-warning" value="Book Sui Dhaga" name="a"></center></td>
         <td height="500" width="400"><center><img src="manto.jpg" height="500" width="300"></img><br><input type="submit" class="btn btn-warning" value="Book Manto" name="a"></center></td>
      </tr>
      <tr>
    <td height="500" width="400">
		<center><img src="JE.jpg" height="500" width="300"></img><br><input type="submit" class="btn btn-warning" value="Book Johnny English 3" name="a" ></center></td>
	 <td height="500" width="400">
		<center><img src="nun.jpg" height="500" width="300"></img><br><input type="submit" class="btn btn-warning" value="Book The Nun" name="a"></center></td>
        
    </tr>
    
    <tr>
    <td height="500" width="400">
		<center><img src="Bgmc.jpg" height="500" width="300"></img><br><input type="submit" class="btn btn-warning" value="Book Batti Gul Meter Chalu" name="a"></center></td>
        
	 <td height="500" width="400">
		<center><img src="manmarziyaan.jpg " height="500" width="300"></img><br><input type="submit" class="btn btn-warning" value="Book Manmarziyaan" name="a"></center></td>
        
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
