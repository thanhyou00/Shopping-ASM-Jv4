package FPOLY.controllers.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import FPOLY.dao.CategoryDAO;
import FPOLY.entities.Category;


@WebServlet({"/admin/categories/index","/admin/categories/create","/admin/categories/update","/admin/categories/delete"})
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryDAO categoryDAO;
	
    public CategoryServlet() {
        super();
        this.categoryDAO = new CategoryDAO();
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
	
	protected void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setAttribute("listCategory", categoryDAO.findAll());
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("viewAdmin","/views/admin/category.jsp");
		request.getRequestDispatcher("/views/admin.jsp").forward(request, response);
	}

	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			Category entity = new Category();
			BeanUtils.populate(entity, request.getParameterMap());
			this.categoryDAO.create(entity);
			response.sendRedirect("/ASM/admin/categories/index");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/ASM/admin/categories/index");
		}
	}
	
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String idStr = request.getParameter("id");
			try {
				int id = Integer.parseInt(idStr);
				Category entity = this.categoryDAO.findById(id);
				this.categoryDAO.delete(entity);
			} catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("/ASM/admin/categories/index");
	}
	
	protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			Category newEntity = new Category();
			BeanUtils.populate(newEntity, request.getParameterMap());
			this.categoryDAO.update(newEntity);
			response.sendRedirect("/ASM/admin/categories/index");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/ASM/admin/categories/index");
		}
	}

}
