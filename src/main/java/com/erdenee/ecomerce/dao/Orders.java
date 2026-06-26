package com.erdenee.ecomerce.dao;

import java.time.*;

public class Orders {
	
	private int id;
	private int user_id;
	private int payment_id;
	private String email;
	private String delivery;
	private int totalprice;
	private String state;
	
	public int getId() {
		return id;
	}
	
	public int getUser_id() {
		return user_id;
	}
	public int getPayment_id() {
		return payment_id;
	}
	public String getEmail() {
		return email;
	}
	public String getDelivery() {
		return delivery;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public String getState() {
		return state;
	}

}
