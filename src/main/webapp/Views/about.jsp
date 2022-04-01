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
	
</style>
<body class="container-fluid font-monospace">
	<%-- Header --%>
	<%@include file="header.jsp"%> <br/>
	<div class="row mt-5">
		<img alt="about" src="/ASM/public/images/about_us.png">
	</div>
	<div class="text-center mt-5"> <h2>ABOUT US</h2> </div>
	<div class="row px-5 mt-5">
		<div class="col-7">
			<h5>What is Lorem Ipsum?</h5>
			<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the 
			industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and 
			scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into 
			electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of 
			Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus 
			PageMaker including versions of Lorem Ipsum.</p>
			
			<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the 
			industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and 
			scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into 
			electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of 
			Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus 
			PageMaker including versions of Lorem Ipsum.</p>
		</div>
		<div class="col-5">
			<img alt="" src="/ASM/public/images/man.png" class="" width="100%" height="400px" style="object-fit: contain;">
		</div>
	</div>
	
	<%-- Footer --%>
	<%@include file="footer.jsp" %>
</body>
</html>









