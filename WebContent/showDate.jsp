<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Showing date</title>
    </head>
    <body>
        <p>
            The chosen date is <%= request.getParameter("selDate") %>
        </p>
    </body>
</html>