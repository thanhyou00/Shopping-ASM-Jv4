package FPOLY.controllers.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import FPOLY.dao.OrderDAO;
import FPOLY.entities.Order;

@WebServlet({"/admin/orders/index","/admin/orders/status"})
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private OrderDAO orderDAO; 
    public OrderServlet() {
        super();
        this.orderDAO = new OrderDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		if(uri.contains("index")) {
			this.index(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	
	protected void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String indexStr = request.getParameter("index");
		if(indexStr==null) {
			indexStr ="1";
		}
		int index = Integer.parseInt(indexStr);
		long count = this.orderDAO.getTotalOrder();
		long endPage = count/5;
		if(count%5!=0) {
			endPage++;
		}
		request.setAttribute("isActive", index);
		request.setAttribute("endPage", endPage);
		request.setAttribute("total", count);
		try {
			request.setAttribute("listOrder", this.orderDAO.findAll(index,5));
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("viewAdmin","/views/admin/orders.jsp");
		request.getRequestDispatcher("/views/admin.jsp").forward(request, response);
	}

}
