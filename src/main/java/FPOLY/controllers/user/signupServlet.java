package FPOLY.controllers.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.mindrot.jbcrypt.BCrypt;

import FPOLY.dao.UserDAO;
import FPOLY.entities.User;

@WebServlet({"/signup/index","/signup/create"})
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDAO DAO; 
    private boolean isSignup;
    public SignupServlet() {
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
		String uri = request.getRequestURI();
		if(uri.contains("create")) {
			this.create(request, response);
		} else {
			//404
		}		
	}
	
	protected void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setAttribute("listUser", DAO.findAll());
			if(isSignup) {
				request.setAttribute("message", "Success !");
				request.setAttribute("color", "success");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/views/signup.jsp").forward(request, response);
	}
	
	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			User entity = new User();
			BeanUtils.populate(entity, request.getParameterMap());
			entity.setPassword(BCrypt.hashpw(request.getParameter("password"), BCrypt.gensalt()));
			entity.setRole(0);
			this.DAO.create(entity);
			isSignup = true;
			response.sendRedirect("/ASM/signup/index");
		} catch (Exception e) {
			e.printStackTrace();	
		}
	}

}
