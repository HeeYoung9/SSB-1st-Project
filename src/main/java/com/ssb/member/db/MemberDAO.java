package com.ssb.member.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	private Connection getCon() throws Exception {
		
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
			con = getCon();
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
	
	// 회원가입 아이디 조회(중복체크) 메서드 - checkId(member_user_id)
	public int checkId(String member_user_id) { // 유저가 입력한 값을 매개변수로 한다
		int result = 2;
		String input = member_user_id;
//		System.out.println("input : " +input);
		
		if(member_user_id.contains("admin")) {
			// "admin" 이 포함된 경우, 생성 불가능
			result = -1; 
		}else if(member_user_id.equals("") || member_user_id == null){
			// 아이디가 비어있거나 null인 경우, 생성 불가능
			result = 0;
		}else if(!input.matches("^(?=.*[a-zA-Z])[a-zA-Z0-9]+$")){
			// 영문과 숫자로만 이루어져 있지 않은 경우+ 생성 불가능
			result = 1;
		}
		else {
			// 나머지 경우는 생성 가능
			try {
				con = getCon();
				
				sql = "select * from member where member_user_id = ? "; // 입력값이 테이블에 있는지 확인
				pstmt = con.prepareStatement(sql);
				
				// ???
				pstmt.setString(1, member_user_id);
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					// 이미 존재하는 경우, 생성 불가능
					result = -1; 
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				CloseDB();
			}
		}
		System.out.println("DAO : 회원가입 아이디 제어 완료("+result+")");
		
		return result;
	}
	// 회원가입 아이디 조회(중복체크) 메서드 - checkId(member_user_id)
	
	// 회원정보 조회 메서드 - getMember(member_id)
	public MemberDTO getMember(String id) {
		MemberDTO dto = null;
		try {
			// 1.2. 디비연결
			con = getCon();
			
			// 3. sql 작성(select) & pstmt 객체
			sql="select * from itwill_member where id=?";
			pstmt=con.prepareStatement(sql);
			
			// ???
			pstmt.setString(1, id);
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리 (DB에 저장된 정보(rs)를 DTO로 저장)
			
			if(rs.next()) {
				dto = new MemberDTO();
				
//				dto.setId(rs.getString("id"));
//				dto.setPw(rs.getString("pw"));
//				dto.setName(rs.getString("name"));
//				dto.setGender(rs.getString("gender"));
//				dto.setAge(rs.getInt("age"));
//				dto.setEmail(rs.getString("email"));
//				dto.setRegdate(rs.getTimestamp("regdate"));
			}
			
			System.out.println("DAO : 회원정보 조회 완료!");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return dto;
	}
	// 회원정보 조회 메서드 - getMember(id)
	
	// 회원정보 수정(회원탈퇴) 메서드 - updateMember(dto)
	public int updateMember(MemberDTO dto) {
		int result = -1;
		
		try {
			con =getCon();
			
			sql ="select pw from member where member_user_id = ?";
			pstmt=con.prepareStatement(sql);
			
			// ???
			pstmt.setString(1, dto.getMember_user_id());
			
			rs = pstmt.executeQuery();
			
			// 데이터 처리
			if(rs.next()) {
				if(dto.getMember_pw().equals(rs.getString("member_pw"))) {
					sql = "delete from member where id =?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, dto.getMember_user_id());
					
					result = pstmt.executeUpdate(); // 1 삭제완료
				}else {
					result = 0; // 비밀번호 오류
				}
			}else {
				result = -1; // 회원정보 없음
			}
			System.out.println("DAO : 회원정보 삭제 완료!("+result+")");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			CloseDB();
		}
		
		return result;
	}
	// 회원정보 수정(회원탈퇴) 메서드 - updateMember(dto)

	// 회원정보 삭제 메서드 - deleteMember(dto)
	public int deleteMember(int member_id) {
		int result = 0;
		
		try {
			con =getCon();
			
			sql ="delete from member where member_id = ?";
			pstmt=con.prepareStatement(sql);
			
			// ???
			pstmt.setInt(1, member_id);
			
			result = pstmt.executeUpdate();
			
			System.out.println("DAO : 회원정보 삭제 완료!("+result+")");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			CloseDB();
		}
		
		return result;
	}
	// 회원정보 삭제 메서드 - deleteMember(dto)

	// 회원정보 조회 메서드 - getMemberList(id)
	public ArrayList<MemberDTO> getMemberList() {
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		
		try {
			con = getCon();
			sql = "select * from member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				
				dto.setMember_id(rs.getInt("member_id"));
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
				dto.setMember_situation(rs.getString("member_situation"));
				dto.setMember_outdate(rs.getTimestamp("member_outdate"));
				dto.setMember_agree(rs.getString("member_agree"));
				
				memberList.add(dto);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			CloseDB();
		}
		return memberList;
	}
	// 회원정보 조회 메서드 - getMemberList(id)
	
	// 회원정보 개수 계산 메서드 - getBoardCount()
		public int getMemberCount(){
			int result = 0;
			
			try {
				// 1. 드라이버 로드
				// 2. 디비 연결
				con = getCon();
				
				// 3. sql 작성(select) & pstmt 객체
				sql = "select count(*) from member";
				pstmt  =  con.prepareStatement(sql);
				
				// 4. sql 실행
				rs = pstmt.executeQuery();
				System.out.println(" SQL 실행! ");
				
				// 5. 데이터 처리 - 개수를 저장
				if(rs.next()) {
					result = rs.getInt(1);
				}
				
				System.out.println(" DAO : 개수 "+result+"개");
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				CloseDB();
			}
			
			return result;
		}
	// 회원정보 개수 계산 메서드 - getBoardCount()
	
	// 회원정보 개수 계산 메서드 - getBoardCount(String search) - 검색기능
	public int getMemberCount(String search){
		int result = 0;
		
		try {
			// 1. 드라이버 로드
			// 2. 디비 연결
			con = getCon();
			
			// 3. sql 작성(select) & pstmt 객체
			sql = "select count(*) from member where member_user_id like ? or member_name like ? or member_phone like ? or member_situation like ?";
			pstmt  =  con.prepareStatement(sql);
			
			// ???
			pstmt.setString(1, "%"+search+"%");
			pstmt.setString(2, "%"+search+"%");
			pstmt.setString(3, "%"+search+"%");
			pstmt.setString(4, "%"+search+"%");
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			System.out.println(" SQL 실행! ");
			
			// 5. 데이터 처리 - 개수를 저장
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
			System.out.println(" DAO : 개수 "+result+"개");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return result;
	}
	// 회원정보 개수 계산 메서드 - getBoardCount(String search)
	
	// 회원 정보 목록을 가져오는 메서드 - getBoardList(int startRow, int pageSize)
	public ArrayList<MemberDTO> getMemberList(int startRow, int pageSize) {
	    // 회원정보를 저장하는 배열
	    ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
	    try {
	        // 디비연결정보
	        // 1. 드라이버 로드
	        // 2. 디비 연결
	        con = getCon();

	        // 3. SQL 작성(select) & pstmt 객체
	        sql = "select * from member order by member_id limit ?,?";
	        pstmt = con.prepareStatement(sql);

	        // ???
	        pstmt.setInt(1, startRow - 1); // 시작행번호-1
	        pstmt.setInt(2, pageSize); // 개수

	        // 4. SQL 실행
	        rs = pstmt.executeQuery();

	        // 5. 데이터 처리
	        // 회원 정보 전부 가져오기
	        // BoardBean 객체 여러개 => ArrayList 저장
	        while (rs.next()) {
	            // 글 하나의 정보 => BoardBean 저장
	            MemberDTO dto = new MemberDTO();

	            dto.setMember_id(rs.getInt("member_id"));
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
	            dto.setMember_situation(rs.getString("member_situation"));
	            dto.setMember_outdate(rs.getTimestamp("member_outdate"));
	            dto.setMember_agree(rs.getString("member_agree"));

	            // 회원 하나의 정보를 배열의 한 칸에 저장
	            memberList.add(dto);

	        } // while

	        System.out.println("DAO: 게시판 글 목록 조회 성공!");
	        System.out.println("DAO: " + memberList.size());

	    } catch (SQLException e) {
	        e.printStackTrace(); // SQLException 출력
	    } catch (Exception e) {
	        e.printStackTrace(); // 그 외 예외 출력
	    } finally {
	        CloseDB();
	    }

	    return memberList;
	}
	// 회원 정보 목록을 가져오는 메서드 - getBoardList(int startRow, int pageSize)

	// 회원 정보 목록을 가져오는 메서드 - getBoardList(int startRow, int pageSize, String search)
	public ArrayList<MemberDTO> getMemberList(int startRow, int pageSize, String search) {
	    // 글정보를 저장하는 배열
	    ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
	    try {
	        // 디비연결정보
	        // 1. 드라이버 로드
	        // 2. 디비 연결
	        con = getCon();

	        // 3. SQL 작성(select) & pstmt 객체
	        sql = "select * from member where member_user_id like ? or member_name like ? or member_phone like ? or member_situation like ? order by member_id limit ?,?";
	        pstmt = con.prepareStatement(sql);

	        // ???
	        pstmt.setString(1, "%" + search + "%"); // %검색어%
	        pstmt.setString(2, "%" + search + "%"); // %검색어%
	        pstmt.setString(3, "%" + search + "%"); // %검색어%
	        pstmt.setString(4, "%" + search + "%"); // %검색어%
	        pstmt.setInt(5, startRow - 1); // 시작행번호-1
	        pstmt.setInt(6, pageSize); // 개수

	        // 4. SQL 실행
	        rs = pstmt.executeQuery();

	        // 5. 데이터 처리
	        // 회원 정보 전부 가져오기
	        // BoardBean 객체 여러개 => ArrayList 저장
	        while (rs.next()) {
	            MemberDTO dto = new MemberDTO();

	            dto.setMember_id(rs.getInt("member_id"));
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
	            dto.setMember_situation(rs.getString("member_situation"));
	            dto.setMember_outdate(rs.getTimestamp("member_outdate"));
	            dto.setMember_agree(rs.getString("member_agree"));

	            // 회원 하나의 정보를 배열의 한 칸에 저장
	            memberList.add(dto);

	        } // while

	        System.out.println(" DAO: 게시판 글 목록 조회 성공!");
	        System.out.println(" DAO: " + memberList.size());

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        CloseDB();
	    }

	    return memberList;
	}
									
	
	
	
}
