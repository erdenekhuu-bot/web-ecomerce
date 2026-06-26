package com.erdenee.ecomerce;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	private static final String URL = "jdbc:postgresql://localhost:5432/ecomerce_java";
	private static final String USER = "erdenee";
    private static final String PASSWORD = "erdenee";
    
    public static Connection getConnection() throws SQLException {
    	return DriverManager.getConnection(URL,USER,PASSWORD);
    }

}
