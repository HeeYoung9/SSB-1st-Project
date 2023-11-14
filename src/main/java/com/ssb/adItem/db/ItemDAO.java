package com.ssb.adItem.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * ItemDAO : DB관련 처리를 수행하는 객체 (Data Access Object)
 */

public class ItemDAO {

	// Connection Pool
	// (0) 공통 변수 선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";

	// (1) 디비 연결하기(CP)
	private Connection getCon() throws Exception {

		Context initCTX = new InitialContext();
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/ssb");
		con = ds.getConnection();

		System.out.println(" \n ItemDAO : 디비연결 성공!! ");
//		System.out.println(" DAO : " + con);
		return con;
	}

	// (2) 디비 자원해제
	public void CloseDB() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// ================================================================================

	// (1) 상품 관리 페이지를 가져오는 메서드 - getItemMgt(int startRow,int pageSize) 시작
	public ArrayList getItemMgt(int startRow, int pageSize) {

		// 상품 정보를 저장하는 배열
		ArrayList ItemMgt = new ArrayList();

		try {
			// 디비연결정보
			// 1. 드라이버 로드
			// 2. 디비 연결
			con = getCon();
			// 3. SQL 작성(select) & pstmt 객체
			sql = " select c.category_code, i.item_id, i.item_img_main, i.item_price, c.category_id, o.options_id, "
					+ "o.options_name, o.options_value, o.options_quantity, c.category_sport, c.category_major, "
					+ "c.category_sub, c.category_brand, i.item_name from options o join item i on i.item_id=o.item_id "
					+ "join category c on i.category_id=c.category_id order by item_id desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			// ???? 처리
			pstmt.setInt(1, startRow - 1); // 시작행번호-1
			pstmt.setInt(2, pageSize); // 개수
			// 4. SQL 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			// 상품 정보 전부 가져오기
			// 객체 여러개 => ArrayList 저장
			while (rs.next()) {
				// rs -> dto -> list
				ItemDTO dto = new ItemDTO();

				dto.setItem_id(rs.getInt("item_id"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setItem_price(rs.getInt("Item_price")); // 기존 가격(옵션테이블) -> (아이템테이블)
				dto.setItem_img_main(rs.getString("item_img_main"));
				dto.setCategory_id(rs.getInt("category_id"));
				dto.setCategory_code(rs.getInt("category_code"));
				dto.setCategory_sport(rs.getString("category_sport"));
				dto.setCategory_major(rs.getString("category_major"));
				dto.setCategory_sub(rs.getString("category_sub"));
				dto.setCategory_brand(rs.getString("category_brand"));
				dto.setOptions_id(rs.getInt("options_id"));
				dto.setOptions_name(rs.getString("options_name"));
				dto.setOptions_value(rs.getString("options_value"));
				dto.setOptions_quantity(rs.getInt("options_quantity"));
				// rs -> dto 저장완료
				ItemMgt.add(dto);
				// dto -> list 저장완료

			} // while

			System.out.println(" \n ItemDAO : 상품 관리 페이지가 열렸다! ");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return ItemMgt;
	}
	// (1) 상품 관리 페이지를 가져오는 메서드 - getItemMgt(int startRow,int pageSize) 끝

	// (2) 상품 관리 페이지를 가져오는 메서드 (검색 기능) - getItemMgt (int startRow, int pageSize,
	// String search) 시작
	public ArrayList getItemMgt(int startRow, int pageSize, String search) {
		ArrayList ItemMgt = new ArrayList();
		try {
			con = getCon();
			sql = " select c.category_code, i.item_id, i.item_img_main, i.item_price, c.category_id, o.options_id, "
					+ "o.options_name, o.options_value, o.options_quantity, c.category_sport, c.category_major, "
					+ "c.category_sub, c.category_brand, i.item_name from options o join item i on i.item_id=o.item_id "
					+ "join category c on i.category_id=c.category_id where i.item_name like ? order by item_id desc limit ?,?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, "%" + search + "%"); // %상품명 검색어%
			pstmt.setInt(2, startRow - 1); // 시작행번호-1
			pstmt.setInt(3, pageSize); // 개수
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ItemDTO dto = new ItemDTO();

				dto.setItem_id(rs.getInt("item_id"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setItem_price(rs.getInt("item_price")); // 기존 가격(옵션테이블) -> (아이템테이블)
				dto.setItem_img_main(rs.getString("item_img_main"));
				dto.setCategory_id(rs.getInt("category_id"));
				dto.setCategory_code(rs.getInt("category_code"));
				dto.setCategory_sport(rs.getString("category_sport"));
				dto.setCategory_major(rs.getString("category_major"));
				dto.setCategory_sub(rs.getString("category_sub"));
				dto.setCategory_brand(rs.getString("category_brand"));
				dto.setOptions_id(rs.getInt("options_id"));
				dto.setOptions_name(rs.getString("options_name"));
				dto.setOptions_value(rs.getString("options_value"));
				dto.setOptions_quantity(rs.getInt("options_quantity"));
				ItemMgt.add(dto);

			} // while

			System.out.println(" \n ItemDAO : 상품 검색 성공! ");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return ItemMgt;
	}
	// (2) 상품 관리 페이지를 가져오는 메서드 (검색 기능) - getItemMgt (int startRow, int pageSize,
	// String search) 끝

	// (3) 상품 개수 계산 메서드 - getItemCount() 시작
	public int getItemCount() {
		int result = 0;

		try {
			// 1. 드라이버 로드
			// 2. 디비 연결
			con = getCon();

			// 3. sql 작성(select) & pstmt 객체
			sql = "select count(*) from options";
			pstmt = con.prepareStatement(sql);

			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리 - 개수를 저장
			if (rs.next()) {
				result = rs.getInt(1);
			}
			System.out.println(" \n ItemDAO : 전체 상품 개수 " + result + "개");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return result;
	}
	// (3) 상품 개수 계산 메서드 - getItemCount() 끝

	// (4) 상품 개수 계산 메서드 - getItemCount(String search) 시작
	public int getItemCount(String search) {
		int result = 0;

		try {
			// 1. 드라이버 로드
			// 2. 디비 연결
			con = getCon();

			// 3. sql 작성(select) & pstmt 객체
			sql = " select count(*) from options o join item i on i.item_id=o.item_id where item_name like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%"); // %상품명 검색어%
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리 - 개수를 저장
			if (rs.next()) {
				result = rs.getInt(1);
			}
			System.out.println(" ItemDAO : 검색 조건과 일치하는 상품 개수 " + result + "개");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return result;
	}
	// (4) 상품 개수 계산 메서드 - getItemCount(String search) 끝

	// (5) 특정 상품 정보를 가져오는 메서드 - getItem(ino) 시작
	public ItemDTO getItem(int ino) {
		ItemDTO dto = null;

		try {
			// 1.2. 디비연결
			con = getCon();
			// 3. sql 구문 작성(select) & pstmt 객체
			sql = "select * from options o join item i on i.item_id = o.item_id "
					+ "join category c on c.category_id=i.category_id where options_id = ? && item_id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ino);
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리 (rs -> dto)
			if (rs.next()) {
				dto = new ItemDTO();
				/* 아이템 + 카테고리 + 옵션 */
				dto.setItem_id(rs.getInt("item_id"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setItem_price(rs.getInt("item_price")); // 기존 가격(옵션테이블) -> (아이템테이블)
				dto.setItem_img_main(rs.getString("item_img_main"));
				dto.setItem_img_main(rs.getString("item_img_sub"));
				dto.setItem_img_main(rs.getString("item_img_logo"));
				dto.setCategory_id(rs.getInt("category_id"));
				dto.setCategory_code(rs.getInt("category_code"));
				dto.setCategory_sport(rs.getString("category_sport"));
				dto.setCategory_major(rs.getString("category_major"));
				dto.setCategory_sub(rs.getString("category_sub"));
				dto.setCategory_brand(rs.getString("category_brand"));
				dto.setOptions_id(rs.getInt("options_id"));
				dto.setOptions_name(rs.getString("options_name"));
				dto.setOptions_value(rs.getString("options_value"));
				dto.setOptions_quantity(rs.getInt("options_quantity"));
			} // if

			System.out.println(" DAO : 상품 정보 조회성공!");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return dto;
	}
	// (5) 특정 상품 정보를 가져오는 메서드 - getItem(ino) 시작

	// (6) 특정 상품 정보[재고 수량]을 수정하는 메서드 - quantityItem 시작
	public int quantityItem(int optionsId, int newQuantity) {
		int result = 0;

		try {
			con = getCon();

			sql = "update options SET options_quantity = ? WHERE options_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, newQuantity);
			pstmt.setInt(2, optionsId);

			result = pstmt.executeUpdate();

			System.out.println("DAO: 수정완료! (" + result + ")");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return result;
	}
	// (6) 특정 상품 정보[재고 수량]을 수정하는 메서드 - quantityItem 끝

	// (7) 상품 등록 메서드 - addItem(ItemDTO) 시작

	/*
	 * public void addItem(ItemDTO dto) { try { //1.2. 디비연결 con = getCon(); //3. sql
	 * 작성 & pstmt 객체
	 * 
	 * sql =
	 * "insert into item (item_id, item_name, item_price, item_img_main, item_img_sub, item_img_logo, category_id) "
	 * +"values (?,?,?,?,?,?,?);"
	 * +"insert into category (category_id,category_code,category_sport,category_major,category_sub, category_brand) values (?,?,?,?,?,?);"
	 * +"insert into options (options_id, options_name, options_value, options_price, options_quantity, item_id) values (?,?,?,?,?,?)"
	 * ;
	 * 
	 * 
	 * sql =
	 * "insert into item (item_id, item_name, item_price, item_img_main, item_img_sub, item_img_logo, category_id) values (?,?,?,?,?,?,?);"
	 * ; pstmt = con.prepareStatement(sql); pstmt.setInt(1, dto.getItem_id());
	 * pstmt.setString(2, dto.getItem_name()); pstmt.setInt(3, dto.getItem_price());
	 * pstmt.setString(4, dto.getItem_img_main()); pstmt.setString(5,
	 * dto.getItem_img_sub()); pstmt.setString(6, dto.getItem_img_logo());
	 * pstmt.setInt(7, dto.getCategory_id()); pstmt.executeUpdate();
	 * 
	 * sql =
	 * "insert into category (category_id,category_code,category_sport,category_major,category_sub, category_brand) values (?,?,?,?,?,?);"
	 * ; pstmt = con.prepareStatement(sql); pstmt.setInt(1, dto.getCategory_id());
	 * pstmt.setInt(2, dto.getCategory_code()); pstmt.setString(3,
	 * dto.getCategory_sport()); pstmt.setString(4, dto.getCategory_major());
	 * pstmt.setString(5, dto.getCategory_sub()); pstmt.setString(6,
	 * dto.getCategory_brand()); pstmt.executeUpdate();
	 * 
	 * sql =
	 * "insert into options (options_id, options_name, options_value, options_price, options_quantity, item_id) values (?,?,?,?,?,?);"
	 * ; pstmt = con.prepareStatement(sql); pstmt.setInt(1, dto.getOptions_id());
	 * pstmt.setString(2, dto.getOptions_name()); pstmt.setString(3,
	 * dto.getOptions_value()); pstmt.setInt(4, dto.getOptions_price());
	 * pstmt.setInt(5, dto.getOptions_quantity()); pstmt.setInt(6,
	 * dto.getItem_id()); pstmt.executeUpdate();
	 * 
	 * 
	 * pstmt = con.prepareStatement(sql); // ??? pstmt.setInt(1, dto.getItem_id());
	 * pstmt.setString(2, dto.getItem_name()); pstmt.setInt(3, dto.getItem_price());
	 * pstmt.setString(4, dto.getItem_img_main()); pstmt.setString(5,
	 * dto.getItem_img_sub()); pstmt.setString(6, dto.getItem_img_logo());
	 * pstmt.setInt(7, dto.getCategory_id()); pstmt.setInt(8,
	 * dto.getCategory_code()); pstmt.setString(9, dto.getCategory_sport());
	 * pstmt.setString(10, dto.getCategory_major()); pstmt.setString(11,
	 * dto.getCategory_sub()); pstmt.setString(12, dto.getCategory_brand());
	 * pstmt.setInt(13, dto.getOptions_id()); pstmt.setString(14,
	 * dto.getOptions_name()); pstmt.setString(15, dto.getOptions_value());
	 * pstmt.setInt(16, dto.getOptions_price()); pstmt.setInt(17,
	 * dto.getOptions_quantity());
	 * 
	 * //4. sql 실행 pstmt.executeUpdate();
	 * 
	 * System.out.println(" ItemDAO : 상품등록 성공! ");
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } finally { CloseDB(); } }
	 */
	// (7) 상품 등록 메서드 - addItem(ItemDTO) 끝
	
	
	
	
	public void addItem(ItemDTO dto) {
	    try {
	        //1.2. 디비연결
	        con = getCon();
	        
	        // 첫 번째 SQL 실행
	        sql = "insert into item (item_id, item_name, item_price, item_img_main, item_img_sub, item_img_logo, category_id) values (?,?,?,?,?,?,?);";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, dto.getItem_id());
	        pstmt.setString(2, dto.getItem_name());
	        pstmt.setInt(3, dto.getItem_price());
	        pstmt.setString(4, dto.getItem_img_main());
	        pstmt.setString(5, dto.getItem_img_sub());
	        pstmt.setString(6, dto.getItem_img_logo());
	        pstmt.setInt(7, dto.getCategory_id());
	        pstmt.executeUpdate();

	        // 두 번째 SQL 실행
	        sql = "insert into category (category_id,category_code,category_sport,category_major,category_sub, category_brand) values (?,?,?,?,?,?);";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, dto.getCategory_id());
	        pstmt.setInt(2, dto.getCategory_code());
	        pstmt.setString(3, dto.getCategory_sport());
	        pstmt.setString(4, dto.getCategory_major());
	        pstmt.setString(5, dto.getCategory_sub());
	        pstmt.setString(6, dto.getCategory_brand());
	        pstmt.executeUpdate();

	        // 세 번째 SQL 실행
	        sql = "insert into options (options_id, options_name, options_value, options_price, options_quantity, item_id) values (?,?,?,?,?,?);";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, dto.getOptions_id());
	        pstmt.setString(2, dto.getOptions_name());
	        pstmt.setString(3, dto.getOptions_value());
	        pstmt.setInt(4, dto.getOptions_price());
	        pstmt.setInt(5, dto.getOptions_quantity());
	        pstmt.setInt(6, dto.getItem_id());
	        pstmt.executeUpdate();

	        System.out.println(" ItemDAO : 상품등록 성공! ");

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        CloseDB();
	    }
	}

	
	
	

} // ItemDAO