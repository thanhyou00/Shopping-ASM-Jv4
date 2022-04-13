package FPOLY.controllers.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import FPOLY.dao.CategoryDAO;
import FPOLY.dao.UserDAO;
import FPOLY.entities.Category;


@WebServlet({"/admin/categories/index","/admin/categories/create","/admin/categories/update","/admin/categories/delete"})
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryDAO categoryDAO;
	private UserDAO userDAO;
	
    public CategoryServlet() {
        super();
        this.categoryDAO = new CategoryDAO();
        this.userDAO = new UserDAO();
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
		String indexStr = request.getParameter("index");
		try {
			request.setAttribute("listUser", this.userDAO.findAll());
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(indexStr==null) {
			indexStr ="1";
		}
		try {
			int index = Integer.parseInt(indexStr);
			long count = this.categoryDAO.getTotalCategory();
			long endPage = count/5;
			if(count%5!=0) {
				endPage++;
			}
			request.setAttribute("isActive", index);
			request.setAttribute("endPage", endPage);
			request.setAttribute("total", count);
			request.setAttribute("listPagination", this.categoryDAO.pagination(index,5));
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("viewAdmin","/views/admin/category.jsp");
		request.getRequestDispatcher("/views/admin.jsp").forward(request, response);
	}

	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		try {
			Category entity = new Category();
			BeanUtils.populate(entity, request.getParameterMap());
			session.setAttribute("messageupdateSuccess", "Your category has been created !");
			session.setAttribute("display", "show");
			this.categoryDAO.create(entity);
			response.sendRedirect("/ASM/admin/categories/index");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("messageupdateSuccess", "Your category doesnt have been created !");
			session.setAttribute("display", "show");
			response.sendRedirect("/ASM/admin/categories/index");
		}
	}
	
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String idStr = request.getParameter("id");
			HttpSession session = request.getSession();
			try {
				int id = Integer.parseInt(idStr);
				Category entity = this.categoryDAO.findById(id);
				session.setAttribute("messageupdateSuccess", "Your category has been deleted !");
				session.setAttribute("display", "show");
				this.categoryDAO.delete(entity);
			} catch (Exception e) {
				e.printStackTrace();
				session.setAttribute("messageupdateSuccess", "Your category doesnt have been deleted !");
				session.setAttribute("display", "show");
			}
			response.sendRedirect("/ASM/admin/categories/index");
	}
	
	protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		try {
			Category newEntity = new Category();
			BeanUtils.populate(newEntity, request.getParameterMap());
			session.setAttribute("messageupdateSuccess", "Your category has been updated !");
			session.setAttribute("display", "show");
			this.categoryDAO.update(newEntity);
			response.sendRedirect("/ASM/admin/categories/index");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("messageupdateSuccess", "Your category doesnt have been updated !");
			session.setAttribute("display", "show");
			response.sendRedirect("/ASM/admin/categories/index");
		}
	}

}
