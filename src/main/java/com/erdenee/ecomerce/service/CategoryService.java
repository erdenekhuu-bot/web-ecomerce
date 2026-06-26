package com.erdenee.ecomerce.service;

import com.erdenee.ecomerce.config.*; 
import com.erdenee.ecomerce.dao.*;
import java.util.*;
import java.sql.*;

public class CategoryService {
	
	public List<Category> findMany() {
        List<Category> categories = new ArrayList<>();

        String sql = "SELECT * FROM public.category ORDER BY id";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Category cat = new Category();
                cat.setId(rs.getInt("id"));
                cat.setName(rs.getString("name"));
                cat.setDescription(rs.getString("description"));
                
                Timestamp timestamp = rs.getTimestamp("created_at");
                if (timestamp != null) {
                    cat.setCreated_at(timestamp.toLocalDateTime());
                }

                categories.add(cat);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }

}
