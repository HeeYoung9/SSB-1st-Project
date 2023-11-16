package com.ssb.myPage.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class myPageDAO {
	
	// 공통변수
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql ="";
	
	// 공통메서드(기능)
	// 디비연결 메서드
	private Connection getCon() throws Exception {
		// 프로젝트의 정보를 확인(JNDI)
		Context initCTX = new InitialContext();
		
		// 프로젝트 안에 작성된 디비 연결정보(context.xml)를 불러오기
		DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/ssb");
		
		// 디비 연결 수행
		con = ds.getConnection();
		System.out.println(" DAO : 디비연결 성공!(커넥션풀)");
		System.out.println(" DAO : "+ con);
		
		return con;
	}
	
	// 디비 연결(자원) 해제 메서드
	public void CloseDB() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
			
			System.out.println(" DAO :  디비 자원해제 완료!");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 회원정보 조회 메서드 - getMemberList(id)
	public myPageDTO getMember(String userId) {
		myPageDTO dto = new myPageDTO();
		
		try {
			con = getCon();
			sql = "select * from member where member_user_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dto.setMember_user_id(rs.getString("member_user_id"));
				dto.setMember_pw(rs.getString("member_pw"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setMember_birth(rs.getDate("member_birth"));
				dto.setMember_gender(rs.getString("member_gender"));
				dto.setMember_email(rs.getString("member_email"));
				dto.setMember_phone(rs.getString("member_phone"));
				dto.setMember_regdate(rs.getTimestamp("member_regdate"));
				dto.setMember_payment(rs.getInt("member_payment"));
				dto.setMember_point(rs.getInt("member_point"));
				dto.setMember_grade(rs.getString("member_grade"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return dto;
	}
}
