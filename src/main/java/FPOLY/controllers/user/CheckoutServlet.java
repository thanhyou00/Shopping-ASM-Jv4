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
import FPOLY.dao.OrderDetailDAO;
import FPOLY.dao.ProductDAO;
import FPOLY.dao.UserDAO;
import FPOLY.entities.Order;
import FPOLY.entities.OrderDetail;
import FPOLY.entities.Product;
import FPOLY.entities.User;

@WebServlet({"/checkout/index","/checkout/payment"})
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDAO orderDAO;
	private UserDAO userDAO;
	private ProductDAO productDAO;
	private OrderDetailDAO orderDetailDAO;
	private ArrayList<OrderDetail> listDetails;
	
    public CheckoutServlet() {
        super();
        this.userDAO = new UserDAO();
        this.orderDAO = new OrderDAO();
        this.orderDetailDAO = new OrderDetailDAO();
        this.productDAO = new ProductDAO();
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			HttpSession session = request.getSession();
			String address = request.getParameter("address");
			SimpleDateFormat formater = new SimpleDateFormat("dd-MM-yyyy");
			Date date = new Date();
			User userId = (User) session.getAttribute("user");
			if (userId != null) {
				Order order = new Order();
				OrderDetail odetail = new OrderDetail();
				User user = this.userDAO.findById(userId.getId());
				Product product = this.productDAO.findById((int) session.getAttribute("proId"));
				order.setUser(user);
				order.setOrderStatus(0);
				order.setShippingAddress(address);
				order.setOrderDate(formater.format(date));
				odetail.setOrder(order);
				odetail.setProduct(product);
				odetail.setQuantity((int)session.getAttribute("quantityCheckout"));
				this.orderDAO.create(order);
				this.orderDetailDAO.create(odetail);
				if (this.orderDAO.create(order) != null) {
					Order orde = (Order) session.getAttribute("order");
					listDetails = (ArrayList<OrderDetail>) orde.getOrderDetails();
					listDetails.clear();
					session.setAttribute("messageSuccess", "Your orded to this cart successful !");
					session.setAttribute("display", "show");
					response.sendRedirect("/ASM/detail/index");
				}
			} else {
				response.sendRedirect("/ASM/login");
				session.setAttribute("messageSuccess", "Your orded to this cart faild !");
				session.setAttribute("display", "show");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
