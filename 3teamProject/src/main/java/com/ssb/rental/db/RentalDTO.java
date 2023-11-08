package com.ssb.rental.db;

public class RentalDTO {

	private int rental_item_id;
	private String rental_item_name;
	private int rental_item_price;
	private int rental_opt_quantity;
	private String rental_opt_name;
	private String rental_opt_value;
	private String rental_img_main;
	private String rental_item_sub;
	private String rental_img_logo;
	private int category_id;
	
	public int getRental_item_id() {
		return rental_item_id;
	}
	public void setRental_item_id(int rental_item_id) {
		this.rental_item_id = rental_item_id;
	}
	public String getRental_item_name() {
		return rental_item_name;
	}
	public void setRental_item_name(String rental_item_name) {
		this.rental_item_name = rental_item_name;
	}
	public int getRental_item_price() {
		return rental_item_price;
	}
	public void setRental_item_price(int rental_item_price) {
		this.rental_item_price = rental_item_price;
	}
	public int getRental_opt_quantity() {
		return rental_opt_quantity;
	}
	public void setRental_opt_quantity(int rental_item_quantity) {
		this.rental_opt_quantity = rental_item_quantity;
	}
	public String getRental_opt_name() {
		return rental_opt_name;
	}
	public void setRental_opt_name(String rental_opt_name) {
		this.rental_opt_name = rental_opt_name;
	}
	public String getRental_opt_value() {
		return rental_opt_value;
	}
	public void setRental_opt_value(String rental_opt_value) {
		this.rental_opt_value = rental_opt_value;
	}
	public String getRental_img_main() {
		return rental_img_main;
	}
	public void setRental_img_main(String rental_img_main) {
		this.rental_img_main = rental_img_main;
	}
	public String getRental_item_sub() {
		return rental_item_sub;
	}
	public void setRental_item_sub(String rental_item_sub) {
		this.rental_item_sub = rental_item_sub;
	}
	public String getRental_img_logo() {
		return rental_img_logo;
	}
	public void setRental_img_logo(String rental_img_logo) {
		this.rental_img_logo = rental_img_logo;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	@Override
	public String toString() {
		
		return super.toString();
	}
	
	
	
	
}
