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
	
	// 회원가입 메서드 - insertMember(dto)
	public void insertMember(MemberDTO dto) {
		try {
			con = getcon();
			System.out.println("DAO : DB 연결!");
			
			sql = "insert into member (member_user_id,member_pw,member_name,member_birth,member_gender,"
					+ "member_email,member_phone,member_regdate,member_situation,member_agree) values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getMember_user_id());
			pstmt.setString(2, dto.getMember_pw());
			pstmt.setString(3, dto.getMember_name());
			pstmt.setDate(4, dto.getMember_birth());
			pstmt.setString(5, dto.getMember_gender());
			pstmt.setString(6, dto.getMember_email());
			pstmt.setString(7, dto.getMember_phone());
			pstmt.setTimestamp(8, dto.getMember_regdate());
			pstmt.setString(9, dto.getMember_situation());
			pstmt.setString(10, dto.getMember_agree());
			
			// 4. sql 실행
			pstmt.executeUpdate();
			
			System.out.println("DAO : 회원가입 성공!");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	// 회원가입 메서드 - insertMember(dto)
	
	// 회원가입 아이디 중복체크 메서드 - checkId(member_user_id)
	public int checkId(String member_user_id) { // 유저가 입력한 값을 매개변수로 한다
		int idCheck = -1;
		System.out.println(member_user_id);
		try {
			con = getcon();
			
			sql = "select * from member where member_user_id = ? "; // 입력값이 테이블에 있는지 확인
			pstmt = con.prepareStatement(sql);
			
			// ???
			pstmt.setString(1, member_user_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				idCheck = -1; // 이미 존재하는 경우, 생성 불가능
			}else {
				idCheck = 1; // 존재하지 않는 경우, 생성 가능
			}
			
			System.out.println("DAO : 회원가입 아이디 중복체크 완료("+idCheck+")");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			CloseDB();
		}
		
		return idCheck;
	}
	// 회원가입 아이디 중복체크 메서드 - checkId(member_user_id)
}
