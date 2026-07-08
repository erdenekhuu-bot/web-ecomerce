package com.erdenee.ecomerce.config;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.erdenee.ecomerce.dao.*;
import com.erdenee.ecomerce.service.*;
import java.util.*;

/**
 * Servlet implementation class AdminPayment
 */
@WebServlet("/admin/payment")
public class AdminPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPayment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int page = 1;
	    int size = 10;
	    String pageParam = request.getParameter("page");
	    PaymentService service=new PaymentService();

	    if (pageParam != null) {
	        try {
	            page = Integer.parseInt(pageParam);
	        } catch (NumberFormatException e) {
	            page = 1;
	        }
	    }
	    List<Payment> payments=service.findMany(page, size);
	    int totalRecords = service.count();
	    int totalPages = (int) Math.ceil((double) totalRecords / size);
		request.setAttribute("payment", true);
		request.setAttribute("payments", payments);
		request.setAttribute("currentPage", page);
		request.setAttribute("totalPages", totalPages);
		request.getRequestDispatcher("/WEB-INF/views/admin/Payment.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		Payment payment=new Payment();
		PaymentService service=new PaymentService();
		payment.setName(request.getParameter("name"));

		service.create(payment);
		response.setStatus(HttpServletResponse.SC_CREATED);
		response.sendRedirect(request.getContextPath() + "/admin/payment");
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idParam = request.getParameter("id");
		if (idParam == null || idParam.isBlank()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST,"Payment id is required");
            return;
        }
		try {
            int id = Integer.parseInt(idParam);
            PaymentService service = new PaymentService();
            boolean deleted = service.delete(id);
            if (!deleted) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND,"Payment not found");
                return;
            }
            response.setStatus(HttpServletResponse.SC_OK);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,e.toString());
        }
	}

}
