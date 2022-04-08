	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<%-- Library bootstrap --%>
	<%@include file="/views/bootstrap.jsp"%>
<link rel="shortcut icon" href="/ASM/public/images/logo.svg"
	type="image/x-icon">
<title>Fashion</title>
</head>
<body class="container-fluid font-monospace">
	<div class="row"> 
		<div class="align-self-center p-5 col-12 col-md-6">
			<a class="navbar-brand fw-bold fs-2" href="#">
				<img alt="logo" class="img-fluid" src="/ASM/public/images/logo.svg">
			</a>
		</div>
		<div class="align-self-center p-5 col-12 col-md-6 mt-5">
			<form action="/ASM/login" method="post">
			<h1>Login</h1>
				<c:if test="${ !empty sessionScope.messageLg }">
					<div class="text-danger">${ sessionScope.messageLg }</div>
					<c:remove var="messageLg" scope="session" />
				</c:if>
				<div class="form-group">
					<label class="fw-bold">Email</label>
					<input class="form-control mb-2 mt-1 rounded-pill" type="text" name="emailLogin" value="${ email }" required="required" 
					oninvalid="this.setCustomValidity('Không được để trống email')"
					oninput="this.setCustomValidity('')"
					/>
					<c:if test="${ !empty sessionScope.isEmail }">
						<div class="text-danger">${ sessionScope.isEmail }</div>
						<c:remove var="isEmail" scope="session" />
					</c:if>
					<label class="fw-bold">Password</label>
					<input class="form-control mb-2 mt-1 rounded-pill" type="password" name="passwordLogin" value="${ password }" required="required" 
					oninvalid="this.setCustomValidity('Không được để trống password')"
					oninput="this.setCustomValidity('')"					
					/>
					
					<div class="row p-2">
					<div class="form-check col-6">
						<input class="form-check-input" type="checkbox" name="remember" /> 
						<label class="form-check-label fw-bold" for="flexCheckDefault"> Remember me </label>
					</div>
					<div class="col-6 text-primary text-end " role="button">
						<p>Forgot password ?</p>
					</div>
					</div>
					
					<div class="row px-3 mt-5">
						<button type="submit" class="btn btn-primary rounded-pill">LOG IN</button> 
						<button type="button" class="btn btn-primary rounded-pill mt-3">
							<a href="/ASM/signup/index" class="text-decoration-none text-white">SIGN UP</a>
						</button>
					</div> <br/>
					<div class="row text-center">
						<p class="fw-bold">	Or login with</p>
					</div>
					<div class="row text-center text-white px-3">
						<div class="col-12 col-xl-6 bg-info p-2 mt-2 rounded-pill pe-auto" role="button">
						<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
 							 <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"/>
						</svg>
							Log in with Facebook
						</div>
						<div class="col-12 col-xl-6 bg-danger p-2 mt-2 rounded-pill pe-auto" role="button">
						<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-google" viewBox="0 0 16 16">
  							<path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z"/>
						</svg>
							Log in with Google
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	</body>
</html>