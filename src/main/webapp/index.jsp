	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	<div class="row mt-5">
		<div class="col-6 text-center">
			<img alt="banner" src="/ASM/public/images/banner.png" class="img-fluid">
		</div>
		<div class="col-6 text-end align-self-center px-5">
			<h1>Welcome my website</h1>
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