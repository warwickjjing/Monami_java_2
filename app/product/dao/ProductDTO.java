package com.monami.app.product.dao;

public class ProductDTO {
	private int prod_idx;
	private String prod_category;
	private String prod_name;
	private int prod_price;
	private int prod_count;
	private String prod_pic;
	public int getProd_idx() {
		return prod_idx;
	}
	public void setProd_idx(int prod_idx) {
		this.prod_idx = prod_idx;
	}
	public String getProd_category() {
		return prod_category;
	}
	public void setProd_category(String prod_category) {
		this.prod_category = prod_category;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public int getProd_count() {
		return prod_count;
	}
	public void setProd_count(int prod_count) {
		this.prod_count = prod_count;
	}
	public String getProd_pic() {
		return prod_pic;
	}
	public void setProd_pic(String prod_pic) {
		this.prod_pic = prod_pic;
	}
	
	
}