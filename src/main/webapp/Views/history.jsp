<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../Bootstrap/css/bootstrap.min.css" />
<link rel="shortcut icon" href="../Bootstrap/images/logo.png"
	type="image/x-icon">
<title>YouVideo</title>
</head>
<body class="container">
	<%-- Header --%>
	<%@include file="header.jsp"%>
	<div class="row bg-light mt-5 p-5">
		<h4 class="mb-5">History</h4>
		<div class="col-5">
			<div class="card mb-3">
				<div class="row g-0">
					<div class="col-md-5 d-flex justify-content-center">
						<img src="https://www.fillmurray.com/640/360" class="img-fluid"
							alt="..." height="100%">
					</div>
					<div class="col-md-7">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a wider card with supporting</p>
							<p class="card-text">
								<small class="text-muted">Delete</small>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="card mb-3">
				<div class="row g-0">
					<div class="col-md-5 d-flex justify-content-center">
						<img src="https://www.fillmurray.com/640/360" class="img-fluid"
							alt="..." height="100%">
					</div>
					<div class="col-md-7">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a wider card with supporting</p>
							<p class="card-text">
								<small class="text-muted">Delete</small>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="card mb-3">
				<div class="row g-0">
					<div class="col-md-5 d-flex justify-content-center">
						<img src="https://www.fillmurray.com/640/360" class="img-fluid"
							alt="..." height="100%">
					</div>
					<div class="col-md-7">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a wider card with supporting</p>
							<p class="card-text">
								<small class="text-muted">Delete</small>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="card mb-3">
				<div class="row g-0">
					<div class="col-md-5 d-flex justify-content-center">
						<img src="https://www.fillmurray.com/640/360" class="img-fluid"
							alt="..." height="100%">
					</div>
					<div class="col-md-7">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a wider card with supporting</p>
							<p class="card-text">
								<small class="text-muted">Delete</small>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-7 d-flex align-items-start">
			<nav class="navbar navbar-light">
					<div class="container">
					<h4 class="mx-3">Search your video</h4>
						<form class="d-flex">
							<input style="padding-right: 100px" class="form-control me-2"
								type="search" placeholder="Search..." aria-label="Search">
							<button class="btn btn-primary" type="submit">Search</button>
						</form>
					</div>
			</nav>
		</div>
	</div>
	<%-- Library bootstrap --%>
	<%@include file="bootstrap.jsp"%>
</body>
</html>