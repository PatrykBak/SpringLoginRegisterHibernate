<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>List of Users</title>
<link href="<c:url value='static/css/bootstrap.min.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='static/css/navbar.css' />" rel="stylesheet"></link>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Top of page</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="<c:url value="/index" />">Home</a></li>
						<li class="active"><a href="<c:url value="/logged" />">User</a></li>
						<li class="active"><a href="<c:url value="/admin" />">Admin</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="<c:url value="/logout" />">Logout</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="jumbotron">
			<table class="table table-striped">
				<tr>
					<th>ID</th>
					<th>Username</th>
					<th>E-mail</th>
					<th>Delete user</th>
					<th>Edit user</th>
				</tr>
				<c:forEach items="${allUsers }" var="user">
					<tr>
						<td>${user.id }</td>
						<td>${user.username }</td>
						<td>${user.email }</td>
						<td><a class="btn btn-danger btn-xs" style="width: 90px"
							href="<c:url value='/delete-${user.id}-user' />">Delete</a>
						<td><a class="btn btn-info btn-xs" style="width: 90px"
							href="<c:url value='/edit-${user.id}-user' />">Edit</a>
					</tr>
				</c:forEach>
			</table>
			<br /> <a class="btn btn-primary btn-block"
				href="<c:url value='/newuser' />">Add new user</a><a
				class="btn btn-warning btn-block" href="<c:url value='/admin' />">Back</a>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>