package com.erdenee.ecomerce.service;

import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import com.erdenee.ecomerce.dao.*;
import com.erdenee.ecomerce.config.*;
import javax.crypto.*;
import com.erdenee.ecomerce.dao.*;

public class UserService {
	
	  private Users mapUsers(ResultSet rs) throws SQLException {
		  Users user=new Users();
		  user.setId(rs.getInt("id"));
		  user.setUsername(rs.getString("username"));
		  user.setKind(rs.getString("kind"));
		  user.setPassword(rs.getString("password"));
		  user.setCreated_at(rs.getString("created_at"));
		  return user;
	  }
	
	  public String encryptValue(String value) throws InvalidKeyException, InvalidAlgorithmParameterException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException, RuntimeException {
	       return CryptoUtil.encrypt(value);
	  }

	  public String decryptValue(String value) throws InvalidKeyException, InvalidAlgorithmParameterException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException, RuntimeException {
	       return CryptoUtil.decrypt(value);
	  }
	  
	  public Users register(Users record) {
		  String sql = """
	                INSERT INTO public.users (username, password)
	                VALUES (?, ?)
	                RETURNING *
	                """;
		  try(Connection conn = DatabaseConnection.getConnection();
			  PreparedStatement ps = conn.prepareStatement(sql)) {
			  ps.setString(1, record.getUsername());
	          ps.setString(2, record.getPassword());
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
			           return mapUsers(rs);
			     }
		  } catch(SQLException e) {
			  e.printStackTrace();
		  }
		  return record;
	  }
	  
	  public boolean login(String username, String password) throws InvalidKeyException, InvalidAlgorithmParameterException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException, RuntimeException {
		  String sql = "SELECT * FROM public.users WHERE username=?";
		  try (Connection conn = DatabaseConnection.getConnection();
			   PreparedStatement ps = conn.prepareStatement(sql)) {
			   ps.setString(1, username);
			
			   ResultSet rs=ps.executeQuery();
			   if(rs.next()) {
				   Users user= mapUsers(rs);
				   String decryptedPassword = decryptValue(user.getPassword());
				   return password.equals(decryptedPassword);
			   }
			   
			  
			  return false;
		  } catch(SQLException e) {
			  e.printStackTrace();
			  return false;
		  }
	  }
}
