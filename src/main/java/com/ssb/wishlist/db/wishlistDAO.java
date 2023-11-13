package com.ssb.wishlist.db;

import java.util.ArrayList;

import com.ssb.util.DAO;

public class wishlistDAO extends DAO{
	
	//위시리스트 조회 메서드
	public ArrayList<wishlistDTO> getWishlist(String member_id) {
		ArrayList<wishlistDTO> dtoArray = new ArrayList<wishlistDTO>();
		wishlistDTO dto = null;
		try {
			con = getCon();
			sql = "SELECT * FROM wishlist WHERE member_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			System.out.println("전송된 쿼리 : " + pstmt);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new wishlistDTO();
				dto.setWishlist_id(rs.getInt("location_id"));
				dto.setItem_id(rs.getInt("item_id"));
				dto.setMember_id(rs.getInt("member_id"));
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
