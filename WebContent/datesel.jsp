<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>jQuery DatePicker</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 		 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script>
            $(function () {
                $("#datepicker").datepicker();
                startDate:'2018-10-10'
                endDate:'2018-10-17'
            });
            
            
        </script>

    </head>
    <body>
        <form action="showDate.jsp">
            <label for="datepicker">Enter date:</label>
                <input type="text" name="selDate" id="datepicker">
            
            <input type="submit" value="Submit">
            
            
        </form>
        
        <div class="dropdown">
    		<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Select Date
   		 <span class="caret"></span></button>
    		<ul class="dropdown-menu">
      			<li><a href="#">Fri 05/10</a></li>
			     <li><a href="#">Sat 06/10</a></li>
			     <li><a href="#">Sun 07/10</a></li>
			     <li><a href="#">Mon 09/10</a></li>
			     <li><a href="#">Tue 10/10</a></li>
			     <li><a href="#">Wed 11/10</a></li>
			     <li><a href="#">Thur 12/10</a></li>
   			 </ul>
  		</div>
            
    </body>
</html>