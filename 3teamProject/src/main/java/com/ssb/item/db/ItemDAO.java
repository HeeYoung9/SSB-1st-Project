package com.ssb.item.db;

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

		System.out.println(" \n DAO : 디비연결 성공!! ");
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
				
	//================================================================================

	
	
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
			sql = "select i.item_id, item_img_main, item_name, options_price, category_id, "
					+ "options_name, options_value, options_quantity from item i join options o "
					+ "on i.item_id=o.item_id order by item_id desc limit ?,?";
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
				dto.setItem_img_main(rs.getString("item_img_main"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setOptions_price(rs.getInt("options_price"));
				dto.setCategory_id(rs.getInt("category_id"));
				dto.setOptions_name(rs.getString("options_name"));
				dto.setOptions_value(rs.getString("options_value"));
				dto.setOptions_quantity(rs.getInt("options_quantity"));
				// rs -> dto 저장완료
	            ItemMgt.add(dto);
	            // dto -> list 저장완료
		
			} // while

			System.out.println(" \n DAO : 상품 관리 페이지가 열렸다 ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return ItemMgt;
	}
	// (1) 상품 관리 페이지를 가져오는 메서드 - getItemMgt(int startRow,int pageSize) 끝
	
	

	
    // (2) 상품 관리 페이지를 가져오는 메서드 (검색 기능) - getItemMgt (int startRow, int pageSize, String search) 시작
    public ArrayList getItemMgt(int startRow, int pageSize, String search) {
        ArrayList ItemMgt = new ArrayList();
		try {
			con = getCon();
			sql = "select i.item_id, item_img_main, item_name, options_price, category_id, "
					+ "options_name, options_value, options_quantity from item i join options o "
					+ "on i.item_id=o.item_id where item_name like ? order by item_id desc limit ?,?";
            pstmt = con.prepareStatement(sql);
            
			pstmt.setString(1, "%"+search+"%"); // %상품명 검색어%
			pstmt.setInt(2, startRow - 1); // 시작행번호-1
			pstmt.setInt(3, pageSize); // 개수
            rs = pstmt.executeQuery();
           
            while (rs.next()) {
                ItemDTO dto = new ItemDTO();
                
        		dto.setItem_id(rs.getInt("item_id"));
				dto.setItem_img_main(rs.getString("item_img_main"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setOptions_price(rs.getInt("options_price"));
				dto.setCategory_id(rs.getInt("category_id"));
				dto.setOptions_name(rs.getString("options_name"));
				dto.setOptions_value(rs.getString("options_value"));
				dto.setOptions_quantity(rs.getInt("options_quantity"));
                ItemMgt.add(dto);
				
            } // while
            
			System.out.println(" \n DAO : 상품 검색 성공! ");
			
		} catch (Exception e) {
			e.printStackTrace();
        } finally {
            CloseDB();
        }
        
        return ItemMgt;
    }
    // (2) 상품 관리 페이지를 가져오는 메서드 (검색 기능) - getItemMgt (int startRow, int pageSize, String search) 끝
	
	
	
	

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
			System.out.println(" \n DAO : 전체 상품 개수 " + result + "개");

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
			pstmt.setString(1, "%"+search+"%"); // %상품명 검색어%	
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리 - 개수를 저장
			if (rs.next()) {
				result = rs.getInt(1);
			}
			System.out.println(" DAO : 검색 조건과 일치하는 상품 개수 " + result + "개");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return result;
	}
	// (4) 상품 개수 계산 메서드 - getItemCount(String search) 끝
    
    
    
    
    
	
	
} // ItemDAO



