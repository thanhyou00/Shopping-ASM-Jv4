package FPOLY.controllers.user;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import FPOLY.controllers.cookie.CookieUtils;
import FPOLY.dao.UserDAO;
import FPOLY.entities.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDAO userDAO;
    public LoginServlet() {
        super();
        this.userDAO = new UserDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// đọc giá trị của cookie
		String email = CookieUtils.get("email", request);
		String password = CookieUtils.get("password", request);
		// chuyển sang login.jsp để hiển thị lên form
		request.setAttribute("email", email);
		request.setAttribute("password", password);
		
		request.getRequestDispatcher("/views/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// đọc tham số form đăng nhập
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");
		// kiểm tra tài khoản đăng nhập
		boolean isCheckLogin=false;
		// references : https://stackjava.com/demo/bcrypt-la-gi-code-vi-du-bcrypt-bang-java-jbcrypt.html
		try {
			for (int  i=0; i< userDAO.findAll().size();i++) {
				boolean valuate = BCrypt.checkpw(password, userDAO.findAll().get(i).getPassword());
				if (email.equals(userDAO.findAll().get(i).getEmail()) && valuate) {
					isCheckLogin = true;
					// ghi nhớ hoặc xóa tài khoản đã ghi nhớ bằng cookie
					int hours = (remember == null) ? 0 : 30 * 24; // 0 = xóa
					CookieUtils.add("email", email, hours, response);
					CookieUtils.add("password", password, hours, response);
					HttpSession session = request.getSession();
					session.setAttribute("messageLg", "Đăng nhập thành công !");
					session.setAttribute("roleLg", userDAO.findAll().get(i).getRole());
					session.setAttribute("fullnameLg", userDAO.findAll().get(i).getFullname());
					session.setAttribute("emailLg", userDAO.findAll().get(i).getEmail());
					session.setAttribute("avatarLg", userDAO.findAll().get(i).getAvatar());
				} else {
					HttpSession session = request.getSession();
					session.setAttribute("messageLg", "Sai tên đăng nhập hoặc mật khẩu !");
				}

			}
			
			if(isCheckLogin) {
				response.sendRedirect("/ASM/home");
			}else {
				response.sendRedirect("/ASM/login");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
