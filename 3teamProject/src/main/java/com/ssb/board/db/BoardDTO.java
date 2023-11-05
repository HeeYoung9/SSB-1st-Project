package com.ssb.board.db;

import java.sql.Date;

public class BoardDTO {

	private int board_id; 			
	private String admin_user_id;  
	private String member_user_id;
	private int orders_id;
	
	private String board_type;
	private String board_subject;
	private String board_content;
	private Date board_writeTime;
	private int board_readCount;
	private String board_file;
	
	private double rating;
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getAdmin_user_id() {
		return admin_user_id;
	}
	public void setAdmin_user_id(String admin_user_id) {
		this.admin_user_id = admin_user_id;
	}
	public String getMember_user_id() {
		return member_user_id;
	}
	public void setMember_user_id(String member_user_id) {
		this.member_user_id = member_user_id;
	}
	public int getOrders_id() {
		return orders_id;
	}
	public void setOrders_id(int orders_id) {
		this.orders_id = orders_id;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Date getBoard_writeTime() {
		return board_writeTime;
	}
	public void setBoard_writeTime(Date board_writeTime) {
		this.board_writeTime = board_writeTime;
	}
	public int getBoard_readCount() {
		return board_readCount;
	}
	public void setBoard_readCount(int board_readCount) {
		this.board_readCount = board_readCount;
	}
	public String getBoard_file() {
		return board_file;
	}
	public void setBoard_file(String board_file) {
		this.board_file = board_file;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	
	@Override
	public String toString() {
		return "BoardDTO [board_id=" + board_id + ", admin_user_id=" + admin_user_id + ", member_user_id="
				+ member_user_id + ", board_type=" + board_type + ", board_subject=" + board_subject
				+ ", board_content=" + board_content + ", board_writeTime=" + board_writeTime + ", board_readCount="
				+ board_readCount + ", board_file=" + board_file + ", orders_id=" + orders_id + ", rating=" + rating
				+ "]";
	}
	
}