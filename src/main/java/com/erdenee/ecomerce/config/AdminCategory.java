package com.erdenee.ecomerce.config;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.erdenee.ecomerce.dao.*;
import com.erdenee.ecomerce.service.*;

/**
 * Servlet implementation class AdminCategory
 */
@WebServlet("/admin")
public class AdminCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryService categoryService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCategory() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
    public void init() {
    	 categoryService = new CategoryService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int page = 1;
	    int size = 10;

	    String pageParam = request.getParameter("page");

	    if (pageParam != null) {
	        try {
	            page = Integer.parseInt(pageParam);
	        } catch (NumberFormatException e) {
	            page = 1;
	        }
	    }

	    List<Category> categories = categoryService.findMany(page, size);

	    int totalRecords = categoryService.count();
	    int totalPages = (int) Math.ceil((double) totalRecords / size);

	    request.setAttribute("categories", categories);
	    request.setAttribute("currentPage", page);
	    request.setAttribute("totalPages", totalPages);
		request.setAttribute("category", true);
		
		request.getRequestDispatcher("/WEB-INF/views/admin/Category.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		
		Category category = new Category();
		category.setName(name);
		category.setDescription(description);
		categoryService.create(category);
		response.setStatus(HttpServletResponse.SC_CREATED);
		response.sendRedirect(request.getContextPath() + "/admin");
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idParam = request.getParameter("id");
		if (idParam == null || idParam.isBlank()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST,"Category id is required");
            return;
        }
		try {
            int id = Integer.parseInt(idParam);
            boolean deleted = categoryService.delete(id);
            if (!deleted) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND,"Category not found");
                return;
            }
            response.setStatus(HttpServletResponse.SC_OK);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,e.toString());
        }
	}

}
