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
		<h1>Task: ${ task.description }</h1>
		
		<div class="form-group row">
		    <label for="user" class="col-sm-2 col-form-label">User:</label>
		    <div class="col-sm-10 mt-2" id="user">${ task.user.name }</div>
		</div>
		
		<div class="form-group row">
		    <label for="description" class="col-sm-2 col-form-label">Description:</label>
		    <div class="col-sm-10 mt-2" id="description">${ task.description }</div>
		</div>
		
		<div class="form-group row">
		    <label for="description" class="col-sm-2 col-form-label">Due Date:</label>
		    <div class="col-sm-10 mt-2" id="due-date">${ task.dueDate }</div>
		</div>
		
		<div class="form-group row">
		    <label for="user" class="col-sm-2 col-form-label">Complete:</label>
		    <div class="col-sm-10 mt-2" id="complete">${ task.complete ? '&#10004' : '&#10060' }</div>
		</div>
		
		<a href="/tasks/${ task.id }/edit" class="btn btn-secondary">Edit</a>
		<a href="/tasks/${ task.id }/delete" class="btn btn-danger ml-2"
		   onclick="return confirm('Are you sure you want to delete this?')">Delete</a>
		<a href="/tasks" class="btn btn-link ml-2">Back</a>
		
		<%-- <h3 class="mt-4">Applications</h3>
		<table class="table">
			<thead>
				<tr>
					<th>Company</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="employer" items="${ student.applications }">
					<tr>
						<td><a href="/employers/${ employer.id }">${ employer.name }</a></td>
						<td><a href="/students/${student.id}/remove-application?employerId=${ employer.id }">Remove</a>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<form class="form-inline" action="/students/${ student.id }/add-application">
		  <label class="sr-only" for="application-employer">Name</label>
			<select class="form-control mb-2 mr-sm-2" id="application-employer" name="employerId">
		    	<option value="">- Select Employer -</option>
		    	<c:forEach var="employer" items="${ employers }">
		    		<option value="${ employer.id }">${ employer.name }</option>
		    	</c:forEach>
		    </select>
		
		  <button type="submit" class="btn btn-primary mb-2">Add Application</button>
		</form> --%>
	</main>
</body>
</html>