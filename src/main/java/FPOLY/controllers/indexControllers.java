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
@WebServlet({"/index","/home","/history","/login"})
public class indexControllers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public indexControllers() {
        super();
        // TODO Auto-generated constructor stub
    }
    	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String uri = request.getRequestURI();
    	if(uri.contains("/ASM/index")) {
    		request.setAttribute("view","/views/subindex.jsp");
    	} else if(uri.contains("/ASM/home")) {
    		request.setAttribute("view","/views/home.jsp");
    	} else if(uri.contains("/ASM/history")) {
    		request.setAttribute("view","/views/history.jsp");
    	}
//		request.setAttribute("view", "/views/subindex.jsp");
    	request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPOST");
	}

}
