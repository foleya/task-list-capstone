<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>${ title }</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!-- Custom CSS goes below Bootstrap CSS -->
<link rel="stylesheet" href="/style.css" />
</head>
<body>
	<main class="container">
		<%@include file="partials/header.jsp"%>
		<h1>Edit Task</h1>
		
		<!-- A form without an action submits back to the same URL, which is what we want here. -->
		<form method="post">
		
			<div class="form-group">
				<label for="user">User</label>
			    <input class="form-control" disabled id="user" value="${ user.firstName } ${ user.lastName }">
			</div>
			
			<div class="form-group">
			    <label for="name">Description</label>
			    <input class="form-control" id="description" name="description" required minlength="2" autocomplete="off" value="${ task.description }">
			</div>
			
			<div class="form-group">
			    <label for="name">Due Date</label>
			    <input class="form-control" type="date" id="due-date" name="dueDate" value="${ task.dueDate }" min="2000-01-01" max="2030-12-31">
			</div>
			
			<div class="form-group">
			    <label for="name">Complete</label>
			    <input type="checkbox" class="form-control" id="complete" name="complete" <c:if test="${ task.complete }">checked="checked"</c:if>>
			</div>
			
			<button type="submit" class="btn btn-primary">Save</button>
			<a href="/tasks/${ task.id }" class="btn btn-link">Cancel</a>
		</form>
		
	</main>
</body>
</html>