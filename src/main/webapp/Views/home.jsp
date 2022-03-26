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
.scale {
	transition: transform 1s;
}
.scale:hover {
	transform: scale(1.05);
}

.text-red {
	color: red;
}

.ell {
    display: inline-block;
    width: 110px;
    white-space: nowrap;
    overflow: hidden !important;
    text-overflow: ellipsis;
}
	
</style>
<body class="container-fluid font-monospace">
	<%-- Header --%>
	<%@include file="header.jsp" %>
	<%-- Slider --%>
	<div class="row bg-white mt-5">
		<div id="carouselExampleInterval" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active p-3" data-bs-interval="10000">
					<img src="/ASM/public/images/banner01.png" class="d-block w-100"
						height="600px" alt="slider01">
					<div class="carousel-caption d-none d-md-block text-dark">
						<h5>Second slide label 1</h5>
						<p>Some representative placeholder content for the second
							slide.</p>
					</div>
				</div>
				<div class="carousel-item p-3" data-bs-interval="2000">
					<img src="/ASM/public/images/banner02.png" class="d-block w-100"
						height="600px" alt="slider02">
					<div class="carousel-caption d-none d-md-block text-dark">
						<h5>Second slide label 2</h5>
						<p>Some representative placeholder content for the second
							slide.</p>
					</div>
				</div>
				<div class="carousel-item p-3">
					<img src="/ASM/public/images/banner03.png" class="d-block w-100"
						height="600px" alt="slider03">
					<div class="carousel-caption d-none d-md-block text-dark">
						<h5>Second slide label 3</h5>
						<p>Some representative placeholder content for the second
							slide.</p>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
				<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
					fill="#dfe4ea" class="bi bi-arrow-left-circle-fill"
					viewBox="0 0 16 16">
  					<path
						d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z" />
				</svg>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleInterval" data-bs-slide="next">
				<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
					fill="#dfe4ea" class="bi bi-arrow-right-circle-fill"
					viewBox="0 0 16 16">
  					<path
						d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z" />
				</svg>
			</button>
		</div>
	</div>
	<div class="container-fluid mt-5">
		<div class="row">
		<div class="col-3 mt-5 px-5">
		<nav class="navbar navbar-light">
				<form class="d-flex">
					<input style="padding-right: 100px" class="form-control me-2"
						type="search" placeholder="Search..." aria-label="Search">
					<button class="btn btn-primary" type="submit">Search</button>
				</form>
		</nav>
		<br/>
		<p class="fw-bold fs-5">Danh mục sản phẩm</p>
		<ul class="list-group text-uppercase border shadow-sm">
		  <li class="list-group-item border-0">
		  	<a href="#" class="text-black text-decoration-none">Giày nam</a>
		  </li>
		  <li class="list-group-item border-0">
		  	<a href="#" class="text-black text-decoration-none">Giày nữ</a>
		  </li>
		  <li class="list-group-item border-0">
		  	<a href="#" class="text-black text-decoration-none">Giày adidas</a>
		  </li>
		  <li class="list-group-item border-0">
		  	<a href="#" class="text-black text-decoration-none">Giày nike</a>
		  </li>
		  <li class="list-group-item border-0">
		  	<a href="#" class="text-black text-decoration-none">Giày vans</a>
		  </li>
		  <li class="list-group-item border-0">
		  	<a href="#" class="text-black text-decoration-none">Giày đôi</a>
		  </li>
		</ul>
		</div>
		<div class="col-9">
		<h4 class="fw-bold">Sản phẩm mới nhất</h4>
		<div class="row row-cols-1 row-cols-md-4 g-4 mt-4">
		<c:forEach var="item" items="${list}">
			<div class="col">
				<div class="card h-90 border-0 shadow rounded" style="min-height: 26rem">
					<img src="${ item.image }" class="card-img-top scale"
						alt="${ item.descriptions }">
					<div class="card-body">
						<h5 class="card-title">
							<a href="/ASM/detail" class="text-black text-decoration-none">${ item.name }</a>
						</h5>
					</div>
					<div class="card-footer bg-white">
						<p class="card-text text-red fs-5 fw-bold">${item.price } VNĐ</p>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
		<br/>
		<div class="row mt-5">
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			    <li class="page-item disabled">
			      <a class="page-link">Previous</a>
			    </li>
			    <li class="page-item"><a class="page-link" href="#">1</a></li>
			    <li class="page-item"><a class="page-link" href="#">2</a></li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			    <li class="page-item">
			      <a class="page-link" href="#">Next</a>
			    </li>
			  </ul>
			</nav>
		</div>
		</div>
		</div>
	</div>
	<%-- Footer --%>
	<%@include file="footer.jsp" %>
</body>
</html>