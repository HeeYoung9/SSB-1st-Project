package com.itwillbs.ssb.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class cartDAO {
	// 공통 변수 선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";

	// 공통) 디비 연결하기(CP)
	private Connection getCon() throws Exception {

		Context initCTX = new InitialContext();
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/ssb");
		con = ds.getConnection();

		System.out.println(" DAO : 디비연결 성공!! ");
		System.out.println(" DAO : " + con);
		return con;
	}

	// 공통) 디비 자원해제
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

	// 장바구니 목록 조회 메서드
	public ArrayList<cartDTO> getCart(String member_id) {
		ArrayList<cartDTO> dtoArray = new ArrayList<cartDTO>();
		cartDTO dto = null;
		try {
			con = getCon();
			sql = "SELECT cart_id,C.item_id,cart_quantity,item_name,item_img_main,C.options_id,options_name,options_value,options_price,options_quantity FROM cart C JOIN item I ON C.item_id = I.item_id JOIN options O ON I.item_id = O.item_id AND C.options_id = O.options_id WHERE member_id = ? ORDER BY cart_id";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new cartDTO();
				dto.setCart_id(rs.getInt("cart_id"));
				dto.setItem_id(rs.getInt("item_id"));
				dto.setCart_quantity(rs.getInt("cart_quantity"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setItem_img_main(rs.getString("item_img_main"));
				dto.setOptions_id(rs.getInt("options_id"));
				dto.setOptions_name(rs.getString("options_name"));
				dto.setOptions_value(rs.getString("options_value"));
				dto.setOptions_price(rs.getInt("options_price"));
				dto.setOptions_quantity(rs.getInt("options_quantity"));
				dtoArray.add(dto);
				System.out.println("dto 추가");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return dtoArray;
	}
	//주문 페이지 이동 메서드
	public ArrayList<orderDTO> getOrder(String cart_id) {
		ArrayList<orderDTO> dtoArray = new ArrayList<orderDTO>();
		orderDTO dto = null;
		try {
			con = getCon();
			sql = "SELECT item_name,options_name,options_value,cart_quantity,options_price FROM cart C JOIN item I ON C.item_id = I.item_id JOIN options O ON C.options_id = O.options_id WHERE cart_id IN(" + cart_id + ")";
			pstmt = con.prepareStatement(sql);
			System.out.println(pstmt);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new orderDTO();
				dto.setItem_name(rs.getString("item_name"));
				dto.setOptions_name(rs.getString("options_name"));
				dto.setOptions_value(rs.getString("options_value"));
				dto.setCart_quantity(rs.getInt("cart_quantity"));
				dto.setOptions_price(rs.getInt("options_price"));
				dtoArray.add(dto);
				System.out.println("dto 추가");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return dtoArray;
	}

}
