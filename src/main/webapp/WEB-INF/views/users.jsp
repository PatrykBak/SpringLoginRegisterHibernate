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
<script type="text/javascript">
	function deleteUser(id) {
		id = id.split("_")[1];
		$.ajax({
			url : "${pageContext.request.contextPath}/deleteProduct",
			type : "post",
			data : "productId=" + id,
			success : function(response) {
				var table = document.getElementById("productTable");
				var tr = document.getElementById("tr_" + id);
				table.deleteRow(tr.rowIndex);
				alert(response);
			},
			error : function(error) {
				alert(error);
			}
		});
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
			<table class="table table-striped">
				<tr>
					<th>ID</th>
					<th>Username</th>
					<th>E-mail</th>
					<th>Delete user</th>
					<th>Edit user</th>
				</tr>
				<c:forEach items="${allUsers }" var="user">
					<tr id="tr_${user.id}">
						<td>${user.id }</td>
						<td>${user.username }</td>
						<td>${user.email }</td>
						<td><input type="button" class="btn btn-danger btn-xs"
							style="width: 90px" value="Delete" id="btn_${user.id }"
							onclick="deleteUser(this.id)"></input></td>
						<td><input type="button" class="btn btn-info btn-xs"
							style="width: 90px" value="Edit" id="btn_${user.id }"
							onclick="updateUser(this.id)"></input></td>
					</tr>
				</c:forEach>
			</table>
			<a class="btn btn-primary btn-block" href="<c:url value='/newuser' />">Add
				new user</a><a class="btn btn-warning btn-block"
				href="<c:url value='/admin' />">Back</a>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>