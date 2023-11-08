package com.ssb.rental.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RentalDAO {
	
	// 공통변수 선언
	
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	// 디비연결수행
	private Connection getCon() throws Exception{
	
	
	Context initCTX = new InitialContext(); // 프로젝트의 정보를 확인(JNDI)
	DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/ssb");
	con = ds.getConnection();
	
	
	System.out.println("DAO : 디비 연결 성공!");
	System.out.println("DAO : "+con);
	
	return con;
	
	}
	
	// 디비 자원해제
	public void CloseDB() {
		try {
			if(rs != null)rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
				
	 	} catch (SQLException e) {
	 		e.printStackTrace();
		}
	}
	
	// 메인화면에 출력할 렌탈 제품 정보 조회 - getRentalList()
	public ArrayList getRentalList() {
		ArrayList rentalList = new ArrayList();
		
		try {
			con = getCon();
			sql = "select * from rental_item order by rental_item_id";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RentalDTO rdto = new RentalDTO();
				rdto.setRental_item_id(rs.getInt("rental_item_id"));
				rdto.setRental_item_name(rs.getString("rental_item_name"));
				rdto.setRental_item_price(rs.getInt("rental_item_price"));
				rdto.setRental_opt_quantity(rs.getInt("rental_opt_quantity"));
				rdto.setRental_opt_name(rs.getString("rental_opt_name"));;
				rdto.setRental_opt_value(rs.getString("rental_opt_value"));
				rdto.setRental_img_main(rs.getString("rental_img_main"));
				rdto.setRental_item_sub(rs.getString("rental_item_sub"));
				rdto.setRental_img_logo(rs.getString("rental_img_logo"));
				rdto.setCategory_id(rs.getInt("category_id"));
				
				rentalList.add(rdto);
				
			}
			System.out.println("DAO : 렌탈아이템 조회 성공!");
			System.out.println("DAO 조회 행수 : "+rentalList.size());
			
		} catch (Exception e) {
		
			e.printStackTrace();
		}finally {
			CloseDB();
		}
		
		return rentalList;
		
	}
	// 메인화면에 출력할 렌탈 제품 정보 조회 - getRentalList()
	
	// 특정 렌탈 아이템 정보를 조회하는 메서드 - getRentalItem()
	public RentalDTO getRentalItem(int rental_item_id) {
		RentalDTO rdto = null;
		
		try {
			con =getCon();
			sql = "select * from rental_item where rental_item_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rental_item_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rdto = new RentalDTO();
				rdto.setRental_item_id(rental_item_id);
				rdto.setRental_item_name(rs.getString("rental_item_name"));
				rdto.setRental_item_price(rs.getInt("rental_item_price"));
				rdto.setRental_opt_quantity(rs.getInt("rental_opt_quantity"));
				rdto.setRental_opt_name(rs.getString("rental_opt_name"));;
				rdto.setRental_opt_value(rs.getString("rental_opt_value"));
				rdto.setRental_img_main(rs.getString("rental_img_main"));
				rdto.setRental_item_sub(rs.getString("rental_item_sub"));
				rdto.setRental_img_logo(rs.getString("rental_img_logo"));
				rdto.setCategory_id(rs.getInt("category_id"));
				
			}
			System.out.println("DAO : 제품 정보 조회 완료!!");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			CloseDB();
		}
				
		
		return rdto;
	}
	
	// 특정 렌탈 아이템 정보를 조회하는 메서드 - getRentalItem()
	
	
	
	
	
	
	
	
	
	
	
	
	
}
