package com.erdenee.ecomerce.service;

import com.erdenee.ecomerce.config.*;
import com.erdenee.ecomerce.dao.*;
import java.sql.*;
import java.util.*;

public class ProductService {
	
	private Product mapProduct(ResultSet rs) throws SQLException {
		Product product=new Product();
		product.setId(rs.getInt("id"));
		product.setName(rs.getString("name"));
		product.setDescription(rs.getString("description"));
		product.setImage(rs.getString("image"));
		return product;
	}
	
	public List<Product> findMany(int page, int pageSize){
		List<Product> product=new ArrayList<>();
		String sql = "SELECT * FROM public.product ORDER BY id ASC LIMIT ? OFFSET ?";
		int offset = (page - 1) * pageSize;
		try(Connection conn = DatabaseConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, pageSize);
            ps.setInt(2, offset);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
            	product.add(mapProduct(rs));
            }
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return product;
	}
	
	public Product create(Product record) {
		 String sql = """
			        INSERT INTO public.product
			        (name, description, size, color, price, attribute, category_id, image)
			        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
			        RETURNING *
			    """;
		try(Connection conn = DatabaseConnection.getConnection();
		    PreparedStatement ps = conn.prepareStatement(sql)){
			ps.setString(1, record.getName());
	        ps.setString(2, record.getDescription());
	        ps.setString(3, record.getSize());
	        ps.setString(4, record.getColor());
	        ps.setInt(5, record.getPrice());
	        ps.setString(6, record.getAttribute());
	        ps.setInt(7, record.getCategory_id());
	        ps.setString(8, record.getImage());
	        
			ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
			    return mapProduct(rs);
			}
	            
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int count() {
	    String sql = "SELECT COUNT(*) FROM public.product";
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
	
	public boolean delete(int id) {
		 String sql = """
			        DELETE FROM public.product
			        WHERE id = ?
			        """;

		 try (Connection conn = DatabaseConnection.getConnection();
			  PreparedStatement ps = conn.prepareStatement(sql)) {
			  ps.setInt(1, id);
			  return ps.executeUpdate() > 0;

	     } catch (SQLException e) {
	    	 System.err.println(e.toString());
			 e.printStackTrace();
			 return false;
	     }
	}
	
}
