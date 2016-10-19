<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AccessDenied page</title>
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
<body>
	<h3>${user},you are not authorized to access this page.</h3>
	<br />
	<a class="btn btn-large btn-primary" href="<c:url value="/index" />">
		Go to index</a>
	<sec:authorize access="hasRole('USER') or hasRole('ADMIN')">
		<a class="btn btn-large btn-danger" href="<c:url value="/logout" />">Logout</a>
	</sec:authorize>
</body>
</html>