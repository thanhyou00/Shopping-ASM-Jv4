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

@WebServlet({ "/detail/index", "/detail/quantity", "/detail/remove", "/detail/order-now" })
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDAO;
	private OrderDAO orderDAO;
	private OrderDetailDAO orderDetailDAO;
	private UserDAO userDAO;
	private ArrayList<OrderDetail> listDetails;

	public DetailServlet() {
		super();
		this.productDAO = new ProductDAO();
		this.orderDAO = new OrderDAO();
		this.userDAO = new UserDAO();
		this.orderDetailDAO = new OrderDetailDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("index")) {
			this.index(request, response);
		} else if (uri.contains("quantity")) {
			this.quantity(request, response);
		} else if (uri.contains("remove")) {
			this.remove(request, response);
		} else if (uri.contains("order-now")) {
			this.orderNow(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("order-now")) {
			this.orderNow(request, response);
		}
	}

	protected void index(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int quantity = 1;
		int id;
		ArrayList<OrderDetail> listDetails;
		if (request.getParameter("prid") != null) {
			id = Integer.parseInt(request.getParameter("prid"));
			Product product = productDAO.findById(id);
			if (product != null) {
				quantity = Integer.parseInt(request.getParameter("quantity"));
			}
			HttpSession session = request.getSession();
			if (session.getAttribute("order") == null) {
				Order order = new Order();
				listDetails = new ArrayList<OrderDetail>();
				OrderDetail listDetail = new OrderDetail();
				listDetail.setQuantity(quantity);
				listDetail.setProduct(product);
				listDetails.add(listDetail);
				order.setOrderDetails(listDetails);
				listDetail.setOrder(order);
				session.setAttribute("order", order);
			} else { // repeat add to cart
				Order order = (Order) session.getAttribute("order");
				listDetails = (ArrayList<OrderDetail>) order.getOrderDetails();
				boolean check = false;
				for (OrderDetail orderDetail : listDetails) {
					if (orderDetail.getProduct().getId() == product.getId()) {
						check = true;
					}
				}
				if (check == false) {
					OrderDetail orderDetail = new OrderDetail();
					orderDetail.setQuantity(quantity);
					orderDetail.setProduct(product);
					listDetails.add(orderDetail);
				}
				session.setAttribute("order", order);
			}
		}
		request.getRequestDispatcher("/views/details.jsp").forward(request, response);
	}

	protected void quantity(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		Order order = (Order) session.getAttribute("order");
		listDetails = (ArrayList<OrderDetail>) order.getOrderDetails();
		if (action.equals("inc")) {
			for (OrderDetail orderDetail : listDetails) {
				if (orderDetail.getProduct().getId() == id) {
					int quantity = orderDetail.getQuantity();
					quantity++;
					orderDetail.setQuantity(quantity);
					response.sendRedirect("/ASM/detail/index");
				}
			}
		} else {
			for (OrderDetail orderDetail : listDetails) {
				if (orderDetail.getProduct().getId() == id) {
					int quantity = orderDetail.getQuantity();
					if (quantity == 1) {
						orderDetail.setQuantity(quantity);
						response.sendRedirect("/ASM/detail/index");
					} else {
						quantity--;
						orderDetail.setQuantity(quantity);
						response.sendRedirect("/ASM/detail/index");
					}
				}
			}
		}
	}

	protected void remove(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		Order order = (Order) session.getAttribute("order");
		listDetails = (ArrayList<OrderDetail>) order.getOrderDetails();
		for (OrderDetail orderDetail : listDetails) {
			if (orderDetail.getProduct().getId() == id) {
				listDetails.remove(listDetails.indexOf(orderDetail));
				break;
			}
		}
		response.sendRedirect("/ASM/detail/index");
	}

	protected void orderNow(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			int productId = Integer.parseInt(request.getParameter("id"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			SimpleDateFormat formater = new SimpleDateFormat("dd-MM-yyyy");
			Date date = new Date();
			User usId = (User) session.getAttribute("user");
			if (usId != null) {
				Order order = new Order();
				OrderDetail odetail = new OrderDetail();
				User user = this.userDAO.findById(usId.getId());
				Product product = this.productDAO.findById(productId);
				order.setUser(user);
				order.setOrderStatus(0);
				order.setShippingAddress(request.getParameter("address"));
				order.setOrderDate(formater.format(date));
				odetail.setOrder(order);
				odetail.setProduct(product);
				odetail.setQuantity(quantity);
				this.orderDAO.create(order);
				this.orderDetailDAO.create(odetail);
				if (this.orderDAO.create(order) != null) {
					Order orde = (Order) session.getAttribute("order");
					listDetails = (ArrayList<OrderDetail>) orde.getOrderDetails();
					for (OrderDetail orderDetail : listDetails) {
						if (orderDetail.getProduct().getId() == productId) {
							listDetails.remove(listDetails.indexOf(orderDetail));
							break;
						}
					}
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
