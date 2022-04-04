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
			<c:forEach items="${sessionScope.order.orderDetails}" var="order">
			<c:set var="total" value="${total + order.product.price * order.quantity }"></c:set>
				<tr>
					<td>
						<img src="${order.product.image}" 
						class="rounded" width="100px" height="100px" alt="product">
					</td>
					<td>
						<p class="fw-bold text-black">${ order.product.name }</p>
					</td>
					<td>
						<p class="text-red fs-5 fw-bold">${ order.product.price } VND</p>
					</td>
					<td>
						<span><button>-</button></span>
						<p>${order.quantity}</p>
						<span><button>+</button></span>
					</td>
					<td><button class="btn btn-danger">Delete</button></td>
				</tr>	
				</c:forEach>			
				<tr>
					<td colspan="4">
						<p class="fw-bold fs-3">Total : <span class="text-red">${total} VND</span> </p>
					</td>
					<td>
						<a class="btn btn-success" href="/ASM/checkout">Check out</a>
					</td>
				</tr>			
			</tbody>
		</table>
	</div>
	<%-- Footer --%>
	<%@include file="footer.jsp" %>	
</body>
</html>