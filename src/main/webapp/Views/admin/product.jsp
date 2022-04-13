<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<h3>Manage products</h3>
<div class="row mt-3">
	<div class="col-3">
		<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modal_add_id">
			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
		  		<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
		  		<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
			</svg>
			Add a new product
		</button>
			<!-- Modal add -->
			<div class="modal fade" id="modal_add_id"
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
								<form action="/ASM/admin/products/create" method="post">
									<label class="form-label">Name</label>
									<input type="text" name="name" class="form-control" required="required" 
									oninvalid="this.setCustomValidity('Không được để trống name')"
									oninput="this.setCustomValidity('')"									
									/> 
									<label class="form-label">Price</label>
									<input type="text" name="price" class="form-control" required="required" 
									oninvalid="this.setCustomValidity('Không được để trống price')"
									oninput="this.setCustomValidity('')"									
									/>
									<label class="form-label">Image</label>
									<input type="text" name="image" class="form-control" required="required"
									oninvalid="this.setCustomValidity('Không được để trống image')"
									oninput="this.setCustomValidity('')"									
									 />
									<label class="form-label">Descriptions</label>
									<input type="text" name="descriptions" class="form-control" required="required"
									oninvalid="this.setCustomValidity('Không được để trống descriptions')"
									oninput="this.setCustomValidity('')"									
									 />
									<label class="form-label">Color</label>
									<input type="text" name="color" class="form-control" required="required"
									oninvalid="this.setCustomValidity('Không được để trống color')"
									oninput="this.setCustomValidity('')"									
									 />
									<label class="form-label">Size</label>
									<select class="form-select" name="size">
										<option value="XS">XS</option>
										<option value="S">S</option>
										<option value="M">M</option>
										<option value="L">L</option>
										<option value="XL">XL</option>
									</select>
									<label class="form-label">Brand</label>
									<input type="text" name="brand" class="form-control" required="required" 
									oninvalid="this.setCustomValidity('Không được để trống brand')"
									oninput="this.setCustomValidity('')"									
									/>
								<div class="mt-3">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
									<button data-bs-dismiss="modal" class="btn btn-danger">Add</button>
								</div>																																																					
								</form>
							</div>
						</div>
					</div>
			</div>				
	</div>
	<div class="col-3">
 		 <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_import_excel">Import from Excel file</button>
			<!-- Modal excel -->
			<div class="modal fade" id="modal_import_excel"
					tabindex="-1" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Import Excel file</h5>
								<button type="button"
								class="btn-close"
								data-bs-dismiss="modal"
								aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form action="/ASM/admin/products/excel" method="post" enctype="multipart/form-data">
								<input class="form-control bg-primary text-white" type="file" id="formFile" 
								name="excelfile">
								<div class="mt-3">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
									<button data-bs-dismiss="modal" class="btn btn-danger">Add</button>
								</div>																																																					
								</form>
							</div>
						</div>
					</div>
			</div> 		 
	</div>
	<div class="col-5">
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
					<th>Name</th>
					<th>Price</th>
					<th>Image</th>
					<th>Descriptions</th>
					<th>Color</th>
					<th>Size</th>
					<th>Brand</th>
					<th colspan="2">Handle</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="product" items="${listPagination}">
				<tr>
					<th>${ product.name }</th>
					<th style="color: red">${ product.price }</th>
					<th>${ product.image }</th>
					<th>${ product.descriptions }</th>
					<th>${ product.color }</th>
					<th>${ product.size }</th>
					<th>${ product.brand }</th>
					<td class="text-center">
					<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_update_${ product.id }">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
  							<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
						</svg>
					</button>
					<div class="modal fade" id="modal_update_${ product.id }"
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
									<form action="/ASM/admin/products/update?id=${product.id}" method="post">
										<div class="modal-body" style="text-align: left;" >
											<label class="label-control mt-1">Name</label>
											<input class="form-control" type="text" name="name" value="${product.name}" />
											<label class="label-control mt-1">Price</label>
											<input class="form-control" type="text" name="price" value="${product.price}" />	
											<label class="label-control mt-1">Image</label>
											<input class="form-control" type="text" name="image" value="${product.image}" />		
											<label class="label-control mt-1">Descriptions</label>
											<input class="form-control" type="text" name="descriptions" value="${product.descriptions}" />		
											<label class="label-control mt-1">Color</label>
											<input class="form-control" type="text" name="color" value="${product.color}" />	
											<label class="label-control mt-1">Size</label>
											<input class="form-control" type="text" name="size" value="${product.size}" />	
											<label class="label-control mt-1">Brand</label>
											<input class="form-control" type="text" name="brand" value="${product.brand}" />																																																										
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
											<button class="btn btn-primary">Update</button>
										</div>
									</form>
								</div>
							</div>
						</div>					
					</td>
					<td class="text-center">
					<button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modal_delete_${ product.id }">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
  							<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
  							<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
						</svg>
					</button>
					<!-- Modal delete -->
					<div class="modal fade" id="modal_delete_${ product.id }"
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
										<a href="/ASM/admin/products/delete?id=${ product.id }" type="button" class="btn btn-danger">Delete</a>
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
<c:remove var="display" scope="session" />