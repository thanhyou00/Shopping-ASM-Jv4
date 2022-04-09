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
			<form action="/ASM/checkout/payment?proId=${ sessionScope.proId }&quantityCheckout=${ sessionScope.quantityCheckout }" method="post">
			<p class="fw-bold"> > Thông tin khách hàng</p>
			<label class="form-label mt-1">Họ và tên <span class="text-danger">*</span></label>
			<input type="text" class="form-control" name="fullname" required="required"
			oninvalid="this.setCustomValidity('Không được để trống fullname')"
			oninput="this.setCustomValidity('')"			
			 />
			<label class="form-label mt-1">Email</label>
			<input type="email" class="form-control" name="email" required="required"
			oninvalid="this.setCustomValidity('Không được để trống email')"
			oninput="this.setCustomValidity('')"					
			 />
			<label class="form-label mt-1">Số điện thoại <span class="text-danger">*</span></label>
			<input type="text" class="form-control" required="required"
			oninvalid="this.setCustomValidity('Không được để trống phone number')"
			oninput="this.setCustomValidity('')"					
			 />
			<label class="form-label mt-1">Địa chỉ giao hàng <span class="text-danger">*</span></label>
			<input type="text" class="form-control" name="address" required="required"
			oninvalid="this.setCustomValidity('Không được để trống address')"
			oninput="this.setCustomValidity('')"					
			 />									
			<label class="form-label mt-1">Ghi chú</label>
			<textarea class="form-control" rows="5"></textarea>
			<div class="row mt-5"> <button type="submit" class="btn btn-dark">Hoàn tất đơn hàng</button> </div>
			</form>
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
				<c:set var="quantityCheckout" value="${order.quantity}" scope="session"></c:set>
				<c:set var="proId" value="${order.product.id }" scope="session"></c:set>
					<tr>
						<td>${ order.product.name }</td>
						<td>x ${ order.quantity }</td>
						<td>${order.quantity*order.product.price}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<hr/>
			<p class="fw-bold">Phương thức thanh toán</p>
			<div class="list-group">
			  <label class="list-group-item bg-light border-0">
			    <input class="form-check-input me-1" name="payment" type="radio" value="">
			    Thanh toán qua Momo
			  </label>
			  <label class="list-group-item bg-light border-0">
			    <input class="form-check-input me-1" name="payment" type="radio" value="">
			    Thanh toán qua Paypal
			  </label>
			  <label class="list-group-item bg-light border-0">
			    <input class="form-check-input me-1" name="payment" type="radio" value="">
			    Thanh toán qua Zalo Pay
			  </label>
			  <label class="list-group-item bg-light border-0">
			    <input class="form-check-input me-1" name="payment" type="radio" value="">
			    Thanh toán qua thẻ 
			  </label>
			</div>
			<hr/>
			<p class="fw-bold fs-3">
				Total : <span class="text-red"><fmt:formatNumber value="${ total }" pattern="#,###.00"></fmt:formatNumber> VND</span>
			</p>
		</div>
	</div>
	</div>
		<div class="alert alert-success ${sessionScope.display=='show'?'':'d-none'}" role="alert" style="right: 30px; bottom: 30px;width: auto;position: fixed;z-index: 999">
	<span>
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
 				<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
		</svg>
	</span>
 			${sessionScope.messageSuccess}
	</div>
	<c:remove var="display" scope="session" />
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