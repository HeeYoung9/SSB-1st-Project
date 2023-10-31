package com.ssb.item.db;

public class ItemDTO {
	private long item_id;
	private String item_name;
	private String item_content;
	private int item_price;
	private int item_quantity;
	
	private String item_options_name;
	private String item_options_value;
	
	private String item_img_origin;
	private String item_img_server;
	
	private long category_id;

	
	
	
	public long getItem_id() {
		return item_id;
	}

	public void setItem_id(long item_id) {
		this.item_id = item_id;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getItem_content() {
		return item_content;
	}

	public void setItem_content(String item_content) {
		this.item_content = item_content;
	}

	public int getItem_price() {
		return item_price;
	}

	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}

	public int getItem_quantity() {
		return item_quantity;
	}

	public void setItem_quantity(int item_quantity) {
		this.item_quantity = item_quantity;
	}

	public String getItem_options_name() {
		return item_options_name;
	}

	public void setItem_options_name(String item_options_name) {
		this.item_options_name = item_options_name;
	}

	public String getItem_options_value() {
		return item_options_value;
	}

	public void setItem_options_value(String item_options_value) {
		this.item_options_value = item_options_value;
	}

	public String getItem_img_origin() {
		return item_img_origin;
	}

	public void setItem_img_origin(String item_img_origin) {
		this.item_img_origin = item_img_origin;
	}

	public String getItem_img_server() {
		return item_img_server;
	}

	public void setItem_img_server(String item_img_server) {
		this.item_img_server = item_img_server;
	}

	public long getCategory_id() {
		return category_id;
	}

	public void setCategory_id(long category_id) {
		this.category_id = category_id;
	}

	
	
	@Override
	public String toString() {
		return "ItemDTO [item_id=" + item_id + ", item_name=" + item_name + ", item_content=" + item_content
				+ ", item_price=" + item_price + ", item_quantity=" + item_quantity + ", item_options_name="
				+ item_options_name + ", item_options_value=" + item_options_value + ", item_img_origin="
				+ item_img_origin + ", item_img_server=" + item_img_server + ", category_id=" + category_id + "]";
	}
	
	
	
}
