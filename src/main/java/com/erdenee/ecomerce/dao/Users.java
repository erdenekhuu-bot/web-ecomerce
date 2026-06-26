package com.erdenee.ecomerce.dao;

import java.time.LocalDateTime;

public class Users {
		
	private int id;
	private String username;
	private String password;
	private String kind;
	private LocalDateTime created_at;

	public int getId() {
		return id;
	}
	public String getUsername() {
		return username;
	}
	public String getKind() {
		return kind;
	}
	
	public LocalDateTime getCreated_at() {
		return created_at;
	}
}
