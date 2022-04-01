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
<link rel="shortcut icon" href="/ASM/public/images/logo.svg"
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
	<%@include file="header.jsp" %>
	<%-- Posts --%>
	<div class="row bg-white p-5 mt-5">
	<h3>Blogs</h3>
		<div class="col-8 p-4">
			<div class="row row-cols-1 row-cols-md-2 g-4">
				<div class="col">
					<div class="card shadow rounded">
						<img src="https://www.fillmurray.com/640/360" class="card-img-top img-fluid" 
							alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card shadow rounded">
						<img src="https://www.fillmurray.com/640/360" class="card-img-top img-fluid" 
							alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card shadow rounded">
						<img src="https://www.fillmurray.com/640/360" class="card-img-top img-fluid" 
							alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content.</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card shadow rounded">
						<img src="https://www.fillmurray.com/640/360" class="card-img-top img-fluid" 
							alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-1"></div>
		<div class="col-3 p-4">
		<h3>Most popular</h3>
			<form class="d-flex">
				<input class="form-control me-2 rounded-pill" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-primary rounded-pill" type="submit">Search</button>
			</form>
			<ol class="list-group list-group-numbered mt-4 rounded-3 shadow">
				<li
					class="list-group-item d-flex justify-content-between align-items-start">
					<div class="ms-2 me-auto">
						<div class="fw-bold">Subheading</div>
						Content for list item
					</div> <span class="badge bg-primary rounded-pill">14</span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-start">
					<div class="ms-2 me-auto">
						<div class="fw-bold">Subheading</div>
						Content for list item
					</div> <span class="badge bg-primary rounded-pill">14</span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-start">
					<div class="ms-2 me-auto">
						<div class="fw-bold">Subheading</div>
						Content for list item
					</div> <span class="badge bg-primary rounded-pill">14</span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-start">
					<div class="ms-2 me-auto">
						<div class="fw-bold">Subheading</div>
						Content for list item
					</div> <span class="badge bg-primary rounded-pill">14</span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-start">
					<div class="ms-2 me-auto">
						<div class="fw-bold">Subheading</div>
						Content for list item
					</div> <span class="badge bg-primary rounded-pill">14</span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-start">
					<div class="ms-2 me-auto">
						<div class="fw-bold">Subheading</div>
						Content for list item
					</div> <span class="badge bg-primary rounded-pill">14</span>
				</li>
			</ol>
		</div>

	</div>
	<%-- Footer --%>
	<%@include file="footer.jsp" %>
</body>
</html>