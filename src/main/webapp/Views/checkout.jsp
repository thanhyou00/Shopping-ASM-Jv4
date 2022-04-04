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
html {
    scroll-behavior: smooth;
}

.backTop {
    position: fixed;
    bottom: 30px;
    right: 30px;
    width: 45px;
    height: 45px;
    background-color: #0097e6;
    border: 1px solid #fff;
    border-radius: 10%;
    background-size: 40px;
    cursor: pointer;
    z-index: 100000;
    transition: 0.5s;
    display: none;
    opacity: 0.5;
}
.backTop:hover {
    opacity: 1;
}	
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

a.active {
	color: white;
	font-weight: bold;
	background-color: black;
}
a.unactive {
	color: black;
	font-weight: normal;
	background-color: white;
}
	
</style>
<body class="container-fluid font-monospace" >
	<%-- Header --%>
	<%@include file="header.jsp" %>
	<br/>
	<div class="container">
	<div class="row mt-5 pt-5">
		<div class="col-6 p-5">
			<h3>BILLING DETAILS</h3>
			<hr/>
			<p class="fw-bold"> > Thông tin khách hàng</p>
			<label class="form-label mt-1">Họ và tên <span class="text-danger">*</span></label>
			<input type="text" class="form-control" />
			<label class="form-label mt-1">Email</label>
			<input type="email" class="form-control" />
			<label class="form-label mt-1">Số điện thoại <span class="text-danger">*</span></label>
			<input type="text" class="form-control" />
			<label class="form-label mt-1">Địa chỉ giao hàng <span class="text-danger">*</span></label>
			<input type="text" class="form-control" />									
			<label class="form-label mt-1">Ghi chú</label>
			<textarea class="form-control" rows="5"></textarea>
		</div>
		<div class="col-6 p-5 bg-light rounded">
			<h3>YOUR ORDER</h3>
			<table class="table table-borderless">
				<thead>
					<tr>
						<th>Product</th>
						<th>Quantity</th>
						<th>Total</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${sessionScope.order.orderDetails}" var="order">
				<c:set var="total" value="${total + order.product.price * order.quantity }"></c:set>
					<tr>
						<td>${ order.product.name }</td>
						<td>${ order.quantity }</td>
						<td>${order.quantity*order.product.price}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<hr/>
			<p class="fw-bold">Phương thức thanh toán</p>
			<div class="list-group">
			  <label class="list-group-item bg-light border-0">
			    <input class="form-check-input me-1" type="radio" value="">
			    Thanh toán qua Momo
			  </label>
			  <label class="list-group-item bg-light border-0">
			    <input class="form-check-input me-1" type="radio" value="">
			    Thanh toán qua Paypal
			  </label>
			  <label class="list-group-item bg-light border-0">
			    <input class="form-check-input me-1" type="radio" value="">
			    Thanh toán qua Zalo Pay
			  </label>
			  <label class="list-group-item bg-light border-0">
			    <input class="form-check-input me-1" type="radio" value="">
			    Thanh toán qua thẻ 
			  </label>
			</div>
			<hr/>
			<p class="fw-bold fs-3">
				Total : <span class="text-red"><fmt:formatNumber value="${ total }" pattern="#,###.00"></fmt:formatNumber> VND</span>
			</p>
			<div class="row"> <button class="btn btn-dark">Hoàn tất đơn hàng</button> </div>
		</div>
	</div>
	</div>
	<%-- Footer --%>
	<%@include file="footer.jsp" %>
	<script type="text/javascript">
	var mybutton = document.querySelector(".backTop");

	window.onscroll = function () {
	  scrollFunction();
	};

	function scrollFunction() {
	  if (
	    document.body.scrollTop > 300 ||
	    document.documentElement.scrollTop > 300
	  ) {
	    mybutton.style.display = "block";
	  } else {
	    mybutton.style.display = "none";
	  }
	}

	function topFunction() {
	  document.body.scrollTop = 0;
	  document.documentElement.scrollTop = 0;
	}
	</script>
</body>
</html>