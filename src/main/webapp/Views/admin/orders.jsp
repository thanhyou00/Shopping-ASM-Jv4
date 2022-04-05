<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<h3>Manage orders</h3>
<div class="row mt-3">
	<div class="col-7">			
	</div>
	<div class="col-4">
	<input class="form-control" type="text" placeholder="Type here to search..."/> 
	</div>
	<div class="col-1">
		<button type="button" class="btn btn-primary">Search</button>
	</div>
</div>

  <div class="row table-responsive border border-2 mt-5">
  		<table class="table table-hover">
			<thead class="text-start">
				<tr>
					<th>UserID</th>
					<th>Shipping address</th>
					<th>Order Date</th>
					<th>Status</th>
					<th colspan="2">Handle</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${listOrder}" var="order">
				<tr>
					<td>${ order.user.id }</td>
					<td>${ order.shippingAddress }</td>
					<td>${ order.orderDate }</td>
					<td> <span class="badge bg-secondary">${ order.orderStatus==1?"Verified":"Unverify" }</span> </td>
					<td class="text-center">
					<button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modal_update_1">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
						  <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
						</svg>
					</button>
					<div class="modal fade" id="modal_update_1"
							tabindex="-1" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Alert</h5>
										<button type="button"
										class="btn-close"
										data-bs-dismiss="modal"
										aria-label="Close"></button>
									</div>
									<form action="/ASM/admin/users/update?id=1" method="post">

										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
											<button class="btn btn-primary" >Update</button>								
										</div>	
									</form>
								</div>
							</div>
						</div>
					</td>
					<td class="text-center">
					<button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modal_delete_1">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
						  <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
						  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
						</svg>
					</button>
						<div class="modal fade" id="modal_delete_1"
							tabindex="-1" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Alert</h5>
										<button type="button"
										class="btn-close"
										data-bs-dismiss="modal"
										aria-label="Close"></button>
									</div>
									<div class="modal-body">
									<h4>Do you want to delete it ?</h4>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
										<a type="button" class="btn btn-danger"  href="/ASM/admin/users/delete?id=1">Delete</a>							
									</div>
								</div>
							</div>
						</div>
				</td>
				</tr>
				</c:forEach>																										
			</tbody>
		</table>
	<div class="row">
		<div class="col-6 d-flex justify-content-start align-items-center text-secondary">Showing 5 out of ${ total } entries</div>
		<div class="col-6 d-flex justify-content-end">
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
			    	<li class="page-item px-1"><a class="page-link ${isActive==i?"active":"unactive"}" href="/ASM/admin/products/index?index=${i}">${i}</a></li>
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
<div class="alert alert-success ${sessionScope.display=='show'?'':'d-none'}" role="alert" style="right: 30px; bottom: 30px;width: auto;position: fixed;">
	<span>
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
 				<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
		</svg>
	</span>
 			${sessionScope.messageupdateSuccess}
</div>
	
	
