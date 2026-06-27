package com.erdenee.ecomerce;

import java.io.BufferedReader;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.erdenee.ecomerce.dao.*;
import com.erdenee.ecomerce.service.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializer;

/**
 * Servlet implementation class RouteCategory
 */
@WebServlet("/api/category")
public class RouteCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryService categoryService = new CategoryService();
    private Gson gson = new Gson();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RouteCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");

	    String pageStr = request.getParameter("page");
	    String sizeStr = request.getParameter("pageSize");
	    String pathInfo = request.getPathInfo();
	    System.out.println(pathInfo);
	    
	    if (pathInfo != null && pathInfo.length() > 1) {
	    	int id = Integer.parseInt(pathInfo.substring(1));
	    	Category category = categoryService.findOne(id);
	    	if (category != null) {
                String json = new GsonBuilder().setPrettyPrinting().create().toJson(category);
                response.getWriter().write(json);
            } else {
                response.setStatus(404);
                response.getWriter().write("{\"error\": \"Category not found\"}");
            }
	    }

	    int page = 1;
	    int size = 10;

	    if (pageStr != null && !pageStr.isBlank()) page = Integer.parseInt(pageStr);
        if (sizeStr != null && !sizeStr.isBlank()) size = Integer.parseInt(sizeStr);

	    List<Category> categories = categoryService.findMany(page, size);

	    Gson gson = new GsonBuilder().setPrettyPrinting().create();

	    String json = gson.toJson(categories);
	    response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    
	    try {
            BufferedReader reader = request.getReader();
            Category newCategory = gson.fromJson(reader, Category.class);
            categoryService.create(newCategory);

            response.setStatus(HttpServletResponse.SC_CREATED); // 201
            response.getWriter().write("{\"message\": \"Category created successfully!\"}");

        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400
            response.getWriter().write("{\"error\": \"Failed to create category\"}");
        }
	}
	
	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
	

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
