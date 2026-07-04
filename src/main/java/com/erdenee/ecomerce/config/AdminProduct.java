package com.erdenee.ecomerce.config;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.erdenee.ecomerce.dao.*;
import com.erdenee.ecomerce.service.*;
import java.util.*;
/**
 * Servlet implementation class AdminProduct
 */
@WebServlet("/admin/product")
@MultipartConfig
public class AdminProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CategoryService service=new CategoryService();
		request.setAttribute("categories",service.findMany(1, 10));
		request.setAttribute("product", true);
		request.getRequestDispatcher("/WEB-INF/views/admin/Product.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		PrintWriter writer=response.getWriter();
		Part imagePart = request.getPart("image");
		response.setContentType("text/plain; charset=UTF-8");
		
//		writer.println("==== DUMPED REQUEST =====");
//		writer.println("product name\t"+(String)request.getParameter("name"));
//		writer.println("product image\t"+imagePart.getName());
//		writer.println("product size\t"+(String)request.getParameter("description"));
//		response.getWriter().println("===== DUMP IMAGE PART =====");
//		 if (imagePart == null) {
//		        response.getWriter().println("imagePart is null");
//		        return;
//		    }
//		 
//		 response.getWriter().println("Name: " + imagePart.getName());
//		 response.getWriter().println("Submitted File Name: " + imagePart.getSubmittedFileName());
//		 response.getWriter().println("Content Type: " + imagePart.getContentType());
//		 response.getWriter().println("Size: " + imagePart.getSize());
//		 response.getWriter().println("===========================");
		return;
	}

}
