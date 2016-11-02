<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>New User form</title>
<link href="<c:url value='static/css/bootstrap.min.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='static/css/navbar.css' />" rel="stylesheet"></link>
<script type="text/javascript">
	function validateEmail(email) {
		var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		return re.test(email);
	}
	function dovalidations() {
		$("#result").text("");
		var username = document.getElementById("username").value;
		if (parseInt(username.length) < 4) {
			$("#result").text("Username must be at least 4 chars");
			return false;
		}
		var password = document.getElementById("password").value;
		if (parseInt(password.length) < 4) {
			$("#result").text("Password must be at least 4 chars");
			return false;
		}

		var email = document.getElementById("email").value;
		if (validateEmail(email)) {
		} else {
			$("#result").text(email + " is not valid e-mail");
			return false;
		}

		var roles = document.getElementById("roles").value;
		if (roles == "") {
			$("#result").text("Select one role.");
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
						<li><a href="<c:url value="/logout" />">Logout</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="jumbotron">
			<div class="form-container">
				<h2>Add New User</h2>
				<br>
				<p id='result'></p>
				<form:form method="POST" modelAttribute="user"
					class="form-horizontal" onsubmit="return dovalidations()">
					<form:input type="hidden" path="id" id="id" />

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="username">Username</label>
							<div class="col-md-7">
								<form:input type="text" path="username" id="username"
									class="form-control input-sm" />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="password">Password</label>
							<div class="col-md-7">
								<form:input type="password" path="password" id="password"
									class="form-control input-sm" />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="email">Email</label>
							<div class="col-md-7">
								<form:input type="text" path="email" id="email"
									class="form-control input-sm" />
							</div>
						</div>
					</div>


					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="userProfiles">Roles</label>
							<div class="col-md-7">
								<form:select class="form-control" path="userProfiles"
									items="${roles}" multiple="false" itemValue="id"
									itemLabel="type" id="roles" />
							</div>
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="row">
						<div class="form-actions floatRight">
							<c:choose>
								<c:when test="${edit}">
									<input class="btn btn-info" type="submit" value="Update" />
									<a class="btn btn-primary" href="<c:url value='/users' />">Back</a>
								</c:when>
								<c:otherwise>
									<input class="btn btn-info" type="submit" value="Add user" />
									<a class="btn btn-primary" href="<c:url value='/users' />">Back</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>