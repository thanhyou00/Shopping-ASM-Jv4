	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<%-- Library bootstrap --%>
	<%@include file="/views/bootstrap.jsp"%>
<link rel="shortcut icon" href="../Bootstrap/images/logo.png"
	type="image/x-icon">
<title>YouVideo</title>
</head>
<body class="container font-monospace">
	<div class="row mt-5">
		<div class="col-6 text-center">
			<img alt="" src="http://localhost:8080/ASM/Bootstrap/images/banner.svg" class="img-fluid">
		</div>
		<div class="col-6 text-end align-self-center">
			<h1>Welcome my videos</h1>
			<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</p>
		<button type="button" class="btn btn-primary rounded-pill">
			<a href="/ASM/login" class="text-white text-decoration-none">GET STARTED</a>
		</button>
		<button type="button" class="btn btn-primary rounded-pill">
			<a href="/ASM/login" class="text-white text-decoration-none">WATCH MORE</a>
		</button>
		</div>
	</div>
</body>
</html>