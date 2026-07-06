package com.erdenee.ecomerce.service;

import com.erdenee.ecomerce.config.DatabaseConnection;
import com.erdenee.ecomerce.dao.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class PaymentService {
	
	private Payment mapPayment(ResultSet rs) throws SQLException {
		Payment payment=new Payment();
		payment.setId(rs.getInt("id"));
		payment.setName(rs.getString("name"));
		return payment;
		
	}
	
	public List<Payment> findMany(int page, int pageSize){
	    List<Payment> payments=new ArrayList<>();
	    String sql = "SELECT * FROM public.payment ORDER BY id ASC LIMIT ? OFFSET ?";
	    int offset = (page - 1) * pageSize;
	    
	    try (Connection conn = DatabaseConnection.getConnection();
	    	 PreparedStatement ps = conn.prepareStatement(sql)) {
	    	ps.setInt(1, pageSize);
            ps.setInt(2, offset);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
            	payments.add(mapPayment(rs));
            }
	    	
	    } catch(SQLException e) {
	    	e.printStackTrace();
	    }
	    
		return payments;
	}
	
	public Payment create(Payment record)  {
		String sql="INSERT INTO public.payment (name) VALUES (?) RETURNING *";
		try (Connection conn = DatabaseConnection.getConnection();
			 PreparedStatement ps = conn.prepareStatement(sql)) {
			
			ps.setString(1, record.getName());

			ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
			    return mapPayment(rs);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	} 
	
	public boolean delete() {
		return false;
	}
	
	public int count() {
	    String sql = "SELECT COUNT(*) FROM public.payment";
	    try (
	        Connection conn = DatabaseConnection.getConnection();
	        PreparedStatement ps = conn.prepareStatement(sql)
	    ) {
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            return rs.getInt(1);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return 0;
	}
}
