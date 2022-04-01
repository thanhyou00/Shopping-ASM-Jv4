	
	<%-- Header --%>
	<nav class="navbar navbar-expand-lg navbar-white bg-white fixed-top shadow-sm rounded" style="padding: 0">
		<div class="container-fluid">
			<button class="navbar-toggler bg-primary mt-3" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01"
				aria-controls="navbarTogglerDemo01" aria-expanded="false"
				aria-label="Toggle navigation">
				<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
					fill="white" class="bi bi-justify" viewBox="0 0 16 16">
  						<path fill-rule="evenodd"
						d="M2 12.5a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z" />
					</svg>
			</button>
			<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
				<a class="navbar-brand fw-bold fs-4 mx-3" href="/ASM/start">
					<img alt="logo" class="img-fluid" src="/ASM/public/images/logo.svg" width="70px" height="70px">
				</a>
			<ul class="navbar-nav me-auto mt-2 px-5 text-uppercase">
				<li class="nav-item"><a class="nav-link text-black fw-bold"
					href="/ASM/home"> <fmt:message key="menu.home"></fmt:message> </a></li>
				<li class="nav-item"><a class="nav-link text-black fw-bold"
					href="/ASM/sales"> <fmt:message key="menu.sale"></fmt:message> </a></li>
				<li class="nav-item"><a class="nav-link text-black fw-bold"
					href="/ASM/feedback"><fmt:message key="menu.feedback"></fmt:message></a></li>
				<li class="nav-item"><a class="nav-link text-black fw-bold"
					href="/ASM/services">Services</a></li>
				<li class="nav-item"><a class="nav-link text-black fw-bold"
					href="/ASM/blogs"> <fmt:message key="menu.blog"></fmt:message> </a></li>
				<li class="nav-item"><a class="nav-link text-black fw-bold"
					href="/ASM/about"> <fmt:message key="menu.about"></fmt:message> </a></li>
			</ul>
			<form class="d-flex mx-5">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 text-uppercase">
							
				<li class="dropdown m-2">
				<span class="badge rounded-pill bg-danger">6</span>
				<span role="button" id="dropdownCart" data-bs-toggle="dropdown" aria-expanded="false">
    				<svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="black" class="bi bi-cart4" viewBox="0 0 16 16">
  						<path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
					</svg>
  				</span>
				  <ul class="dropdown-menu mt-3 shadow-sm" aria-labelledby="dropdownCart" style="width: 330px">
				  <span class="text-secondary fw-bold px-1">New products</span>
				    <li class="dropdown-item">
				    	<div class="row">
				    		<div class="col-2">
				    		<img src="https://giayxshop.vn/wp-content/uploads/2021/04/z2437535556835_fec0d759c28542683684d8da8826f2e5-scaled.jpg" 
							class="" alt="product" width="40px" height="40px">
				    		</div>
				    		<div class="col-5">
				    		<span class="ell">Nike Jordan 1 Low Xanh</span>
				    		</div>
				    		<div class="col-3"> <span class="text-red">1250.000 VND</span> </div>
				    	</div>
				    </li>
				    <li class="dropdown-item">
				    	<div class="row">
				    		<div class="col-2">
				    		<img src="https://giayxshop.vn/wp-content/uploads/2021/04/z2437535556835_fec0d759c28542683684d8da8826f2e5-scaled.jpg" 
							class="" alt="product" width="40px" height="40px">
				    		</div>
				    		<div class="col-5">
				    		<span class="ell">Nike Jordan 1 Low Xanh</span>
				    		</div>
				    		<div class="col-3"> <span class="text-red">1250.000 VND</span> </div>
				    	</div>
				    </li>				    
				    <hr/>
				    <div class="row px-3">
				    	<button class="btn btn-primary">
				    		<a href="/ASM/cart" class="text-decoration-none text-white">See now !</a>
				    	</button>
				    </div>
				  </ul>
				</li>
				
				<li class="nav-item dropdown">
					<a class="nav-link text-black fw-bold" role="button" href="#" id="accDropdown" data-bs-toggle="dropdown" aria-expanded="false">
							<img alt="avt" src="${sessionScope.avatarLg}" class="border border-2 border-dark rounded-circle" style="object-fit: contain;width: 30px; height: 30px">
					</a>
						<ul class="dropdown-menu px-2 mt-3" aria-labelledby="accDropdown">
							<c:if test="${ sessionScope.roleLg ==1 }">
								<li><a class="dropdown-item" href="/ASM/my-account"> <fmt:message key="menu.myaccount"></fmt:message> </a></li>
								<li><a class="dropdown-item" role="button" data-bs-toggle="modal" data-bs-target="#passwordModal"> <fmt:message key="menu.changepassword"></fmt:message> </a></li>
								<li><a class="dropdown-item" role="button" data-bs-toggle="modal" data-bs-target="#forgotModal"> <fmt:message key="menu.forgotpassword"></fmt:message> </a></li>
								<li><a class="dropdown-item" href="/ASM/admin"> <fmt:message key="menu.admin"></fmt:message> </a></li>
								<li><a class="dropdown-item" href="/ASM/login"> <fmt:message key="menu.logout"></fmt:message> </a></li>
							</c:if>
							<c:if test="${ sessionScope.roleLg !=1 }">
							<li><a class="dropdown-item" href="/ASM/start"> <fmt:message key="menu.login"></fmt:message> </a></li>
							</c:if>
						</ul>
				</li>
				</ul>
				<div class="mt-2" style="margin-right: 140px">					
					<a class="px-1" href="?lang=en"><span><img src="/ASM/public/images/uk-flag.png" width="24px" height="24px" /></span></a>
					<a class="px-1" href="?lang=vi"><span><img src="/ASM/public/images/vn-flag.png" width="24px" height="24px" /></span></a>
				</div>	
			</form>
		</div>
		</div>
	</nav>
	<br />
	
<!-- Modal change password -->
<div class="modal fade" id="passwordModal" tabindex="-1"
	aria-labelledby="passwordModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="passwordModalLabel">Change password</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<label class="form-label">Old password</label>
				<input type="password" class="form-control" />
				<label class="form-label">New password</label>
				<input type="password" class="form-control" />
			    <label class="form-label">Confirm new password</label>
				<input type="password" class="form-control" />
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" data-bs-dismiss="modal">Save changes</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal forgot password -->
<div class="modal fade" id="forgotModal" tabindex="-1"
	aria-labelledby="forgotModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="forgotModalLabel">Forgot password</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<label class="form-label">Email</label>
				<input type="email" class="form-control" /> <br/>
				<div class="row px-2"><button type="button" class="btn btn-primary">Verify</button></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

  <script>
  var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
  var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
    return new bootstrap.Popover(popoverTriggerEl)
  })
  </script>