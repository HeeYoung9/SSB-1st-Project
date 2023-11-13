package com.ssb.location.db;

import java.util.ArrayList;

import com.ssb.util.DAO;

public class locationDAO extends DAO{
	
	// 배송지 조회 메서드
	public ArrayList<locationDTO> getlocation(String member_id) {
		ArrayList<locationDTO> dtoArray = new ArrayList<locationDTO>();
		locationDTO dto = null;
		try {
			con = getCon();
			sql = "SELECT * FROM location WHERE member_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			System.out.println("전송된 쿼리 : " + pstmt);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new locationDTO();
				dto.setLocation_id(rs.getInt("location_id"));
				dto.setLocation_name(rs.getString("location_name"));
				dto.setLocation_phone(rs.getString("location_phone"));
				dto.setLocation_postcode(rs.getString("location_postcode"));
				dto.setLocation_add(rs.getString("location_add"));
				dto.setLocationD_add(rs.getString("locationD_add"));
				dto.setLocation_title(rs.getString("location_title"));
				dto.setLocation_requested(rs.getString("location_requested"));
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

	// 배송지 등록 메서드
	public int insertLocation(locationDTO dto) {
		int result = -1;
		try {
			con = getCon();
			sql = "INSERT INTO location VALUES(DEFAULT,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getLocation_name());
			pstmt.setString(2, dto.getLocation_phone());
			pstmt.setString(3, dto.getLocation_postcode());
			pstmt.setString(4, dto.getLocation_add());
			pstmt.setString(5, dto.getLocationD_add());
			pstmt.setString(6, dto.getLocation_title());
			pstmt.setString(7, dto.getLocation_requested());
			pstmt.setInt(8, dto.getMember_id());
			System.out.println("전송된 쿼리 : " + pstmt);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return result;
	}
	
	//배송지 수정 메서드
	public int rewriteLocation(locationDTO dto) {
		int result = -1;
		try {
			con = getCon();
			sql = "UPDATE location SET location_name = ?,location_phone = ?,location_postcode = ?,location_add = ?,locationD_add = ?,location_title = ?,location_requested = ? WHERE location_id = ? AND member_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getLocation_name());
			pstmt.setString(2, dto.getLocation_phone());
			pstmt.setString(3, dto.getLocation_postcode());
			pstmt.setString(4, dto.getLocation_add());
			pstmt.setString(5, dto.getLocationD_add());
			pstmt.setString(6, dto.getLocation_title());
			pstmt.setString(7, dto.getLocation_requested());
			pstmt.setInt(8, dto.getLocation_id());
			pstmt.setInt(9, dto.getMember_id());
			System.out.println("전송된 쿼리 : " + pstmt);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return result;
	}
	
	//배송지 수정 페이지 이동 메서드
	public locationDTO getReWrite(int location_id, int member_id) {
		locationDTO dto = null;
		try {
			con = getCon();
			sql = "SELECT * FROM location WHERE location_id = ? AND member_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, location_id);
			pstmt.setInt(2, member_id);
			System.out.println("전송된 쿼리 : " + pstmt);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new locationDTO();
				dto.setLocation_id(rs.getInt("location_id"));
				dto.setLocation_name(rs.getString("location_name"));
				dto.setLocation_phone(rs.getString("location_phone"));
				dto.setLocation_postcode(rs.getString("location_postcode"));
				dto.setLocation_add(rs.getString("location_add"));
				dto.setLocationD_add(rs.getString("locationD_add"));
				dto.setLocation_title(rs.getString("location_title"));
				dto.setLocation_requested(rs.getString("location_requested"));
				dto.setMember_id(rs.getInt("member_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return dto;
	}
	
	//배송지 삭제 메서드
	public int deleteLocation(int location_id, int member_id) {
		int result = -1;
		try {
			con = getCon();
			sql = "DELETE FROM location WHERE location_id = ? AND member_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, location_id);
			pstmt.setInt(2, member_id);
			System.out.println("전송된 쿼리 : " + pstmt);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return result;
	}
}
