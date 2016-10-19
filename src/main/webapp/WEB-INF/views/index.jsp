<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome page</title>
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
<body>
	<div class="success">
		<h3>Index page for all.</h3>
		<br /> <a class="btn btn-large btn-primary"
			href="<c:url value="/login" />">Login</a> <a
			class="btn btn-large btn-info" href="<c:url value="/register" />">Register</a>
	</div>
</body>
</html>