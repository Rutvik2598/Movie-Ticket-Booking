<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.ArrayList" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="./dismovieserv" method="post">
<input type="submit">
</form>
<h1>Theatre list:</h1>
<%ArrayList AL1=(ArrayList)session.getAttribute("tl1");
ArrayList AL2=(ArrayList)session.getAttribute("tl2");
  
%>
<%=AL1%>
<%=AL2%>
</body>
</html>