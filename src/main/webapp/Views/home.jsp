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
<title>FEntertainment</title>
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
	<div class="container mt-5">
		<div class="row pt-5">
			<div class="col-4 align-self-center">
				<select class="form-select" aria-label="Default select example">
					<option selected>Open this select menu</option>
					<option value="1">One</option>
					<option value="2">Two</option>
					<option value="3">Three</option>
				</select>
			</div>
			<div class="col-8 align-self-center">
				<nav class="navbar navbar-light">
					<div class="container-fluid">
						<form class="d-flex">
							<input style="padding-right: 100px" class="form-control me-2"
								type="search" placeholder="Search..." aria-label="Search">
							<button class="btn btn-primary" type="submit">Search</button>
						</form>
					</div>
				</nav>
			</div>
		</div>

		<div class="row row-cols-1 row-cols-md-4 g-4 mt-4">
			<div class="col">
				<div class="card h-90 border-0 shadow rounded" style="min-height: 30rem">
					<img src="https://giayxshop.vn/wp-content/uploads/2021/04/z2437535556835_fec0d759c28542683684d8da8826f2e5-scaled.jpg" class="card-img-top scale"
						alt="product">
					<div class="card-body">
						<h5 class="card-title">Nike Jordan 1 Low Xanh Dương REP</h5>
						<p class="card-text text-red fs-5 fw-bold">550.000 VNĐ</p>
					</div>
					<div class="card-footer">
						<button type="button" class="btn btn-primary w-100">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
								fill="currentColor" class="bi bi-caret-right"
								viewBox="0 0 16 16">
  							<path
									d="M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z" />
						</svg>
							<a href="/ASM/detail" class="text-white text-decoration-none">Buy now</a>
						</button>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-90 border-0 shadow rounded" style="min-height: 30rem">
					<img src="https://giayxshop.vn/wp-content/uploads/2018/12/xoa-phong-154-1.jpg" class="card-img-top scale"
						alt="...">
					<div class="card-body">
						<h5 class="card-title">Giày Thể Thao XSPORT Van.s Old Skool Cá Mập</h5>
						<p class="card-text text-red fs-5 fw-bold">1250.000 VNĐ</p>
					</div>
					<div class="card-footer">
						<button type="button" class="btn btn-primary w-100">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
								fill="currentColor" class="bi bi-caret-right"
								viewBox="0 0 16 16">
  							<path
									d="M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z" />
						</svg>
							<a href="/ASM/detail" class="text-white text-decoration-none">Buy now</a>
						</button>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-90 border-0 shadow rounded" style="min-height: 30rem">
					<img src="https://giayxshop.vn/wp-content/uploads/2021/12/z3006364581361_1d378ab773e3261915d279d3d012a718.jpg" class="card-img-top scale"
						alt="...">
					<div class="card-body">
						<h5 class="card-title">Nike Jordan 1 Low Xanh Dương Vạch Đen REP</h5>
						<p class="card-text text-red fs-5 fw-bold">850.000 VNĐ</p>
					</div>
					<div class="card-footer">
						<button type="button" class="btn btn-primary w-100">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
								fill="currentColor" class="bi bi-caret-right"
								viewBox="0 0 16 16">
  							<path
									d="M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z" />
						</svg>
							<a href="/ASM/detail" class="text-white text-decoration-none">Buy now</a>
						</button>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-90 border-0 shadow rounded" style="min-height: 30rem">
					<img src="https://giayxshop.vn/wp-content/uploads/2020/09/z2077558321688_9048fd5ff5d1734365f111e2e3134040.jpg" class="card-img-top scale"
						alt="...">
					<div class="card-body">
						<h5 class="card-title">Giày Thể Thao XSPORT A102</h5>
						<p class="card-text text-red fs-5 fw-bold">450.000 VNĐ</p>
					</div>
					<div class="card-footer">
						<button type="button" class="btn btn-primary w-100">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
								fill="currentColor" class="bi bi-caret-right"
								viewBox="0 0 16 16">
  							<path
									d="M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z" />
						</svg>
							<a href="/ASM/detail" class="text-white text-decoration-none">Buy now</a>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- Footer --%>
	<%@include file="footer.jsp" %>
</body>
</html>