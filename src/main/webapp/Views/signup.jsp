
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- Library bootstrap --%>
<%@include file="/views/bootstrap.jsp"%>
<link rel="shortcut icon" href="/ASM/public/images/logo.svg"
	type="image/x-icon">
<title>Fashion</title>
</head>
<body class="container-fluid font-monospace">
	<div class="row">
		<div class="align-self-center p-5 col-12 col-md-6">
			<a class="navbar-brand fw-bold fs-2" href="#">
				<img alt="logo" class="img-fluid" src="/ASM/public/images/logo.svg">
			</a> 
		</div>
		<div class="align-self-center p-5 col-12 col-md-6">
			<form action="/ASM/signup/create" method="post">
				<h1>Sign up</h1>
				<div class="bg-${ color }">
					<p class="text-white p-2">${ message }</p>
				</div>
				<div class="form-group">
					<label class="fw-bold">Full name</label> 
					<input class="form-control mb-2 mt-1 rounded-pill" type="text" name="fullname"> 
					<label class="fw-bold">Email</label> 
					<input class="form-control mb-2 mt-1 rounded-pill" type="email" name="email"> 
					<label class="fw-bold">Password</label> 
					<input class="form-control mb-2 mt-1 rounded-pill" type="password" name="password">
					<label class="fw-bold">Phone number</label> 
					<input class="form-control mb-2 mt-1 rounded-pill" type="text" name="phonenumber">
					<label class="fw-bold">Avatar</label> 
					<input class="form-control mb-2 mt-1 rounded-pill" type="text" name="avatar">
					<div class="row text-end text-primary">
						<a href="/ASM/login" class="text-decoration-none">Log in now ?</a>
					</div>
					<div class="row px-3 mt-4">
						<button class="btn btn-primary rounded-pill">SIGN UP</button>
					</div>
					<br />
				</div>
			</form>
		</div>
	</div>
</body>
</html>