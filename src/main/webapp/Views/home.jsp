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
	<div class="px-5 mt-5">
		<div class="row">
		<div class="col-3 mt-5" style="padding-right: 50px">
		<p class="fw-bold fs-5">Danh mục sản phẩm</p>
		<ul class="list-group text-uppercase border shadow-sm">
		<c:forEach items="${listCategory}" var="category">
		  <li class="list-group-item border-0">
		  	<a href="/ASM/home?ctid=${category.id}" class="text-black text-decoration-none">${category.name}</a>
		  </li>
		  </c:forEach>
		</ul>
		</div>
		<div class="col-9">
		<h4 class="fw-bold">Sản phẩm mới nhất</h4>
		<div class="row row-cols-1 row-cols-md-4 g-4 mt-4">
		<c:forEach var="item" items="${listPagination}">
			<div class="col">
				<div class="card h-90 border-0 shadow-sm rounded" style="min-height: 22rem">
					<img src="${ item.image }" class="card-img-top scale" height="220px"
						alt="${ item.descriptions }">
					<div class="card-body">
						<h6 class="card-title fw-bold">
							<a href="/ASM/cart?id=${item.id}" class="text-black text-decoration-none">${ item.name }</a>
						</h6>
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
			    <li class="page-item px-1 disabled">
			      <a class="page-link">
			      	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="black" class="bi bi-chevron-left" viewBox="0 0 16 16">
  						<path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
					</svg>
			      </a>
			    </li>
			    <c:forEach begin="1" end="${endPage}" var="i">
			    	<li class="page-item px-1"><a class="page-link ${isActive==i?"active":"unactive"}" href="/ASM/home?index=${i}">${i}</a></li>
			    </c:forEach>
			    <li class="page-item px-1">
			      <a class="page-link" href="/ASM/home?index=${index+1}">
			      	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="black" class="bi bi-chevron-right" viewBox="0 0 16 16">
  						<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
					</svg>
			      </a>
			    </li>
			  </ul>
			</nav>
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