package com.ssb.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
	
	// 공통변수
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql ="";
	
	// 공통메서드(기능)
	// 디비연결 메서드
	private Connection getcon() throws Exception {
		
		// 프로젝트의 정보를 확인(JNDI)
		Context initCTX = new InitialContext();
		
		// 프로젝트안에 작성된 디비 연결정보(context.xml)를 불러오기
		DataSource ds = (DataSource) initCTX.lookup("java:com/env/jdbc/mvc");
		
		// 디비 연결 수행
		con = ds.getConnection();
		System.out.println(" DAO : 디비연결 성공!(커넥션풀)");
		System.out.println(" DAO : "+ con);
		
		return null;
	}
	
	// 디비 연결(자원) 해제 메서드
	public void CloseDB() {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) rs.close();
				if(con != null) rs.close();
				
				System.out.println(" DAO :  디비 자원해제 완료!");
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	// 회원가입 메서드 - insertMember(dto)
	public void insertMember(MemberDTO dto) {
		try {
			con = getcon();
			
			sql = "insert into member (member_user_id,member_pw,member_name,member_birth,member_gender,member_email,member_phone,member_regdate,member_situation,member_agree) "
					+ "values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getMember_user_id());
			pstmt.setString(2, dto.getMember_pw());
			pstmt.setString(3, dto.getMember_name());
			pstmt.setDate(4, dto.getMember_birth());
			pstmt.setString(5, dto.getMember_user_id());
			pstmt.setString(6, dto.getMember_user_id());
			pstmt.setString(7, dto.getMember_user_id());
			pstmt.setString(8, dto.getMember_user_id());
			pstmt.setString(9, dto.getMember_user_id());
			pstmt.setString(10, dto.getMember_user_id());
			
			// 4. sql 실행
			pstmt.executeUpdate();
			
			System.out.println("DAO : 회원가입 성공!");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		// 회원가입 메서드 - insertMember(dto)
	}
}
