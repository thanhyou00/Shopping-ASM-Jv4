package FPOLY.controllers.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import FPOLY.dao.ProductDAO;
import FPOLY.entities.Product;

@WebServlet({"/admin/products/index","/admin/products/create","/admin/products/update","/admin/products/delete"})
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDAO; 
    public ProductServlet() {
        super();
        this.productDAO = new ProductDAO();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String uri = request.getRequestURI();
    	if(uri.contains("index")) {
    		this.index(request, response);
    	} else if(uri.contains("delete")) {
    		this.delete(request, response);
    	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		if(uri.contains("create")) {
			this.create(request, response);
		} else if(uri.contains("update")) {
			this.update(request, response);
		} else {
			request.getRequestDispatcher("/views/404.jsp").forward(request, response);
		}
	}
	
	public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setAttribute("listProduct", productDAO.findAll());
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("viewAdmin","/views/admin/product.jsp");
		request.getRequestDispatcher("/views/admin.jsp").forward(request, response);		
	}
	
	public void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			Product product = new Product();
			BeanUtils.populate(product, request.getParameterMap());
			this.productDAO.create(product);
			response.sendRedirect("/ASM/admin/products/index");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/ASM/admin/products/index");
		}	
	}
	
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id");
		try {
			int id = Integer.parseInt(idStr);
			Product entity = this.productDAO.findById(id);
			this.productDAO.delete(entity);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		response.sendRedirect("/ASM/admin/products/index");
	}
	
	protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			Product newEntity = new Product();
			BeanUtils.populate(newEntity, request.getParameterMap());
			this.productDAO.update(newEntity);
			response.sendRedirect("/ASM/admin/products/index");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/ASM/admin/products/index");
		}
	}

}
