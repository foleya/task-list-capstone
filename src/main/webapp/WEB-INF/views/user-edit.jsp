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
		<h1>Edit Bootcamp</h1>
		
		<!-- A form without an action submits back to the same URL, which is what we want here. -->
		<form method="post">
			<div class="form-group">
			    <label for="name">Name</label>
			    <input class="form-control" id="name" name="name" value="${ bootcamp.name }" required minlength="2" autocomplete="off">
			</div>
			<div class="form-group">
			    <label for="instructor">Instructor</label>
			    <input class="form-control" id="instructor" value="${ bootcamp.instructor }" name="instructor" required minlength="2">
			</div>
			<button type="submit" class="btn btn-primary">Save</button>
			<a href="/bootcamps/${ bootcamp.id }" class="btn btn-link">Cancel</a>
		</form>
	</main>
</body>
</html>