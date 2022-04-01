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
	<%@include file="header.jsp"%>
<div class="container mt-5">
		<div class="row pt-5">
			<div class="col-4 align-self-center">
				<select class="form-select" aria-label="Default select example">
					<option selected>-- Type --</option>
					<option value="1">Nike</option>
					<option value="2">Adidas</option>
					<option value="3">Converse</option>
					<option value="4">Sneaker</option>
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
		<h3 class="mt-3">HOT SALES</h3>
		<div class="row row-cols-1 row-cols-md-4 g-4 mt-4">
			<div class="col">
				<div class="card h-90 border-0 shadow rounded" style="min-height: 30rem">
					<img src="https://giayxshop.vn/wp-content/uploads/2021/04/z2437535556835_fec0d759c28542683684d8da8826f2e5-scaled.jpg" class="card-img-top scale"
						alt="product">
					<div class="position-absolute border border-2 rounded border-white bg-primary text-center mx-2" style="height: 80px;width: 60px;">
						<h4 class="text-white fw-bold">Sale</h4>
						<span class="text-white fw-bold">50%</span>
					</div>
					<div class="card-body">
						<h5 class="card-title">Nike Jordan 1 Low Xanh Dương REP</h5>
						<p class="card-text text-red fs-5 fw-bold">550.000 VNĐ</p>
					</div>
					<div class="card-footer">
						<button type="button" class="btn btn-primary w-100">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
								fill="currentColor" class="bi bi-caret-right"
								viewBox="0 0 16 16">
  							<path d="M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z" />
						</svg>
							<a href="/ASM/detail" class="text-white text-decoration-none">Buy now</a>
						</button>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-90 border-0 shadow rounded" style="min-height: 30rem">
					<img src="https://giayxshop.vn/wp-content/uploads/2018/12/xoa-phong-154-1.jpg" class="card-img-top scale"
						alt="product">
					<div class="position-absolute border border-2 rounded border-white bg-primary text-center mx-2" style="height: 80px;width: 60px;">
						<h4 class="text-white fw-bold">Sale</h4>
						<span class="text-white fw-bold">50%</span>
					</div>	
					<div class="card-body">
						<h5 class="card-title">Giày Thể Thao XSPORT Van.s Old Skool Cá Mập</h5>
						<p class="card-text text-red fs-5 fw-bold">1250.000 VNĐ</p>
					</div>
					<div class="card-footer">
						<button type="button" class="btn btn-primary w-100">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
								fill="currentColor" class="bi bi-caret-right"
								viewBox="0 0 16 16">
  							<path d="M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z" />
						   </svg>
							<a href="/ASM/detail" class="text-white text-decoration-none">Buy now</a>
						</button>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-90 border-0 shadow rounded" style="min-height: 30rem">
					<img src="https://giayxshop.vn/wp-content/uploads/2021/12/z3006364581361_1d378ab773e3261915d279d3d012a718.jpg" class="card-img-top scale"
						alt="product">
					<div class="position-absolute border border-2 rounded border-white bg-primary text-center mx-2" style="height: 80px;width: 60px;">
						<h4 class="text-white fw-bold">Sale</h4>
						<span class="text-white fw-bold">50%</span>
					</div>						
					<div class="card-body">
						<h5 class="card-title">Nike Jordan 1 Low Xanh Dương Vạch Đen REP</h5>
						<p class="card-text text-red fs-5 fw-bold">850.000 VNĐ</p>
					</div>
					<div class="card-footer">
						<button type="button" class="btn btn-primary w-100">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
								fill="currentColor" class="bi bi-caret-right"
								viewBox="0 0 16 16">
  							<path d="M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z" />
						</svg>
							<a href="/ASM/detail" class="text-white text-decoration-none">Buy now</a>
						</button>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-90 border-0 shadow rounded" style="min-height: 30rem">
					<img src="https://giayxshop.vn/wp-content/uploads/2020/09/z2077558321688_9048fd5ff5d1734365f111e2e3134040.jpg" class="card-img-top scale"
						alt="product">
					<div class="position-absolute border border-2 rounded border-white bg-primary text-center mx-2" style="height: 80px;width: 60px;">
						<h4 class="text-white fw-bold">Sale</h4>
						<span class="text-white fw-bold">50%</span>
					</div>
					<div class="card-body">
						<h5 class="card-title">Giày Thể Thao XSPORT A102</h5>
						<p class="card-text text-red fs-5 fw-bold">450.000 VNĐ</p>
					</div>
					<div class="card-footer">
						<button type="button" class="btn btn-primary w-100">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
								fill="currentColor" class="bi bi-caret-right"
								viewBox="0 0 16 16">
  							<path d="M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z" />
						</svg>
							<a href="/ASM/detail" class="text-white text-decoration-none">Buy now</a>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br/>
	<br/>
	<%-- Footer --%>
	<%@include file="footer.jsp" %>
</body>
</html>