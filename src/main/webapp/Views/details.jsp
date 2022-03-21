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
<link rel="shortcut icon" href="/ASM/public/images/logo.svg" type="image/x-icon">

<title>YouVideo</title>
</head>
<body class="container-fluid font-monospace">
	<%-- Header --%>
	<%@include file="header.jsp"%>
	<div class="row mt-5 p-5 bg-white">
		<div class="row">
			<div class="col-12 col-xl-8">
				<iframe width="100%" height="500px"
					src="https://www.youtube-nocookie.com/embed/UJg1w9pbNvo"
					title="YouTube video player" frameborder="1"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen>
					</iframe>
					<h3 class="mt-3">Ttile video</h3>
					<div class="row mt-4">
					<div class="col-12 col-xl-8"></div>
					<div class="col-12 col-xl-4 d-flex justify-content-end">
					<span>
						<span>
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  									<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
  									<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
							</svg>
								120.000
						</span>
						<span>
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
  								<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
							</svg>
								Like
						</span>
						<span>
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-share" viewBox="0 0 16 16">
  								<path d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z"/>
							</svg>
								Share
						</span>
					</span>
					</div>
					</div>
					<hr/>
					<div class="border border-end-0 border-top-0 border-bottom-0 border-4 border-info p-2">
					<p class="fst-italic">
						Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
					</p>
					</div>
			</div>
			<div class="col-12 col-xl-1"></div>
			<div class="col-12 col-xl-3">
			<h3>Videos current</h3>
				<div class="overflow-auto" style="max-height: 100vh">
				<div class="card mb-3 border-1 shadow-sm rounded">
				<div class="row g-0">
					<div class="col-md-5 d-flex justify-content-center">
						<img src="https://www.fillmurray.com/640/360" class="img-fluid"
							alt="..." height="100%">
					</div>
					<div class="col-md-7">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">
							<span>
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  									<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
  									<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
							</svg>
								120.000
						    </span>
							</p>
							<p class="card-text">
								<small class="text-muted">Watch</small>
							</p>
						</div>
					</div>
				</div>
				</div>
				<div class="card mb-3 border-1 shadow-sm rounded">
				<div class="row g-0">
					<div class="col-md-5 d-flex justify-content-center">
						<img src="https://www.fillmurray.com/640/360" class="img-fluid"
							alt="..." height="100%">
					</div>
					<div class="col-md-7">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">
							<span>
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  									<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
  									<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
							</svg>
								120.000
						    </span>
							</p>
							<p class="card-text">
								<small class="text-muted">Watch</small>
							</p>
						</div>
					</div>
				</div>
				</div>
				<div class="card mb-3 border-1 shadow-sm rounded">
				<div class="row g-0">
					<div class="col-md-5 d-flex justify-content-center">
						<img src="https://www.fillmurray.com/640/360" class="img-fluid"
							alt="..." height="100%">
					</div>
					<div class="col-md-7">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">
							<span>
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  									<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
  									<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
							</svg>
								120.000
						    </span>
							</p>
							<p class="card-text">
								<small class="text-muted">Watch</small>
							</p>
						</div>
					</div>
				</div>
				</div>
				<div class="card mb-3 border-1 shadow-sm rounded">
				<div class="row g-0">
					<div class="col-md-5 d-flex justify-content-center">
						<img src="https://www.fillmurray.com/640/360" class="img-fluid"
							alt="..." height="100%">
					</div>
					<div class="col-md-7">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">
							<span>
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  									<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
  									<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
							</svg>
								120.000
						    </span>
							</p>
							<p class="card-text">
								<small class="text-muted">Watch</small>
							</p>
						</div>
					</div>
				</div>
				</div>
				<div class="card mb-3 border-1 shadow-sm rounded">
				<div class="row g-0">
					<div class="col-md-5 d-flex justify-content-center">
						<img src="https://www.fillmurray.com/640/360" class="img-fluid"
							alt="..." height="100%">
					</div>
					<div class="col-md-7">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">
							<span>
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  									<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
  									<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
							</svg>
								120.000
						    </span>
							</p>
							<p class="card-text">
								<small class="text-muted">Watch</small>
							</p>
						</div>
					</div>
				</div>
				</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>