package FPOLY.controllers.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import FPOLY.dao.UserDAO;


@WebServlet({"/admin/users/index","/admin/users/create","/admin/users/update","/admin/users/delete"})
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO DAO;
	
    public UserServlet() {
        super();
        this.DAO = new UserDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		if(uri.contains("index")) {
			this.index(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/admin.jsp").forward(request, response);
	}
	
	protected void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setAttribute("listUser", DAO.findAll());
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("viewAdmin","/views/admin/user.jsp");
		request.getRequestDispatcher("/views/admin.jsp").forward(request, response);
	}

}
