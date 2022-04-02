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
<body class="container-fluid font-monospace  text-uppercase">
	<%-- Header --%>
	<%@include file="header.jsp" %>
	<div class="row mt-5"></div>
	<div class="row m-5 shadow-sm rounded p-5">
		<table class="table">
			<thead>
				<tr>
					<th colspan="5"><h5 class="fw-bold">Items in your cart</h5></th>
				</tr>
				<tr>
					<th>Image</th>
					<th>Name</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Handle</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<img src="https://giayxshop.vn/wp-content/uploads/2021/04/z2437535556835_fec0d759c28542683684d8da8826f2e5-scaled.jpg" 
						class="rounded" width="100px" height="100px" alt="product">
					</td>
					<td>
						<p class="fw-bold text-black">Nike Jordan 1 Low Xanh Dương REP</p>
					</td>
					<td>
						<p class="text-red fs-5 fw-bold">550.000 VND</p>
					</td>
					<td>
						5
					</td>
					<td>
						<button class="btn btn-danger">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
  							<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  							<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
						</svg>
						Delete</button>
					</td>
				</tr>	
				<tr>
					<td colspan="4">
						<p class="fw-bold fs-3">Total : <span class="text-red">1.100.000 VND</span> </p>
					</td>
					<td>
						<button class="btn btn-success">Check out</button>
					</td>
				</tr>			
			</tbody>
		</table>
	</div>
	<%-- Footer --%>
	<%@include file="footer.jsp" %>	
</body>
</html>