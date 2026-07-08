package com.erdenee.ecomerce;

import java.io.IOException;
import java.security.SecureRandom;
import java.security.spec.KeySpec;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;
import javax.crypto.spec.PBEKeySpec;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.erdenee.ecomerce.dao.Users;
import com.erdenee.ecomerce.service.*;
import javax.crypto.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/views/Login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(
	        HttpServletRequest request,
	        HttpServletResponse response
	) throws ServletException, IOException {

	    try {
	        UserService service = new UserService();

	        String username = request.getParameter("username");
	        String password = request.getParameter("password");

	        boolean loggedIn = service.login(username, password);

	        if (loggedIn) {
	            request.getSession().setAttribute("username", username);
	            request.setAttribute("isLoggedIn", true);
	            response.sendRedirect(request.getContextPath() + "/home");
	            return;
	        } else {
	        	request.getRequestDispatcher("/WEB-INF/views/Login.jsp")
	               .forward(request, response);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();

	        response.sendError(
	            HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
	            e.getMessage()
	        );
	    }
	}
	
}
