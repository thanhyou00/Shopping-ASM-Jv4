package FPOLY.controllers.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class adminServlet
 */
@WebServlet("/admin")
public class adminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public adminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
    	if(uri.contains("/ASM/admin")) {
    		request.setAttribute("viewAdmin","/views/admin/blog.jsp");
    	} else if(uri.contains("/ASM/dashboard")) {
    		request.setAttribute("viewAdmin","/views/admin/dashboard.jsp");    		
    	}
		request.getRequestDispatcher("/views/admin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/admin.jsp").forward(request, response);
	}

}
