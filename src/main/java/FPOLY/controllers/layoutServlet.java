package FPOLY.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/start")
public class LayoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LayoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String uri = request.getRequestURI();
    	if(uri.contains("/ASM/start")) {
    		request.setAttribute("view","/views/subindex.jsp");
    	} else {
    		request.setAttribute("view","/views/404.jsp");
    	}
    	request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
