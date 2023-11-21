package com.ssb.cart.db;

import java.util.ArrayList;

import com.ssb.util.DAO;

public class cartDAO extends DAO{
	
	// 장바구니 목록 조회 메서드
	public ArrayList<cartDTO> getCart(String member_id) {
		ArrayList<cartDTO> dtoArray = new ArrayList<cartDTO>();
		cartDTO dto = null;
		try {
			con = getCon();
			sql = "SELECT cart_id,C.item_id,cart_quantity,item_name,item_img_main,item_price,C.options_id,options_name,options_value,options_price,options_quantity FROM cart C LEFT JOIN item I ON C.item_id = I.item_id LEFT JOIN options O ON I.item_id = O.item_id AND C.options_id = O.options_id WHERE member_id = ? ORDER BY cart_id";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			System.out.println("전송된 쿼리 : " + pstmt);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new cartDTO();
				dto.setCart_id(rs.getInt("cart_id"));
				dto.setItem_id(rs.getInt("item_id"));
				dto.setCart_quantity(rs.getInt("cart_quantity"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setItem_img_main(rs.getString("item_img_main"));
				dto.setItem_price(rs.getInt("item_price"));
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

	// 주문 페이지 이동 메서드
	public ArrayList<orderDTO> getOrder(String cart_id) {
		ArrayList<orderDTO> dtoArray = new ArrayList<orderDTO>();
		orderDTO dto = null;
		try {
			con = getCon();
			sql = "SELECT item_name,options_name,options_value,cart_quantity,item_price,options_price FROM cart C JOIN item I ON C.item_id = I.item_id JOIN options O ON C.options_id = O.options_id WHERE cart_id IN(" + cart_id + ")";
			pstmt = con.prepareStatement(sql);
			System.out.println("전송된 쿼리 : " + pstmt);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new orderDTO();
				dto.setItem_name(rs.getString("item_name"));
				dto.setOptions_name(rs.getString("options_name"));
				dto.setOptions_value(rs.getString("options_value"));
				dto.setCart_quantity(rs.getInt("cart_quantity"));
				dto.setItem_price(rs.getInt("item_price"));
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
	//옵션 재고 감소 메서드
	public void decreaseQuantity(String cart_idArr) {
		String[] cart_idArray = cart_idArr.split(",");
		ArrayList<Integer> result = new ArrayList<Integer>();
		try {
			con = getCon();
			for (String cart_id : cart_idArray) {
				sql = "UPDATE options SET options_quantity = options_quantity - (SELECT cart_quantity FROM cart WHERE cart_id = ?) WHERE options_id = (SELECT options_id FROM cart WHERE cart_id = ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(cart_id));
				pstmt.setInt(2, Integer.parseInt(cart_id));
				System.out.println("전송된 쿼리 : " + pstmt);
				result.add(pstmt.executeUpdate());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	//옵션 재고 증가 메서드
	public void increaseQuantity(String cart_idArr) {
		String[] cart_idArray = cart_idArr.split(",");
		ArrayList<Integer> result = new ArrayList<Integer>();
		try {
			con = getCon();
			for (String cart_id : cart_idArray) {
				sql = "UPDATE options SET options_quantity = options_quantity + (SELECT cart_quantity FROM cart WHERE cart_id = ?) WHERE options_id = (SELECT options_id FROM cart WHERE cart_id = ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(cart_id));
				pstmt.setInt(2, Integer.parseInt(cart_id));
				System.out.println("전송된 쿼리 : " + pstmt);
				result.add(pstmt.executeUpdate());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	
	// 장바구니 목록 조회 메서드
		public ArrayList<cartDTO> getCartsV2(String cart_id) {
			ArrayList<cartDTO> dtoArray = new ArrayList<cartDTO>();
			cartDTO dto = null;
			try {
				con = getCon();
				sql = "SELECT cart_id, C.options_id, C.item_id, item_name,options_name,options_value,cart_quantity,options_price FROM cart C JOIN item I ON C.item_id = I.item_id JOIN options O ON C.options_id = O.options_id WHERE cart_id IN(" + cart_id + ")";
				pstmt = con.prepareStatement(sql);
				System.out.println(pstmt);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					dto = new cartDTO();
					dto.setCart_id(rs.getInt("cart_id"));
					dto.setItem_id(rs.getInt("item_id"));
					dto.setOptions_id(rs.getInt("options_id"));
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

		public int insertCart(int member_id, ArrayList<cartDTO> dtoArray) {
			int check = 0;
			ArrayList<cartDTO> checkArray = new ArrayList<cartDTO>();
			try {
				con = getCon();
				sql = "SELECT cart_id FROM cart WHERE member_id = ? AND item_id = ? AND options_id = ?";
				for (cartDTO dto : dtoArray) {
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, member_id);
					pstmt.setInt(2, dto.getItem_id());
					pstmt.setInt(3, dto.getOptions_id());
					System.out.println(pstmt);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						checkArray.add(dto);
						check = 1;
					}
				}
				for (cartDTO cartDTO : checkArray) {
					dtoArray.remove(dtoArray.indexOf(cartDTO));
				}
				System.out.println("dtoArray.size() : " + dtoArray.size());
				sql = "INSERT INTO cart VALUES(DEFAULT,?,?,?,?,null)";
				if (dtoArray.size() != 0) {
					for (cartDTO dto : dtoArray) {
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, member_id);
						pstmt.setInt(2, dto.getItem_id());
						pstmt.setInt(3, dto.getCart_quantity());
						pstmt.setInt(4, dto.getOptions_id());
						System.out.println(pstmt);
						pstmt.executeUpdate();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				CloseDB();
			}
			return check;
		}
	
	
}
