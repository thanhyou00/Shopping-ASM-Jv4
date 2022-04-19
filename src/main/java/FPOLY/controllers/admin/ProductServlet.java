package FPOLY.controllers.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import FPOLY.dao.ProductDAO;
import FPOLY.entities.Product;
import FPOLY.utils.ImportExcelUtil;

@WebServlet({"/admin/products/index","/admin/products/create","/admin/products/update","/admin/products/delete","/admin/products/excel"})
@MultipartConfig(
	       fileSizeThreshold= 1024 * 1024 * 50, // 50 MB
	       maxFileSize = 1024 * 1024 * 10, // 10 MB
	       maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR ="excel";
	private ProductDAO productDAO; 
	private ImportExcelUtil importExcel;
    public ProductServlet() {
        super();
        this.productDAO = new ProductDAO();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String uri = request.getRequestURI();
    	if(uri.contains("index")) {
    		this.index(request, response);
    	} else if(uri.contains("delete")) {
    		this.delete(request, response);
    	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		if(uri.contains("create")) {
			this.create(request, response);
		} else if(uri.contains("update")) {
			this.update(request, response);
		} else if(uri.contains("excel")) {
			this.excel(request, response);
		}else {
			request.getRequestDispatcher("/views/404.jsp").forward(request, response);
		}
	}
	
	public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String indexStr = request.getParameter("index");
		if(indexStr==null) {
			indexStr ="1";
		}
		try {
			int index = Integer.parseInt(indexStr);
			long count = this.productDAO.getTotalProduct();
			long endPage = count/5;
			if(count%5!=0) {
				endPage++;
			}
			request.setAttribute("isActive", index);
			request.setAttribute("endPage", endPage);
			request.setAttribute("total", count);
			request.setAttribute("listPagination", this.productDAO.pagination(index,5));
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("viewAdmin","/views/admin/product.jsp");
		request.getRequestDispatcher("/views/admin.jsp").forward(request, response);		
	}
	
	public void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		try {
			Product product = new Product();
			BeanUtils.populate(product, request.getParameterMap());
			session.setAttribute("messageupdateSuccess", "Your product has been created !");
			session.setAttribute("display", "show");
			this.productDAO.create(product);
			response.sendRedirect("/ASM/admin/products/index");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("messageupdateSuccess", "Your product doesnt have been created !");
			session.setAttribute("display", "show");		
			response.sendRedirect("/ASM/admin/products/index");
		}	
	}
	
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id");
		HttpSession session = request.getSession();
		try {
			int id = Integer.parseInt(idStr);
			Product entity = this.productDAO.findById(id);
			session.setAttribute("messageupdateSuccess", "Your product has been deleted !");
			session.setAttribute("display", "show");
			this.productDAO.delete(entity);
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("messageupdateSuccess", "Your product doesnt have been deleted !");
			session.setAttribute("display", "show");
		}	
		response.sendRedirect("/ASM/admin/products/index");
	}
	
	public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		try {
			Product newEntity = new Product();
			BeanUtils.populate(newEntity, request.getParameterMap());
			session.setAttribute("messageupdateSuccess", "Your product has been updated !");
			session.setAttribute("display", "show");
			this.productDAO.update(newEntity);
			response.sendRedirect("/ASM/admin/products/index");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("messageupdateSuccess", "Your product doesnt have been updated !");
			session.setAttribute("display", "show");
			response.sendRedirect("/ASM/admin/products/index");
		}
	}
	public void excel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		try {
			String excelFileName = this.uploadFile(request, response);
			importExcel = new ImportExcelUtil("excel/"+excelFileName);
			String applicationPath = request.getServletContext().getRealPath("");
			String basePath = applicationPath + File.separator + UPLOAD_DIR + File.separator;
			importExcel.readData(basePath+"\\" +excelFileName);//
			session.setAttribute("messageupdateSuccess", "Your product has been created !");
			session.setAttribute("display", "show");
			response.sendRedirect("/ASM/admin/products/index");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/ASM/admin/products/index");
		};

	}
	
	private String getFileName(Part part) {
		final String partHeader  = part.getHeader("content-disposition");
		for (String  content : partHeader.split(";")) {
			if(content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=')+1).trim().replace("\"", "");
			}
		}
		return null;	
	}
	public String uploadFile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileName = "";
		try {
			Part filePart = request.getPart("excelfile");
			fileName = getFileName(filePart);
			String applicationPath = request.getServletContext().getRealPath("");
			String basePath = applicationPath + File.separator + UPLOAD_DIR + File.separator;
			InputStream inputStream = null;
			OutputStream outputStream = null;	
			try {
				File outputFilePath = new File(basePath+fileName);
				inputStream = filePart.getInputStream();
				outputStream = new FileOutputStream(outputFilePath);
				int read = 0;
				final byte[] bytes = new byte[1024];
				while((read=inputStream.read(bytes))!=-1) {
					outputStream.write(bytes,0,read);
				}
			} catch (Exception e) {
				fileName = "";
			} finally {
				if(outputStream !=null) {
					outputStream.close();
				}
				if(inputStream !=null) {
					inputStream.close();
				}
			};
		} catch (Exception e) {
			fileName = "";
			e.printStackTrace();
		}
		return fileName;
	}

}









