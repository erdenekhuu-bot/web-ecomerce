package com.erdenee.ecomerce.dao;

import java.time.LocalDateTime;

public class ShopCard {

	private int id;
	private String description;
	private int product_id;
	private int user_id;
	private LocalDateTime created_at;
	
	public int getId() {
		return id;
	}
	
	public String getDescription() {
		return description;
	}
	
	public int getProduct_id() {
		return product_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public LocalDateTime getCreated_at() {
		return created_at;
	}
}
