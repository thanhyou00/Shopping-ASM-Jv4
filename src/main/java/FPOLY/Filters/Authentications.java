package FPOLY.Filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FPOLY.entities.User;

@WebFilter({ "/users/*", "/products/*", "/categories/*","/admin/*" })
public class Authentications extends HttpFilter implements Filter {
	private static final long serialVersionUID = 1L;

	public Authentications() {
		super();
	}

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpReq = (HttpServletRequest) request;
		HttpServletResponse httpRes = (HttpServletResponse) response;
		HttpSession session = httpReq.getSession();
		String uri = httpReq.getRequestURI();
		User user = (User) session.getAttribute("user");
		if (user == null) { 
			httpRes.sendRedirect("/ASM/login");
			return;
		} 
		if((user.getRole()==0)&&uri.contains("/admin/*")) {
			httpRes.sendRedirect("/ASM/home");	
			return;
		} 
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
