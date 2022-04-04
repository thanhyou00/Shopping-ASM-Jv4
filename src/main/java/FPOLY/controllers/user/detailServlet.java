package FPOLY.controllers.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import FPOLY.dao.OrderDetailDAO;
import FPOLY.dao.ProductDAO;
import FPOLY.entities.Order;
import FPOLY.entities.OrderDetail;
import FPOLY.entities.Product;


@WebServlet({"/detail/index","/detail/quantity","/detail/remove"})
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDAO;
	private OrderDetailDAO orderDetailDAO;
	private ArrayList<OrderDetail> listDetails;
    public DetailServlet() {
        super();
        this.productDAO = new ProductDAO();
        this.orderDetailDAO = new OrderDetailDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		if(uri.contains("index")) {
			this.index(request, response);
		} else if(uri.contains("quantity")) {
			this.quantity(request, response);
		}else if(uri.contains("remove")) {
			this.remove(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/details.jsp").forward(request, response);
	}
	protected void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int quantity = 1;
		int id;
		ArrayList<OrderDetail> listDetails;
		if(request.getParameter("prid")!=null) {
			id = Integer.parseInt(request.getParameter("prid"));
			Product product = productDAO.findById(id);
			if(product!=null) {
				quantity = Integer.parseInt(request.getParameter("quantity"));
			}
			HttpSession session = request.getSession();
			if(session.getAttribute("order")==null) {
				Order order = new Order();
				listDetails = new ArrayList<OrderDetail>();				
				OrderDetail listDetail = new OrderDetail();
				listDetail.setQuantity(quantity);
				listDetail.setProduct(product);	
				listDetails.add(listDetail);
				order.setOrderDetails(listDetails);
				listDetail.setOrder(order);
				session.setAttribute("order", order);
			}
			else { // repeat add to cart 
				Order order = (Order) session.getAttribute("order");
				listDetails = (ArrayList<OrderDetail>) order.getOrderDetails();
				boolean check = false;
				for (OrderDetail orderDetail : listDetails) {
					if(orderDetail.getProduct().getId()==product.getId()) {
						check = true;
					}
				}
				if(check==false) {
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
	protected void quantity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		Order order = (Order) session.getAttribute("order");
		listDetails = (ArrayList<OrderDetail>) order.getOrderDetails();
			if(action.equals("inc")) {
				for (OrderDetail orderDetail : listDetails) {
					if(orderDetail.getProduct().getId()==id) {
						int quantity = orderDetail.getQuantity();
						quantity++;
						orderDetail.setQuantity(quantity);
						response.sendRedirect("/ASM/detail/index");
					}
				}
			} else {
				for (OrderDetail orderDetail : listDetails) {
					if(orderDetail.getProduct().getId()==id) {
						int quantity = orderDetail.getQuantity();
						if(quantity==1) {
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
	protected void remove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		Order order = (Order) session.getAttribute("order");
		listDetails = (ArrayList<OrderDetail>) order.getOrderDetails();	
		for (OrderDetail orderDetail : listDetails) {
			if(orderDetail.getProduct().getId()==id) {
				listDetails.remove(listDetails.indexOf(orderDetail));
				break;
			}
		}
		response.sendRedirect("/ASM/detail/index");
	}

}
