
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
<link rel="shortcut icon" href="../ASM/Bootstrap/images/logo.png"
	type="image/x-icon">
<title>YouVideo</title>
</head>
<body class="container-fluid font-monospace">
	<div class="row">
		<div class="align-self-center p-5 col-12 col-md-6">
			<a class="navbar-brand fw-bold fs-2" href="#">
				<h1>YouVideo</h1>
			</a> <br /> <img alt="" src="../ASM/Bootstrap/images/login.svg"
				width="500">
		</div>
		<div class="align-self-center p-5 col-12 col-md-6">
			<form>
				<h1>Sign up</h1>
				<div class="form-group">
					<label class="fw-bold">Username</label> <input
						class="form-control mb-2 mt-1 rounded-pill" type="text"> <label
						class="fw-bold">Fullname</label> <input
						class="form-control mb-2 mt-1 rounded-pill" type="text"> <label
						class="fw-bold">Password</label> <input
						class="form-control mb-2 mt-1 rounded-pill" type="password">
					<label class="fw-bold">Repassword</label> <input
						class="form-control mb-2 mt-1 rounded-pill" type="password">
					<label class="fw-bold">Email</label> <input
						class="form-control mb-2 mt-1 rounded-pill" type="email">
					<div class="row text-end text-primary">
						<p role="button">Log in now</p>
					</div>
					<div class="row px-3 mt-4">
						<button type="button" class="btn btn-primary rounded-pill">SIGN
							UP</button>
					</div>
					<br />
				</div>
			</form>
		</div>
	</div>
</body>
</html>