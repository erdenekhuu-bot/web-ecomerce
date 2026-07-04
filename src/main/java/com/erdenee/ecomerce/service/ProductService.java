package com.erdenee.ecomerce.service;

import com.erdenee.ecomerce.config.*;
import com.erdenee.ecomerce.dao.*;
import java.sql.*;
import java.util.*;

public class ProductService {
	
	private Product mapProduct(ResultSet rs) throws SQLException {
		Product product=new Product();
		return product;
	}
	
	public List<Product> findMany(int page, int pageSize){
		List<Product> product=new ArrayList<>();
		String sql = "SELECT * FROM public.product ORDER BY id ASC LIMIT ? OFFSET ?";
		int offset = (page - 1) * pageSize;
		try(Connection conn = DatabaseConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, page);
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
		String sql="""	
					INSERT INTO public.product (name,description,size,color,price,attribute) VALUES (?,?,?,?,?,?) RETURNING id 
					""";
		try(Connection conn = DatabaseConnection.getConnection();
		    PreparedStatement ps = conn.prepareStatement(sql)){
			ps.setString(1, record.getName());
			ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
			    return mapProduct(rs);
			}
	            
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return record;
	}
	
}
