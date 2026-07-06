package com.erdenee.ecomerce.config;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;

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
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024,
		maxFileSize = 1024 * 1024 * 5,
		maxRequestSize = 1024 * 1024 * 10
)
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
		CategoryService categories=new CategoryService();	
		ProductService products=new ProductService();
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
	    List<Product> pr = products.findMany(page, size);
	    
	    int totalRecords = products.count();
	    int totalPages = (int) Math.ceil((double) totalRecords / size);

		request.setAttribute("categories",categories.findMany(1, 10));
		request.setAttribute("products",pr);
		request.setAttribute("product", true);
		request.setAttribute("currentPage", page);
		request.setAttribute("totalPages", totalPages);
		request.getRequestDispatcher("/WEB-INF/views/admin/Product.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProductService service=new ProductService();
		request.setCharacterEncoding("UTF-8");
		Part imagePart=request.getPart("image");
		String imagePath="";
		
		if(imagePart != null && imagePart.getSize() > 0) {
			 String originalFileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
			 String extension="";
			 int dotIndex=originalFileName.lastIndexOf(".");
			 if(dotIndex >=0) extension=originalFileName.substring(dotIndex);
			 
			 String newFileName=UUID.randomUUID().toString()+extension; //unique filename
			 String uploadDirPath=getServletContext().getRealPath("/uploads/products"); // file store where path
			 File uploadDir=new File(uploadDirPath);
			 if (!uploadDir.exists()) {
				    boolean created = uploadDir.mkdirs();
				    if (!created) {
				        throw new IOException("Upload directory үүсгэж чадсангүй: " + uploadDirPath);
				    }
				}
			 
			 File savedFile=new File(uploadDir, newFileName);
			 imagePart.write(savedFile.getAbsolutePath());
			 imagePath="/uploads/products/"+newFileName;
			 
		}
		Product product = new Product();

	    product.setName(request.getParameter("name"));
	    product.setDescription(request.getParameter("description"));
	    product.setSize(request.getParameter("size"));
	    product.setColor(request.getParameter("color"));

	    int price = 0;
	    String priceParam = request.getParameter("price");
	    if (priceParam != null && !priceParam.isBlank()) {
	        price = Integer.parseInt(priceParam);
	    }

	    product.setPrice(price);
	    product.setAttribute(request.getParameter("attribute"));
	    product.setCategory_id(Integer.parseInt(request.getParameter("category_id")));
	    product.setImage(imagePath);

	    service.create(product);
	    response.sendRedirect(request.getContextPath() + "/admin/product");
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idParam = request.getParameter("id");
		if (idParam == null || idParam.isBlank()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST,"Product id is required");
            return;
        }
		try {
            int id = Integer.parseInt(idParam);
            ProductService prservice=new ProductService();
            boolean deleted = prservice.delete(id);
            if (!deleted) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND,"Product not found");
                return;
            }
            response.setStatus(HttpServletResponse.SC_OK);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,e.toString());
        }
	}

}
