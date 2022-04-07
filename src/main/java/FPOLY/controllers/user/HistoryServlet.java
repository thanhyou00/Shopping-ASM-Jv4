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

@WebServlet("/history")
public class HistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HistoryDAO historyDAO;
	private List<Object[]> list;
    public HistoryServlet() {
        super();
        this.historyDAO=new HistoryDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			int iduser =Integer.valueOf(session.getAttribute("idLg").toString());
			list = this.historyDAO.history(iduser);
//			request.setAttribute("historyUser", list);
			   ArrayList<History> hisList = null;
			   for (Object[] obj : list) {
				    Integer quantity = (Integer) obj[0];
				    String name = (String) obj[1];
				    String image = (String) obj[2];
				    Double price = (Double) obj[3];
				    Integer status = (Integer) obj[4];

				    hisList = new ArrayList<History>();
				    hisList.add(new History(quantity,name,image,price,status));
				}
			   System.out.println("list : "+ hisList );
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
