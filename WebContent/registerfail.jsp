<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reigstration Failed</title>
</head>
<body>
	<%
		String errors=(String)session.getAttribute("errors");
		if(errors!=null)
		{
	%>
			<script>
				alert("<%out.print(errors);%>")
				window.location="Register.jsp";
			</script>
	<%		
		}
	%>
	

</body>
</html>