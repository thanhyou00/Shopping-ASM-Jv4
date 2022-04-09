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
	<br/>
	<br/>
	<div class="container">
		<div class="row mt-5 p-5 border rounded">
				<nav>
				  <div class="nav nav-tabs" id="nav-tab" role="tablist">
				    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-verify" type="button" role="tab" aria-controls="nav-verify" aria-selected="true">Đơn hàng đã đặt</button>
				    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Phản hồi</button>
				  </div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
				  <div class="tab-pane fade show active" id="nav-verify" role="tabpanel" aria-labelledby="nav-home-tab">
				  <table class="table table-borderless">
					  <thead>
					  	<tr>
					  		<th>Sản phẩm</th>
					  		<th>Tên sản phẩm</th>
					  		<th>Giá sản phẩm</th>
					  		<th>Số lượng</th>
					  		<th>Trạng thái</th>
					  	</tr>
					  </thead>
					  <tbody>
					  <c:forEach items="${ historyUser }" var="his">
					  	<tr>
					  		<td>
					  			<img alt="${ his.name }" src="${ his.image }" height="50px" width="50px">
					  		</td>
					  		<td>${ his.name }</td>
					  		<td>${ his.price }</td>
					  		<td>${ his.quantity }</td>
					  		<td class="${ his.status==1?"text-primary":"text-danger" }">${ his.status==1?"Đã thanh toán":"Chưa thanh toán" }</td>
					  	</tr>
					  	</c:forEach>					  
					  </tbody>
				  </table>
				  </div>
				  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
				  	<p class="alert alert-primary m-3">No notications</p>
				  </div>
				</div>			
			</div>
	</div>
	  <!-- Back to top -->
      <div>
        <button class="backTop" onclick="topFunction()">
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="white" class="bi bi-arrow-90deg-up" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M4.854 1.146a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L4 2.707V12.5A2.5 2.5 0 0 0 6.5 15h8a.5.5 0 0 0 0-1h-8A1.5 1.5 0 0 1 5 12.5V2.707l3.146 3.147a.5.5 0 1 0 .708-.708l-4-4z"/>
			</svg>
        </button>
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