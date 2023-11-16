package com.ssb.rental.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.ssb.main.db.ItemDTO;

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
				rdto.setRental_img_sub(rs.getString("rental_img_sub"));
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
	
	// 검색어 유무에 따른 글 정보 목록을 가져오는 메서드 -getRentalList(String search)
		public ArrayList getRentalList(String search) {
			ArrayList itemList = new ArrayList();
			
			try {
				con = getCon();
				sql = "select * from rental_item where rental_item_name like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
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
					rdto.setRental_img_sub(rs.getString("rental_img_sub"));
					rdto.setRental_img_logo(rs.getString("rental_img_logo"));
					rdto.setCategory_id(rs.getInt("category_id"));
					
					itemList.add(rdto);
					
				}
				System.out.println("DAO : 렌탈아이템 조회 성공!");
				System.out.println("DAO 조회 행수 : "+itemList.size());
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				CloseDB();
			}
			
			return itemList;
		}
		
		
		
		
	// 검색어 유무에 따른 글 정보 목록을 가져오는 메서드 -getRentalList(String search)
	
	
	
	
	
	
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
				rdto.setRental_img_sub(rs.getString("rental_img_sub"));
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
	
	
	// 카테고리별 제품 목록을 보여주는 메서드 - getCategoryItem(category)
	public ArrayList getCategoryItem(String category) {
		ArrayList categoryList = new ArrayList();
		
		
		try {
			con = getCon();
			sql="select * from rental_item ri join category c on ri.category_id = c.category_id where category_sport=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, category);
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
				rdto.setRental_img_sub(rs.getString("rental_img_sub"));
				rdto.setRental_img_logo(rs.getString("rental_img_logo"));
				rdto.setCategory_id(rs.getInt("category_id"));
				
				categoryList.add(rdto);
				
			}
			System.out.println("DAo : 카테고리별 목록 조회 완료! ");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			CloseDB();
		}
		
		
		return categoryList;
	}
	// 카테고리별 제품 목록을 보여주는 메서드 - getCategoryItem(category)
	
	// 렌탈 상품을 등록하는 메서드 - addRental 시작
		public void addRental(RentalDTO rdto) {
		    try {
		        // 1. 디비 연결
		        con = getCon();

		        // 2. SQL 실행 
		        sql = "Insert Into rental_item (rental_item_name, rental_item_price, "
		                + "rental_opt_quantity, rental_opt_name, rental_opt_value, rental_img_main, rental_img_sub, "
		                + "rental_img_logo, category_id ) VALUES (?,?,?,?,?,?,?,?,?);";

		        // pstmt 초기화
		        pstmt = con.prepareStatement(sql);

		        pstmt.setString(1, rdto.getRental_item_name());
		        pstmt.setInt(2, rdto.getRental_item_price());
		        pstmt.setInt(3, rdto.getRental_opt_quantity());
		        pstmt.setString(4, rdto.getRental_opt_name());
		        pstmt.setString(5, rdto.getRental_opt_value());
		        pstmt.setString(6, rdto.getRental_img_main());
		        pstmt.setString(7, rdto.getRental_img_sub());
		        pstmt.setString(8, rdto.getRental_img_logo());
		        pstmt.setInt(9, rdto.getCategory_id());
		        pstmt.executeUpdate();

		        System.out.println("RentalDAO : 렌탈 등록 성공!");

		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        CloseDB();
		    }
		}
		// 렌탈 상품을 등록하는 메서드 - addRental 끝
		
		// 특정 렌탈 아이템 정보를 조회하는 메서드 - getRentalItem()
		public RentalDTO getReserveRentalItem(int rItemId, LocalDate strd) {
			RentalDTO rdto = null;
			
			try {
				con =getCon();
				sql = "select * from rental_item where rental_item_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rItemId);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					rdto = new RentalDTO();
					rdto.setRental_item_id(rItemId);
					rdto.setRental_item_name(rs.getString("rental_item_name"));
					rdto.setRental_item_price(rs.getInt("rental_item_price"));
					rdto.setRental_opt_quantity(rs.getInt("rental_opt_quantity"));
					rdto.setRental_opt_name(rs.getString("rental_opt_name"));;
					rdto.setRental_opt_value(rs.getString("rental_opt_value"));
					rdto.setRental_img_main(rs.getString("rental_img_main"));
					rdto.setRental_img_sub(rs.getString("rental_img_sub"));
					rdto.setRental_img_logo(rs.getString("rental_img_logo"));
					rdto.setCategory_id(rs.getInt("category_id"));
					rdto.setRental_days(rs.getInt("rental_days"));
					rdto.setRental_str(strd);
					if(rs.getInt("rental_days")==2) {						
						rdto.setRental_end(strd.plusDays(2));					
					}else if(rs.getInt("rental_days")==3) {
						rdto.setRental_end(strd.plusDays(3));											
					}
					
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
