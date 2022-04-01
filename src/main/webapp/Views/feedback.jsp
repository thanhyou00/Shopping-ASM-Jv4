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
	<%@include file="header.jsp" %> <br/> <br/>
		<div class="container bg-light mt-5 p-5">
			<h3>FEEDBACKS FORM</h3> <br/>
			<form action="">
				<div class="row">
					<div class="col-6">
						<label class="form-label">Fullname</label>
						<input type="text" class="form-control" />
					</div>
					<div class="col-6">
						<label class="form-label">Email</label>
						<input type="email" class="form-control" />
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-6">
						<label class="form-label">Phone number</label>
						<input type="text" class="form-control" />
					</div>
					<div class="col-6">
						<label class="form-label">Address</label>
						<input type="text" class="form-control" />
					</div>
				</div>
				<div class="row mt-3">
						<label class="form-label">Feedbacks content</label>
						<textarea class="form-control mx-1" rows="4"></textarea>
				</div>	
				<div class="row mt-5 mx-2">
					<button class="btn btn-success">SEND</button>
				</div>							
			</form>
			<div class="row mt-5">
			<iframe src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d251637.95196238213!2d105.6189045!3d9.779349!3m2!1i1024!2i768!4f13.1!5e0!3m2!1svi!2s!4v1648128834673!5m2!1svi!2s"
			 width="100%" height="500" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
			</div>
	</div>
	<%-- Footer --%>
	<%@include file="footer.jsp" %>	
</body>
</html>









