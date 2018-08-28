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
		<h1>Bootcamp: ${ bootcamp.name }</h1>
		
		<div class="form-group row">
		    <label for="name" class="col-sm-2 col-form-label">Name</label>
		    <div class="col-sm-10 mt-2" id="name">${ bootcamp.name }</div>
		</div>
		<div class="form-group row">
		    <label for="instructor" class="col-sm-2 col-form-label">Instructor</label>
		    <div class="col-sm-10 mt-2" id="instructor">${ bootcamp.instructor }</div>
		</div>
		<a href="/bootcamps/${ bootcamp.id }/edit" class="btn btn-secondary">Edit</a>
		<a href="/bootcamps/${ bootcamp.id }/delete" class="btn btn-danger ml-2"
		   onclick="return confirm('Are you sure you want to delete this?')">Delete</a>
		<a href="/bootcamps" class="btn btn-link ml-2">Back</a>
		
		<h3 class="mt-4">Students</h3>
		<table class="table">
			<thead>
				<tr>
					<th>Name</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="student" items="${ bootcamp.students }">
					<tr>
						<td><a href="/students/${ student.id }">${ student.name }</a></td>
						<td><a href="/bootcamps/${bootcamp.id}/remove-student?studentId=${ student.id }">Remove</a>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>
</body>
</html>