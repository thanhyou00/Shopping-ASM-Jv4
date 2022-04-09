package FPOLY.controllers.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import FPOLY.dao.CategoryDAO;
import FPOLY.dao.ProductDAO;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;  
    private CategoryDAO categoryDAO;
    public HomeServlet() {
        super();
        this.productDAO = new ProductDAO();
        this.categoryDAO = new CategoryDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		if(uri.contains("home")) {
			this.pagination(request, response);
		}
		request.getRequestDispatcher("/views/home.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	
	protected void pagination(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setAttribute("listCategory", this.categoryDAO.findAll());
		} catch (Exception e) {
			e.printStackTrace();
		}
		String indexStr = request.getParameter("index");
		String cateId = request.getParameter("ctid");
		if(indexStr==null) {
			indexStr ="1";
		}
		if(cateId==null) {
			cateId = "1";
		}
		try {
			int index = Integer.parseInt(indexStr);
			int cateid = Integer.parseInt(cateId);
			long count = this.productDAO.paginationHome(index,8,cateid).size();
			long endPage = count/8;
			if(count%8!=0) {
				endPage++;
			}
			request.setAttribute("isActive", index);
			request.setAttribute("endPage", endPage);
			request.setAttribute("listPagination", this.productDAO.paginationHome(index,8,cateid));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
