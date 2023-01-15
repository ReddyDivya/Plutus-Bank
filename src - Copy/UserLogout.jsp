<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII" %>

	<html>

	<head>
		<title>Logout</title>
	</head>

	<body>
		<% session=request.getSession(false); if(session !=null) { session.invalidate(); }
			response.sendRedirect("Home.jsp"); %>
	</body>

	</html>