package com.ssb.update.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.ssb.member.db.MemberDTO;


public class updateDAO {
	
	// 공통변수
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql ="";
	
	// 공통메서드(기능)
	// 디비연결 메서드
	private Connection getcon() throws Exception {
		 if (con == null) {
		// 프로젝트의 정보를 확인(JNDI)
		Context initCTX = new InitialContext();
		
		// 프로젝트안에 작성된 디비 연결정보(context.xml)를 불러오기
		DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/ssb");
		
		// 디비 연결 수행
		con = ds.getConnection();
		System.out.println(" DAO : 디비연결 성공!(커넥션풀)");
		System.out.println(" DAO : "+ con);
		 }
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
			// 회원정보 조회 메서드 - getMember(id)
			public MemberDTO getMember(String id) {
				MemberDTO dto = null;
				
				try {
					//1.2. 디비연결
					con = getcon();
					//3. sql 작성(select) & pstmt 객체
					sql = "select * from member where id=?";
					pstmt = con.prepareStatement(sql);
					// ???
					pstmt.setString(1, id);
					//4. sql 실행
					rs = pstmt.executeQuery();
					//5. 데이터 처리 (DB에 저장된 정보(rs)를 DTO로 저장)
					if(rs.next()) {
						dto = new MemberDTO();
						// rs => dto 저장
						dto.setMember_user_id(rs.getString("id"));
						dto.setMember_pw(rs.getString("pw"));
						dto.setMember_name(rs.getString("name"));
						dto.setMember_birth(rs.getDate("birth"));
						dto.setMember_gender(rs.getString("gender"));
						dto.setMember_email(rs.getString("email"));
						dto.setMember_phone(rs.getString("phone"));
						dto.setMember_regdate(rs.getTimestamp("regdate"));
						dto.setMember_payment(rs.getInt("payment"));
						dto.setMember_point(rs.getInt("point"));
						dto.setMember_grade(rs.getString("grade"));
					}
					
					System.out.println(" DAO : 회원정보 조회 완료!");
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					CloseDB();
				}
				
				return dto;
			}
			// 회원정보 조회 메서드 - getMember(id)
			
			
				
	// 회원정보 수정 메서드 - updateMember(dto)
	public int updateMember(String userId, MemberDTO dto) {
	    int result = -1;  // -1  0  1

	    try {
	        //1.2. 디비연결
	        con = getcon();
	        //3. sql 작성(select) & pstmt객체
	        sql = "select pw from member where id=?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, userId);
	        //4. sql 실행
	        rs = pstmt.executeQuery();
	        //5. 데이터처리 
	        if (rs.next()) {
	            if (dto.getMember_pw().equals(rs.getString("pw"))) {
	                //3. sql 작성(update) & pstmt객체
	                sql = "update member set name=?, phone=?, pw=?, email=? where id=?";
	                pstmt = con.prepareStatement(sql);
	                pstmt.setString(1, dto.getMember_name());
	                pstmt.setString(2, dto.getMember_phone());
	                pstmt.setString(3, dto.getMember_pw());
	                pstmt.setString(4, dto.getMember_email());
	                pstmt.setString(5, userId); // userId로 수정

	                //4. sql 실행
	                result = pstmt.executeUpdate();
	                // result = 1;
	            } else {
	                result = 0; // 사용자의 비밀번호 오류
	            }
	        } else {
	            result = -1; // 회원정보X,에러발생
	        }

	        System.out.println(" DAO : 회원정보 수정완료! (" + result + ")");

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        CloseDB();
	    }

	    return result;
	}
	// 회원정보 수정 메서드 - updateMember(dto)


	}
