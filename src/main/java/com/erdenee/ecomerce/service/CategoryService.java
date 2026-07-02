package com.erdenee.ecomerce.service;

import com.erdenee.ecomerce.config.*;  
import com.erdenee.ecomerce.dao.*;
import java.util.*;
import java.sql.*;

public class CategoryService {
	
	//Useful private method selects
	 private Category mapCategory(ResultSet rs) throws SQLException {
	        Category category = new Category();
	        category.setId(rs.getInt("id"));
	        category.setName(rs.getString("name"));
	        category.setDescription(rs.getString("description"));
	        category.setCreated_at(rs.getString("created_at"));
	        return category;
	    }
	
	public List<Category> findMany(int page, int size){
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM public.category ORDER BY id ASC LIMIT ? OFFSET ?";
        int offset = (page - 1) * size;
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
        	ps.setInt(1, size);
            ps.setInt(2, offset);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                  categories.add(mapCategory(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }
	
	public Category findOne(int id) {
		String sql = """
                SELECT id, name, description, created_at
                FROM public.category
                WHERE id = ?
                """;
		try (Connection conn=DatabaseConnection.getConnection();
			 PreparedStatement ps = conn.prepareStatement(sql)) {
			 ps.setInt(1, id);
			 ResultSet rs = ps.executeQuery();
			 if (rs.next()) {
		           return mapCategory(rs);
		     }
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Category create(Category record) {
		String sql = """
                INSERT INTO public.category (name, description)
                VALUES (?, ?)
                RETURNING id, name, description, created_at
                """;
		try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
			
			ps.setString(1, record.getName());
            ps.setString(2, record.getDescription());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
		           return mapCategory(rs);
		     }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return record;
	}
	
	public boolean delete(int id) {
		 String sql = """
			        DELETE FROM public.category
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
	
	public int count() {
	    String sql = "SELECT COUNT(*) FROM public.category";
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
