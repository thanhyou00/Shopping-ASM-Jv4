package FPOLY.controllers.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import FPOLY.dao.UserDAO;
import FPOLY.entities.User;


@WebServlet({"/admin/users/index","/admin/users/create","/admin/users/update","/admin/users/delete"})
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	
    public UserServlet() {
        super();
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
		try {
			request.setAttribute("listUser", userDAO.findAll());
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("viewAdmin","/views/admin/user.jsp");
		request.getRequestDispatcher("/views/admin.jsp").forward(request, response);
	}

	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			User entity = new User();
			BeanUtils.populate(entity, request.getParameterMap());
			this.userDAO.create(entity);
			response.sendRedirect("/ASM/admin/users/index");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/ASM/admin/users/index");
		}
	}
	
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String idStr = request.getParameter("id");
			try {
				int id = Integer.parseInt(idStr);
				User entity = this.userDAO.findById(id);
				this.userDAO.delete(entity);
			} catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("/ASM/admin/users/index");
	}
	
	protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id");
		try {
			int id = Integer.parseInt(idStr);
			User oldEntity = this.userDAO.findById(id);
			User newEntity = new User();
			BeanUtils.populate(newEntity, request.getParameterMap());
			newEntity.setPassword(oldEntity.getPassword());
			newEntity.setId(oldEntity.getId());
			this.userDAO.update(newEntity);
			response.sendRedirect("/ASM/admin/users/index");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/ASM/admin/users/index");
		}
	}

}





