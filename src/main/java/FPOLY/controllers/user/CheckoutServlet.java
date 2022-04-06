package FPOLY.controllers.user;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FPOLY.dao.OrderDAO;
import FPOLY.dao.UserDAO;
import FPOLY.entities.Order;
import FPOLY.entities.OrderDetail;
import FPOLY.entities.User;

@WebServlet({"/checkout/index","/checkout/payment"})
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDAO orderDAO;
	private UserDAO userDAO;
	private ArrayList<OrderDetail> listDetails;
	
    public CheckoutServlet() {
        super();
        this.userDAO = new UserDAO();
        this.orderDAO = new OrderDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		if(uri.contains("index")) {
			this.index(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		if(uri.contains("payment")) {
			this.payment(request, response);
		}
	}
	protected void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/checkout.jsp").forward(request, response);
	}
	protected void payment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String address = request.getParameter("address");
			SimpleDateFormat formater = new SimpleDateFormat("dd-MM-yyyy");
			Date date = new Date();
			if (session.getAttribute("idLg") != null) {
				Order order = new Order();
				User user = this.userDAO.findById((int) session.getAttribute("idLg"));
				order.setUser(user);
				order.setOrderStatus(0);
				order.setShippingAddress(address);
				order.setOrderDate(formater.format(date));
				this.orderDAO.create(order);
				if (this.orderDAO.create(order) != null) {
					Order orde = (Order) session.getAttribute("order");
					listDetails = (ArrayList<OrderDetail>) orde.getOrderDetails();
					listDetails.clear();;
					response.sendRedirect("/ASM/detail/index");
				}
			} else {
				response.sendRedirect("/ASM/login");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
