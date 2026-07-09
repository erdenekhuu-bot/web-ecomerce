package com.erdenee.ecomerce.config;

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

/**
 * Servlet Filter implementation class Middleware
 */
@WebFilter("/*")
public class Middleware extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public Middleware() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	@Override
	public void doFilter(ServletRequest request,ServletResponse response,FilterChain chain) throws IOException, ServletException {
	    HttpServletRequest req = (HttpServletRequest) request;
	    HttpServletResponse res = (HttpServletResponse) response;

	    String contextPath = req.getContextPath();
	    String path = req.getRequestURI().substring(contextPath.length());

	    HttpSession session = req.getSession(false);

	    boolean loggedIn = session != null && session.getAttribute("username") != null;

	    boolean publicPath =
	            path.equals("/") ||
	            path.equals("/login") ||
	            path.equals("/logout") ||
	            path.equals("/home") ||
	            path.equals("/new-arrival") ||
	            path.equals("/collection") ||
	            path.equals("/journal") ||
	            path.startsWith("/css/") ||
	            path.startsWith("/js/") ||
	            path.startsWith("/images/") ||
	            path.startsWith("/uploads/");
	   
	    if (path.isEmpty() || path.equals("/")) {
	        res.sendRedirect(contextPath + "/home");
	        return;
	    }

	    if (publicPath) {
	        chain.doFilter(request, response);
	        return;
	    }

	    if (!loggedIn) {
	    	res.sendRedirect(contextPath + "/login");
	        return;
	    }
	   
	    chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
