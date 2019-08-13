<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="java.util.ArrayList" %> 
  <%@ page import="theatre.TheatreData" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Theatre list:</h1>
<%
	ArrayList<TheatreData> al=(ArrayList)session.getAttribute("tl");
	
%>

<table>
	<% 
		for(int i=0;i<al.size();i++)
		{
	%>	
		<tr>
			<td>
				<a href="movielist.jsp"><%= al.get(i).getName() %></a>
			</td>
			<td>
				<%= al.get(i).getLocation() %>	
			</td>
		</tr>
		<%
		}
		%>
</table>


</body>
</html>