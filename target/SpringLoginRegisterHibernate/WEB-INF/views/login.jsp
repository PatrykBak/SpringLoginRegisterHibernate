<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login page</title>
<link href="<c:url value='static/css/bootstrap.min.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='static/css/navbar.css' />" rel="stylesheet"></link>
<script type="text/javascript">
	function dovalidations() {
		$("#result").text("");
		var username = document.getElementById("username").value;
		if (parseInt(username.length) < 4) {
			$("#result").text("Username must be at least 4 chars");
			return false;
		}
		var password = document.getElementById("password").value;
		if (parseInt(password.length) < 4) {
			$("#result").text('Password must be at least 4 chars');
			return false;
		}
		return true;
	}
</script>
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
						<li><a href="<c:url value="/index" />">Back</a></li>
					</ul>
				</div>
			</div>
		</nav>

		<div class="jumbotron">
			<c:url var="loginUrl" value="/login" />
			<form action="${loginUrl}" method="post" class="form-horizontal"
				onsubmit="return dovalidations()">
				<c:if
					test="${not empty sessionScope.SPRING_SECURITY_LAST_EXCEPTION}">
					<div class="alert alert-danger">
						<p>Invalid username and password.</p>
					</div>
				</c:if>
				<c:if test="${param.logout != null}">
					<div class="alert alert-success">
						<p>You have been logged out successfully.</p>
					</div>
				</c:if>
				<p id='result'></p>
				<div class="form-group">
					<label for="inputUsername" class="col-sm-2 control-label">Username</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="username" name="username"
							placeholder="Enter Username" required>
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="password"
							name="password" placeholder="Enter Password" required>
					</div>
				</div>

				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />

				<div class="span7 text-center">
					<div class="form-actions">
						<input type="submit" class="btn btn-primary btn-default"
							value="Log in">
					</div>
				</div>
			</form>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>