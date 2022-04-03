package FPOLY.controllers.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FPOLY.dao.OrderDetailDAO;
import FPOLY.dao.ProductDAO;
import FPOLY.entities.Order;
import FPOLY.entities.OrderDetail;
import FPOLY.entities.Product;


@WebServlet("/detail")
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDAO;
	private OrderDetailDAO orderDetailDAO;
    public DetailServlet() {
        super();
        this.productDAO = new ProductDAO();
        this.orderDetailDAO = new OrderDetailDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int quantity = 1;
		int id;
		if(request.getParameter("prid")!=null) {
			id = Integer.parseInt(request.getParameter("prid"));
			Product product = productDAO.findById(id);
			if(product!=null) {
				quantity = Integer.parseInt(request.getParameter("quantity"));
			}
			HttpSession session = request.getSession();
			if(session.getAttribute("order")==null) {
				Order order = new Order();
				ArrayList<OrderDetail> listDetails = new ArrayList<OrderDetail>();				
				OrderDetail listDetail = new OrderDetail();
				listDetail.setQuantity(quantity);
				listDetail.setProduct(product);	
				listDetails.add(listDetail);
				order.setOrderDetails(listDetails);
				listDetail.setOrder(order);
//				try {
//					this.orderDetailDAO.create(listDetail);
//					System.out.println("oke done:))");
//				} catch (Exception e) {
//					e.printStackTrace();
//					System.out.println("oh no");
//				}
				session.setAttribute("order", order);
			}else { // repeat add to cart 
				Order order = (Order) session.getAttribute("order");
				List<OrderDetail> listDetails = order.getOrderDetails();
				boolean check = false;
				for (OrderDetail orderDetail : listDetails) {
					if(orderDetail.getProduct().getId()==product.getId()) {
						orderDetail.setQuantity(orderDetail.getQuantity()+quantity);
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/details.jsp").forward(request, response);
	}

}
