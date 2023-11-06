package com.ssb.item.db;

/**
 *   ItemDTO 
 *   => 객체 초기화(생성) 완료
 *   => DB테이블의 정보를 저장하는 객체 
 */

public class ItemDTO {
	// item 테이블
	private int item_id; // 제품 ID 
	private String item_name; // 제품 이름
	private String item_img_main; // 대표 이미지
	private String item_img_sub; // 상세 이미지
	private String item_img_logo; // 로고 이미지
	// category 테이블
	private int category_id; // 카테고리 ID
	// options 테이블
	private int options_price; // 가격
	private int options_quantity; // 재고
	private String options_name; // 옵션명
	private String options_value; // 옵션값
	

	// alt shift s + r  
	// => set/get 메서드 자동생성

	public int getItem_id() {
		return item_id;
	}


	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}


	public String getItem_name() {
		return item_name;
	}


	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}


	public String getItem_img_main() {
		return item_img_main;
	}


	public void setItem_img_main(String item_img_main) {
		this.item_img_main = item_img_main;
	}


	public String getItem_img_sub() {
		return item_img_sub;
	}


	public void setItem_img_sub(String item_img_sub) {
		this.item_img_sub = item_img_sub;
	}


	public String getItem_img_logo() {
		return item_img_logo;
	}


	public void setItem_img_logo(String item_img_logo) {
		this.item_img_logo = item_img_logo;
	}


	public int getCategory_id() {
		return category_id;
	}


	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}


	public int getOptions_price() {
		return options_price;
	}


	public void setOptions_price(int options_price) {
		this.options_price = options_price;
	}


	public int getOptions_quantity() {
		return options_quantity;
	}


	public void setOptions_quantity(int options_quantity) {
		this.options_quantity = options_quantity;
	}


	public String getOptions_name() {
		return options_name;
	}


	public void setOptions_name(String options_name) {
		this.options_name = options_name;
	}


	public String getOptions_value() {
		return options_value;
	}


	public void setOptions_value(String options_value) {
		this.options_value = options_value;
	}
	
	
	// alt shift s + s
	
	@Override
	public String toString() {
		return "ItemDTO [item_id=" + item_id + ", item_name=" + item_name + ", item_img_main=" + item_img_main
				+ ", item_img_sub=" + item_img_sub + ", item_img_logo=" + item_img_logo + ", category_id=" + category_id
				+ ", options_price=" + options_price + ", options_quantity=" + options_quantity + ", options_name="
				+ options_name + ", options_value=" + options_value + "]";
	}
	
}
