<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>

<fmt:setLocale value="${param.lang}" />
<fmt:setBundle basename="FPOLY.i18n.global" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<%-- Library bootstrap --%>
	<%@include file="bootstrap.jsp"%>
<link rel="shortcut icon" href="/ASM/public/images/logomain.svg"
	type="image/x-icon">
<title>Fashion</title>
</head>
<style>
	
::-webkit-scrollbar {
    width: 10px;
}
::-webkit-scrollbar-track { 
    box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.25);
}
::-webkit-scrollbar-thumb {
    border-radius: 5px;
    background-color: gray;
}
::-webkit-scrollbar-thumb:hover {
    background-color: #0abde3;
}
	
</style>
<body class="container-fluid font-monospace">
	<%-- Header --%>
	<%@include file="header.jsp"%>
	<div class="row bg-light mt-5 p-5">
		<h4 class="mb-5">Favourites</h4>
		<div class="col-5">
			<div class="card mb-3 shadow-sm rounded">
				<div class="row g-0">
					<div class="col-md-5 d-flex justify-content-center">
						<img src="https://www.fillmurray.com/640/360" class="img-fluid"
							alt="..." height="100%">
					</div>
					<div class="col-md-7">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">
							<span>
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  									<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
  									<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
							</svg>
								120.000
						    </span>
							</p>
							<p class="card-text">
								<small class="text-muted">Delete</small>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="card mb-3 shadow-sm rounded">
				<div class="row g-0">
					<div class="col-md-5 d-flex justify-content-center">
						<img src="https://www.fillmurray.com/640/360" class="img-fluid"
							alt="..." height="100%">
					</div>
					<div class="col-md-7">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">
							<span>
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  									<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
  									<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
							</svg>
								120.000
						    </span>
							</p>
							<p class="card-text">
								<small class="text-muted">Delete</small>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="card mb-3 shadow-sm rounded">
				<div class="row g-0">
					<div class="col-md-5 d-flex justify-content-center">
						<img src="https://www.fillmurray.com/640/360" class="img-fluid"
							alt="..." height="100%">
					</div>
					<div class="col-md-7">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">
							<span>
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  									<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
  									<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
							</svg>
								120.000
						    </span>
							</p>
							<p class="card-text">
								<small class="text-muted">Delete</small>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="card mb-3 shadow-sm rounded">
				<div class="row g-0">
					<div class="col-md-5 d-flex justify-content-center">
						<img src="https://www.fillmurray.com/640/360" class="img-fluid"
							alt="..." height="100%">
					</div>
					<div class="col-md-7">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">
							<span>
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  									<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
  									<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
							</svg>
								120.000
						    </span>
							</p>
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
</body>
</html>