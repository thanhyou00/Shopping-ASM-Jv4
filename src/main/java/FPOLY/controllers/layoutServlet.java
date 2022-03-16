package FPOLY.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class indexControllers
 */
@WebServlet({"/start","/home","/history","/login","/signup","/blogs","/detail"})
public class layoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public layoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String uri = request.getRequestURI();
    	if(uri.contains("/ASM/start")) {
    		request.setAttribute("view","/views/subindex.jsp");
    	} else if(uri.contains("/ASM/home")) {
    		request.setAttribute("view","/views/home.jsp");
    	} else if(uri.contains("/ASM/history")) {
    		request.setAttribute("view","/views/history.jsp");
    	} else if(uri.contains("/ASM/login")) {
    		request.setAttribute("view","/views/login.jsp");
    	}  else if(uri.contains("/ASM/signup")) {
    		request.setAttribute("view","/views/signup.jsp");
    	} else if(uri.contains("/ASM/blogs")) {
    		request.setAttribute("view","/views/blogs.jsp");
    	} else if(uri.contains("/ASM/detail")) {
    		request.setAttribute("view","/views/details.jsp");
    	} 
    	request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
