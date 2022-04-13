package FPOLY.controllers.admin;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import FPOLY.dao.UserDAO;
import FPOLY.entities.User;
import FPOLY.utils.EncryptUtil;


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
		String indexStr = request.getParameter("index");
		if(indexStr==null) {
			indexStr ="1";
		}
		try {
			int index = Integer.parseInt(indexStr);
			long count = this.userDAO.getTotalUser();
			long endPage = count/5;
			if(count%5!=0) {
				endPage++;
			}
			request.setAttribute("isActive", index);
			request.setAttribute("endPage", endPage);
			request.setAttribute("total", count);
			request.setAttribute("listPagination", this.userDAO.pagination(index,5));
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("viewAdmin","/views/admin/user.jsp");
		request.getRequestDispatcher("/views/admin.jsp").forward(request, response);
	}

	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
        // Start check email
        String regex = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$"; // check regex email 
        boolean matchFound = Pattern.matches(regex, request.getParameter("email"));
        if (!matchFound) {
            session.setAttribute("isEmail", "Nhập sai định dạng email");
            response.sendRedirect("/ASM/login");
            return;
        }
		try {
			User entity = new User();
			BeanUtils.populate(entity, request.getParameterMap());
			entity.setPassword(EncryptUtil.encrypt(request.getParameter("password")));
			entity.setRole(0);
			session.setAttribute("messageupdateSuccess", "Your account has been created !");
			session.setAttribute("display", "show");
			this.userDAO.create(entity);
			response.sendRedirect("/ASM/admin/users/index");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("messageupdateSuccess", "Your account doesnt have been created !");
			session.setAttribute("display", "show");
			response.sendRedirect("/ASM/admin/users/index");
		}
	}
	
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String idStr = request.getParameter("id");
			HttpSession session = request.getSession();
			try {
				int id = Integer.parseInt(idStr);
				User entity = this.userDAO.findById(id);
				session.setAttribute("messageupdateSuccess", "Your account has been deleted !");
				session.setAttribute("display", "show");
				this.userDAO.delete(entity);
			} catch (Exception e) {
				session.setAttribute("messageupdateSuccess", "Your account doesnt have been deleted !");
				session.setAttribute("display", "show");
				e.printStackTrace();
			}
			response.sendRedirect("/ASM/admin/users/index");
	}
	
	protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String idStr = request.getParameter("id");
		HttpSession session = request.getSession();
		try {
			int id = Integer.parseInt(idStr);
			User oldEntity = this.userDAO.findById(id);
			User newEntity = new User();
			BeanUtils.populate(newEntity, request.getParameterMap());
			newEntity.setPassword(oldEntity.getPassword());
			session.setAttribute("messageupdateSuccess", "Your account has been updated !");
			session.setAttribute("display", "show");
			this.userDAO.update(newEntity);
			response.sendRedirect("/ASM/admin/users/index");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("messageupdateSuccess", "Your account doesnt have been updated !");
			session.setAttribute("display", "hide");
			response.sendRedirect("/ASM/admin/users/index");
		}
	}

}





