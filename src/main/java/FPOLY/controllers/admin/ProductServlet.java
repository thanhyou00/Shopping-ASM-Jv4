package FPOLY.controllers.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import FPOLY.dao.ProductDAO;

@WebServlet({"/admin/products/index","/admin/products/create","/admin/products/update","/admin/products/delete"})
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO DAO; 
    public ProductServlet() {
        super();
        this.DAO = new ProductDAO();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String uri = request.getRequestURI();
    	if(uri.contains("index")) {
    		this.index(request, response);
    	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setAttribute("list", DAO.findAll());
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("viewAdmin","/views/admin/product.jsp");
		request.getRequestDispatcher("/views/admin.jsp").forward(request, response);		
	}

}
