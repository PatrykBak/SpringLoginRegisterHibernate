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
	function dovalidations() {
		$("#result").text("");
		var username = document.getElementById("author").value;
		if (parseInt(username.length) < 1) {
			$("#result").text("Author cant be blank");
			return false;
		}
		var password = document.getElementById("title").value;
		if (parseInt(password.length) < 1) {
			$("#result").text("Title cant be blank");
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
				<h2>Add new book</h2>
				<br>
				<p id='result'></p>
				<form:form method="POST" modelAttribute="book"
					class="form-horizontal" onsubmit="return dovalidations()">
					<form:input type="hidden" path="id" id="id" />

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="author">Author</label>
							<div class="col-md-7">
								<form:input type="text" path="author" id="author"
									class="form-control input-sm" />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="title">Title</label>
							<div class="col-md-7">
								<form:input type="text" path="title" id="title"
									class="form-control input-sm" />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="available">Available</label>
							<div class="col-md-7">
								<form:select class="form-control" path="available"
									id="available">
									<option value="TRUE">TRUE</option>
									<option value="FALSE">FALSE</option>
								</form:select>
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
									<a class="btn btn-primary" href="<c:url value='/books' />">Back</a>
								</c:when>
								<c:otherwise>
									<input class="btn btn-info" type="submit" value="Add book" />
									<a class="btn btn-primary" href="<c:url value='/books' />">Back</a>
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