package com.erdenee.ecomerce;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	private static final String URL = "jdbc:postgresql://localhost:5432/ecomerce";
	private static final String USER = "admin";
    private static final String PASSWORD = "admin";
    
    public static Connection getConnection() throws SQLException {
    	return DriverManager.getConnection(URL,USER,PASSWORD);
    }

}
