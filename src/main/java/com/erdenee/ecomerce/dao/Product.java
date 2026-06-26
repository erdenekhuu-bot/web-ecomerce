package com.erdenee.ecomerce.dao;

import java.time.LocalDateTime;

public class Product {
	private int id;
	private String name;
	private String description;
	private String size;
	private String color;
	private int price;
	private String attribute;
	private boolean selled;
	private int category_id;
	private String image;
	private LocalDateTime created_at;
	
	public int getId() {
		return id;
	}
	
	public String getName() {
		return name;
	}
	
	public String getDescription() {
		return description;
	}
	
	public String getSize() {
		return size;
	}
	
	public String getColor() {
		return color;
	}
	public int getPrice() {
		return price;
	}
	public String getAttribute() {
		return attribute;
	}
	
	public boolean getSelled() {
		return selled;
	}
	
	public int getCategory_id() {
		return category_id;
	}
	
	public String getImage() {
		return image;
	}
	public LocalDateTime getCreated_at() {
		return created_at;
	}
	
}
