<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
</head>
<body>
<% 
	session.removeAttribute("login");
	session.invalidate();
%>
Logout Done Successfully
<% 
	response.sendRedirect("home.jsp");
%>
</body>
</html>