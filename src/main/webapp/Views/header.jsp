	
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
				<a class="navbar-brand fw-bold fs-4" href="/ASM/start">
					<img alt="logo" class="img-fluid" src="/ASM/public/images/logo.svg" width="50px" height="50px">
				</a>
			<ul class="navbar-nav me-auto mt-2 px-5 text-uppercase">
				<li class="nav-item"><a class="nav-link text-secondary fw-bold"
					href="/ASM/home"> <fmt:message key="menu.home"></fmt:message> </a></li>
				<li class="nav-item"><a class="nav-link text-secondary fw-bold"
					href="/ASM/favourite"> <fmt:message key="menu.favourite"></fmt:message> </a></li>
				<li class="nav-item"><a class="nav-link text-secondary fw-bold"
					href="/ASM/feedback"><fmt:message key="menu.feedback"></fmt:message></a></li>
				<li class="nav-item"><a class="nav-link text-secondary fw-bold"
					href="/ASM/services">Services</a></li>
				<li class="nav-item"><a class="nav-link text-secondary fw-bold"
					href="/ASM/blogs"> <fmt:message key="menu.blog"></fmt:message> </a></li>
				<li class="nav-item"><a class="nav-link text-secondary fw-bold"
					href="/ASM/history"> <fmt:message key="menu.history"></fmt:message> </a></li>
				<li class="nav-item dropdown"><a
					class="nav-link text-secondary fw-bold dropdown-toggle"
					role="button" href="#" id="langDropdown" data-bs-toggle="dropdown"
					aria-expanded="false"> <fmt:message key="menu.language"></fmt:message> </a>
					<ul class="dropdown-menu" aria-labelledby="langDropdown">
						<li><a class="dropdown-item" href="?lang=en"> English <span><img
									src="/ASM/public/images/uk-flag.png"
									width="24px" height="24px" /></span>
						</a></li>
						<li><a class="dropdown-item" href="?lang=vi"> Vietnamese <span><img
									src="/ASM/public/images/vn-flag.png"
									width="24px" height="24px" /></span>
						</a></li>
					</ul></li>
			</ul>
			<form class="d-flex mx-5">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 text-uppercase">
					<li class="nav-item dropdown"><a
						class="nav-link text-secondary fw-bold dropdown-toggle"
						role="button" href="#" id="accDropdown" data-bs-toggle="dropdown"
						aria-expanded="false">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
  							<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
  							<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
						</svg>
						trucnvph17923</a>
						<ul class="dropdown-menu px-2" aria-labelledby="accDropdown">
							<li><a class="dropdown-item" href="#"> <fmt:message key="menu.myaccount"></fmt:message> </a></li>
							<li><a class="dropdown-item" role="button" data-bs-toggle="modal" data-bs-target="#passwordModal"> <fmt:message key="menu.changepassword"></fmt:message> </a></li>
							<li><a class="dropdown-item" role="button" data-bs-toggle="modal" data-bs-target="#forgotModal"> <fmt:message key="menu.forgotpassword"></fmt:message> </a></li>
							<li><a class="dropdown-item" href="/ASM/login"> <fmt:message key="menu.logout"></fmt:message> </a></li>
						</ul></li>
				</ul>
				
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