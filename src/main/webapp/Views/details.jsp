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
					<th>ID Product</th>
					<th>Price</th>
					<th>Quantity</th>
					<th colspan="2">Handle</th>
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
						<p class="fw-bold text-black">${ order.product.id }</p>
					</td>
					<td>
						<p class="text-red fs-5 fw-bold">
						<fmt:formatNumber value="${ order.product.price }" pattern="#,###.00"></fmt:formatNumber> VND</p>
					</td>
					<td>
					<span class="input-group">
						<span><a class="btn btn-primary" href="/ASM/detail/quantity?action=dec&id=${order.product.id}">-</a></span>
						<input type="number" min="1" class="form-control mx-2 rounded" disabled name="quantity" value="${order.quantity}">
						<span><a class="btn btn-primary" href="/ASM/detail/quantity?action=inc&id=${order.product.id}">+</a></span>
					</span>	
					</td>
					<td><a class="btn btn-danger" href="/ASM/detail/remove?id=${order.product.id}">Delete</a></td>
					<td><a class="btn btn-success" href="/ASM/detail/order-now?id=${order.product.id}&quantity=${order.quantity}">Buy now</a></td>
				</tr>	
				</c:forEach>					
			</tbody>
		</table>
		<div class="row mt-3">
			<div class="col-10">
				<p class="fw-bold fs-3">
					Total : <span class="text-red"><fmt:formatNumber value="${ total }" pattern="#,###.00"></fmt:formatNumber> VND</span>
				</p>
			</div>
			<div class="col-2"><a class="btn btn-success" href="/ASM/checkout">Checkout</a></div>
		</div>
	</div>
	<%-- Footer --%>
	<%@include file="footer.jsp" %>	
</body>
</html>