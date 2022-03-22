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
<link rel="shortcut icon" href="/ASM/public/images/logomain.svg" type="image/x-icon">

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
	transition: all 1s;
}
.scale:hover {
	    -webkit-transform: scale(1.06);
        transform: scale(1.06);
}

.text-red {
	color: red;
}
	
</style>
<body class="container-fluid font-monospace">
	<%-- Header --%>
	<%@include file="header.jsp"%>
	<br/> <br/> <br/>
	<div class="container bg-white">
	<div class="row mt-5">
	<span>
	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
  		<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
	</svg>
	 <span>Nike Jordan 1 Low Xanh Dương REP</span> 
	 </span>
	 </div>
	<div class="row p-5">
			<div class="col-6 overflow-hidden border border-1">
				<img src="https://giayxshop.vn/wp-content/uploads/2021/04/z2437535556835_fec0d759c28542683684d8da8826f2e5-scaled.jpg" 
				class="card-img-top scale" alt="product">
			</div>
			<div class="col-6 px-5">
				<h5 class="fw-bold">Nike Jordan 1 Low Xanh Dương REP</h5>
				<p>Chất liệu cao cấp, bền đẹp theo thời gian. Thiết kế thời trang. Kiểu dáng phong cách. Độ bền cao. Dễ phối đồ.</p>
				<h5 class="fw-bold">Màu sắc : Blue</h5> 
				<h5 class="fw-bold">Kích thước : </h5>
				<p class="card-text text-red fs-5 fw-bold">550.000 VNĐ</p>
			</div>
	</div>
	</div>
</body>
</html>