package FPOLY.controllers.user;

import java.io.IOException;

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
import FPOLY.utils.EncryptUtil;

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
		HttpSession session = request.getSession();
		try {
			User user = this.userDAO.findByEmail(email);
			boolean check = EncryptUtil.check(password,user.getPassword());
			if (check == true) {
				session.setAttribute("messageLg", "Đăng nhập thành công !");
				// ghi nhớ hoặc xóa tài khoản đã ghi nhớ bằng cookie
				int hours = (remember == null) ? 0 : 30 * 24; // 0 = xóa
				CookieUtils.add("email", email, hours, response);
				CookieUtils.add("password", password, hours, response);
				session.setAttribute("user", user);
				session.setMaxInactiveInterval(7200);
				response.sendRedirect("/ASM/home");
			} else {
				session = request.getSession();
				session.setAttribute("messageLg", "Sai tên đăng nhập hoặc mật khẩu !");
				response.sendRedirect("/ASM/login");		
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
