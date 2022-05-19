package com.monami.app.product.dao;

public class OrderDTO {
	private int order_idx;
	private String prod_name;
	private int prod_price;
	private String user_id;
	private String user_name;
	private String user_addr;
	private String order_item;
	private int order_pay;
	private String order_time;
	private String order_status; 
	private int order_count;
	
	public int getOrderidx() {
		return order_idx;
	}
	public void setOrderidx(int order_idx) {
		this.order_idx = order_idx;
	}
	public String getProdname() {
		return prod_name;
	}
	public void setProdname(String prod_name) {
		this.prod_name = prod_name;
	}
	public int getProdprice() {
		return prod_price;
	}
	public void setProdprice(int prod_price) {
		this.prod_price = prod_price;
	}
	public String getUserid() {
		return user_id;
	}
	public void setUserid(String user_id) {
		this.user_id = user_id;
	}
	public String getUsername() {
		return user_name;
	}
	public void setUsername(String user_name) {
		this.user_name = user_name;
	}
	public String getUseraddr() {
		return user_addr;
	}
	public void setUseraddr(String user_addr) {
		this.user_addr = user_addr;
	}
	public String getOrderitem() {
		return order_item;
	}
	public void setOrderitem(String order_item) {
		this.order_item = order_item;
	}
	public int getOrderpay() {
		return order_pay;
	}
	public void setOrderpay(int order_pay) {
		this.order_pay = order_pay;
	}
	public String getOrdertime() {
		return order_time;
	}
	public void setOrdertime(String order_time) {
		this.order_time = order_time;
	}
	public String getOrderstatus() {
		return order_status;
	}
	public void setOrderstatus(String order_status) {
		this.order_status = order_status;
	}
	public int getOrder_count() {
		return order_count;
	}
	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}
	
	
}
