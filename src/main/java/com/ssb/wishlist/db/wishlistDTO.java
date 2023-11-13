package com.ssb.wishlist.db;

public class wishlistDTO {
	private int wishlist_id;
	private int item_id;
	private int member_id;
	
	public int getWishlist_id() {
		return wishlist_id;
	}
	public int getItem_id() {
		return item_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setWishlist_id(int wishlist_id) {
		this.wishlist_id = wishlist_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	
	@Override
	public String toString() {
		return "wishlistDTO [wishlist_id=" + wishlist_id + ", item_id=" + item_id + ", member_id=" + member_id + "]";
	}
}
