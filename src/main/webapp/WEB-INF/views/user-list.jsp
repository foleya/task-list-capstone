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
		<h1>Users</h1>
		
		<table class="table">
			<thead>
				<tr>
					<th>Things</th><th>Things</th><th>Things</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${ users }">
					<tr>
						<td><a href="/users/${ user.id }">${ user.name }</a></td>
						<td>${ user.instructor }</td>
						<td>${ bootcamp.students.size() }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<p>
			<a href="/bootcamps/add" class="btn btn-secondary">Add</a>
		</p>
	</main>
</body>
</html>