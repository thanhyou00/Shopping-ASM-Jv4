package FPOLY.controllers.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FPOLY.dao.HistoryDAO;
import FPOLY.entities.History;
import FPOLY.entities.User;

@WebServlet("/history")
public class HistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HistoryDAO historyDAO;
	private static List<Object[]> list;
    public HistoryServlet() {
        super();
        this.historyDAO=new HistoryDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			User user = (User) session.getAttribute("user");
			list = this.historyDAO.history(user.getId());
			   ArrayList<History> hisList = null;
			   Integer quantity = null,status = null;
			   String name = null, image = null;
			   Double price = null;
			   for (Object[] obj : list) {
				    quantity = (Integer) obj[0];
				    name = (String) obj[1];
				    image = (String) obj[2];
				    price = (Double) obj[3];
				    status = (Integer) obj[4];
				    hisList = new ArrayList<History>();
				    hisList.add(new History(quantity,name,image,price,status));
				    System.out.println("quantity : "+ quantity );
				    System.out.println("list : "+ hisList );
				}
			   for (History history : hisList) {
				System.out.println("check : "+ history.getName());
			}
			   request.setAttribute("historyUser", hisList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/views/history.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
