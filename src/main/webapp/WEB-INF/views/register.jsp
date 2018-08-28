<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Register</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="custom.css">
</head>
<body>
	<div class="container" style="max-width: 400px">
		<form method="post">
			<h1>Register</h1>
	 		<div class="form-row">
		  		<div class="form-group col-md-6">
	    			<label for="InputFirstName">First Name</label>
	    			<input type="text" required minlength="2" name="firstName" id="InputFirstName" class="form-control" placeholder="First Name">
	  			</div>
	  			
	  			<div class="form-group col-md-6">
	    			<label for="InputLastName">Last Name</label>
	    			<input type="text" required name="lastName" id="InputLastName" class="form-control" placeholder="Last Name">
	  			</div>
	  			
  			</div>
	  		
	  		<div class="form-group">
    			<label for="InputEmail">Email address</label>
    			<input type="email" name="emailAddress" required class="form-control" id="InputEmail" placeholder="Enter email">
  			</div>
  			
  			<!-- <div class="form-group">
    			<label for="InputEmail">Email address</label>
    			<input type="email" name="verifyEmail" required class="form-control" id="InputEmail" placeholder="Verify email">
  			</div> -->
  			
	  		<div class="form-group">
    			<label for="InputPassword">Password</label>
    			<input type="password" required name="password" id="InputPassword" class="form-control" placeholder="Enter password">
  			</div>
  			
  			<div class="form-group">
    			<label for="InputConfirmPassword">Confirm Password</label>
    			<input type="password" required name="confirmPassword" id="InputConfirmPassword" class="form-control" placeholder="Confirm password">
  			</div>
  			
  			<!-- <div class="form-group">
    			<label for="InputVerifyPassword">Confirm Password</label>
    			<input type="password" name="verifyPassword" required id="verifyPassword" class="form-control" placeholder="Verify password">
  			</div> -->

	  		<p class="message">${ message }</p>
			<button class="btn btn-primary btn-lg btn-block">Submit!</button>
		</form>
		<a href="/register" class="btn btn-danger text-white btn-sm my-2 btn-block">Clear Form</a>
		<a href="/login" class="btn btn-secondary text-white btn-sm my-2 btn-block">Or Log In!</a>
	</div>
</body>
</html>