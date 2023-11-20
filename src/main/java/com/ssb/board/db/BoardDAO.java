package com.ssb.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

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
			
		System.out.println("DAO: 디비 연결 성공!");
		System.out.println("DAO: " + con);
		return con;			
	}
		
	// 공통) 디비 자원해제
	public void CloseDB() {
			
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close(); 
			if(con != null) con.close(); 
		} catch(SQLException e) {
			e.printStackTrace();
		}
			
	}
	
	
	// 공지글 작성하기 메서드 - insertNoticeBoard(BoardDTO)
	public void insertNoticeBoard(BoardDTO bdto) {
		int boardId = 0;
		
		try {
			// 1.2. 디비 연결
			con = getCon();
			
			// board_id 계산
			// 3. SQL 구문(select) & pstmt 객체
			sql = "select max(board_id) from board_remaster";
			pstmt = con.prepareStatement(sql);
						
			// 4. SQL 실행
			rs = pstmt.executeQuery();
						
			// 5. 데이터 처리
			if(rs.next()) {
				// board_id = rs.getInt("max(bno)") + 1;
				// => getInt(int columnIndex)
				boardId = rs.getInt(1) + 1; 
			} else {
				boardId = 1;
			}
							
			System.out.println("DAO: 글번호: " + boardId);
				
			// 3. SQL 구문(insert) & pstmt 객체
			sql = "insert into board_remaster(board_id, admin_user_id, board_type, board_subject, board_content, "
					+ "board_writeTime, board_readCount) values(?, ?, ?, ?, ?, now(), ?)";
			pstmt = con.prepareStatement(sql);
				
			// ?
			pstmt.setInt(1, boardId);
			pstmt.setString(2, bdto.getAdmin_user_id());
			pstmt.setString(3, "N");
			pstmt.setString(4, bdto.getBoard_subject());
			pstmt.setString(5, bdto.getBoard_content());
			pstmt.setInt(6, 0);
				
			// 4. SQL 실행
			pstmt.executeUpdate();
				
			System.out.println("DAO: 공지 작성 완료!");		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
			
	} 
	// 공지글 작성하기 메서드 - insertNoticeBoard(BoardDTO)
	
		
	// 공지글 개수 계산 메서드 - getNoticeCount()
	public int getNoticeCount() {
		int result = 0;	
				
		try {
			// 1.2. 디비 연결
			con = getCon();		
					
			// 3. SQL 구문 작성(select) & pstmt 객체
			sql = "select count(*) from board_remaster where board_type='N'";
			pstmt = con.prepareStatement(sql);			
			
			// 4. SQL 실행
			rs = pstmt.executeQuery();
					
			// 5. 데이터 처리 - 개수를 저장
			if(rs.next()) {
				result = rs.getInt(1);
				// result = rs.getInt("count(*)"); 
			}
					
			System.out.println("DAO: 글 개수: " + result + "개");
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
				
		return result;		
	}
	// 공지글 개수 계산 메서드 - getNoticeCount()

	
	// 공지글 조회수 1 증가 메서드 - updateReadCount(int boardId) 
	public void updateReadCount(int boardId) {
				
		try {	
			// 1.2. 디비 연결
			con = getCon();
					
			// 3. SQL 구문 작성(update) & pstmt 객체
			// 특정 글의 조회수를 1 증가
			sql = "update board_remaster set board_readCount=board_readCount+1 where board_id=?";
			pstmt = con.prepareStatement(sql);
					
			// ?
			pstmt.setInt(1, boardId);
					
			// 4. SQL 실행
			pstmt.executeUpdate();
					
			System.out.println("DAO: 글 조회수 1 증가 완료!");			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
				
	}	
	// 공지글 조회수 1 증가 메서드 - updateReadCount(int boardId)	
	
	
	// 공지사항 글목록을 가져오는 메서드 - getNoticeList(int startRow, int pageSize)
	public ArrayList getNoticeList(int startRow, int pageSize) {
		// 글정보를 저장하는 배열
		ArrayList noticeList = new ArrayList();
				
		try {
			// 1.2. 디비 연결
			con = getCon();
					
			// 3. SQL 구문(select) 작성 & pstmt 객체
			sql = "select board_id, admin_name, board_subject, board_content, board_writeTime, board_readCount "
					+ "from admin a join board_remaster br "
					+ "on a.admin_user_id = br.admin_user_id where board_type='N' "
					+ "order by board_id desc limit ?,?";
			pstmt = con.prepareStatement(sql);
					
			// ?
			pstmt.setInt(1, startRow-1); // 시작행 번호-1
			pstmt.setInt(2, pageSize); // 페이지 개수
					
			// 4. SQL 실행
			rs = pstmt.executeQuery();
					
			// 5. 데이터 처리
			// 글정보 전부 가져오기
			// 여러 개의 정보 => ArrayList 저장
			while(rs.next()) {
				// 글 하나의 정보 => BoardDTO 저장
				BoardDTO bdto = new BoardDTO();
						
				bdto.setBoard_id(rs.getInt("board_id"));
				bdto.setAdmin_name(rs.getString("admin_name"));
				bdto.setBoard_subject(rs.getString("board_subject"));
				bdto.setBoard_content(rs.getString("board_content"));
				bdto.setBoard_writeTime(rs.getDate("board_writeTime"));
				bdto.setBoard_readCount(rs.getInt("board_readCount"));
						
				// 글 하나의 정보를 배열의 한 칸에 저장
				noticeList.add(bdto);								
			} // while
					
			System.out.println("DAO: 공지사항 글 목록 조회 성공!");
			System.out.println("DAO: " + noticeList.size());
								
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
				
		return noticeList;
	}	
	// 공지사항 글목록을 가져오는 메서드 - getNoticeList(int startRow, int pageSize)

	
	// 특정 번호에 해당하는 글정보 가져오기 메서드 - getBoard(int boardId)
	public BoardDTO getBoard(int boardId) {
		BoardDTO bdto = null; 
			
		try {	
			// 1.2. 디비 연결
			con = getCon();
				
			// 3. SQL 구문 작성(select) & pstmt 객체
			sql = "select * from board_remaster where board_id=?";
			pstmt = con.prepareStatement(sql);
				
			// ?
			pstmt.setInt(1, boardId);		
				
			// 4. SQL 실행
			rs = pstmt.executeQuery();
			System.out.println("DAO: SQL 실행 성공!");
				
			// 5. 데이터 처리 (rs -> BoardDTO)
			if(rs.next()) { // 데이터가 존재할 때				
				bdto = new BoardDTO();
					
				bdto.setBoard_id(rs.getInt("board_id"));
				bdto.setMember_user_id(rs.getString("member_user_id"));
				bdto.setInquiry_type(rs.getString("inquiry_type"));
				bdto.setBoard_subject(rs.getString("board_subject"));							
				bdto.setBoard_content(rs.getString("board_content"));
				bdto.setBoard_writeTime(rs.getDate("board_writeTime"));
				bdto.setBoard_readCount(rs.getInt("board_readCount"));
			}
				
			System.out.println("DAO: 글정보 조회 완료!");				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
			
		return bdto;		
	}	
	// 특정 번호에 해당하는 글정보 가져오기 메서드 - getBoard(int boardId)
		
	
	// 특정 글정보 수정하는 메서드 - updateNotice(BoardDTO bdto)
	public int updateNotice(BoardDTO bdto) {
		int result = -1; // -1(글정보 없음), 1(정상처리)
			
		try {
			// 1.2. 디비 연결
			con = getCon();
				
			// 3. SQL 구문 작성(select) & pstmt 객체 
			sql = "select * from board_remaster where board_id=?";
			pstmt = con.prepareStatement(sql);
				
			// ?
			pstmt.setInt(1, bdto.getBoard_id());
				
			// 4. SQL 실행
			rs = pstmt.executeQuery();
				
			// 5. 데이터 처리
			if(rs.next()) {
					// 3. SQL 구문 작성(update) & pstmt 객체
					sql = "update board_remaster set board_subject=?, board_content=? where board_id=?";
					pstmt = con.prepareStatement(sql);
						
					// ?
					pstmt.setString(1, bdto.getBoard_subject());
					pstmt.setString(2, bdto.getBoard_content());
					pstmt.setInt(3, bdto.getBoard_id());
						
					// 4. SQL 구문 실행
					result = pstmt.executeUpdate();
					
					// result = 1
			} else { // 게시판에 글 없음
				result = -1;
			}
				
			System.out.println("DAO: 게시판 글 수정완료! (" + result + ")");
		} catch (Exception e) {
				e.printStackTrace();
		} finally {
			CloseDB();
		}
			
		return result;
	} 
	// 특정 글정보 수정하는 메서드 - updateNotice(BoardDTO bdto)
	
	
	// 특정 글정보 삭제하는 메서드 - deleteNotice(BoardDTO bdto)
	public int deleteNotice(BoardDTO bdto) {
		int result = -1; // -1(글정보 없음), 1(정상처리)
			
		try {
			// 1.2. 디비 연결
			con = getCon();
				
			// 3. SQL 구문 작성(select) & pstmt 객체 
			sql = "select * from board_remaster where board_id=?";
			pstmt = con.prepareStatement(sql);
				
			// ?
			pstmt.setInt(1, bdto.getBoard_id());
				
			// 4. SQL 실행
			rs = pstmt.executeQuery();
				
			// 5. 데이터 처리
			if(rs.next()) {
					// 3. SQL 구문 작성(update) & pstmt 객체
					sql = "delete from board_remaster where board_id=?";
					pstmt = con.prepareStatement(sql);
						
					// ?
					pstmt.setInt(1, bdto.getBoard_id());
						
					// 4. SQL 구문 실행
					result = pstmt.executeUpdate();
					
					// result = 1;					
			} else { // 게시판에 글 없음
					result = -1;
			}
			
			System.out.println("DAO: 게시판 글 삭제완료! (" + result + ")");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
			
		return result;
	}
	// 특정 글정보 삭제하는 메서드 - deleteNotice(BoardDTO bdto)	


	// 제품 문의글 작성하기 메서드 - insertInquiryItem(BoardDTO bdto)
	public void insertInquiryItem(BoardDTO bdto) {
		int boardId = 0;
				
		try {
			// 1.2. 디비 연결
			con = getCon();
		
			// board_id 계산
			// 3. SQL 구문(select) & pstmt 객체
			sql = "select max(board_id) from board_remaster";
			pstmt = con.prepareStatement(sql);
			
			// 4. SQL 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()) {
				// board_id = rs.getInt("max(bno)") + 1;
				// => getInt(int columnIndex):
				boardId = rs.getInt(1) + 1; 
			} else {
				boardId = 1;
			}
			
			System.out.println("DAO: 글번호: " + boardId);
			
			// 3. SQL 구문(insert) & pstmt 객체
			sql = "insert into board_remaster(board_id, member_user_id, item_id, "
					+ "board_type, inquiry_type, answer_state, "
					+ "board_subject, board_content, board_writeTime) "
					+ "values(?, ?, ?, ?, ?, ?, ?, ?, now())";
			pstmt = con.prepareStatement(sql);
					
			// ?		
			pstmt.setInt(1, boardId);
			pstmt.setString(2, bdto.getMember_user_id());
			pstmt.setInt(3, bdto.getItem_id());
			pstmt.setString(4, "Q");
			pstmt.setString(5, bdto.getInquiry_type());
			pstmt.setString(6, "답변예정");
			pstmt.setString(7, bdto.getBoard_subject());
			pstmt.setString(8, bdto.getBoard_content());
					
			// 4. SQL 실행
			pstmt.executeUpdate();
					
			System.out.println("DAO: 문의 작성 완료!");		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
				
	} 
	// 제품 문의글 작성하기 메서드 - insertInquiryItem(BoardDTO bdto)	
	

	// 렌탈제품 문의글 작성하기 메서드 - insertInquiryQBoard(BoardDTO bdto)
	public void insertInquiryQBoard(BoardDTO bdto) {
		int boardId = 0;
				
		try {
			// 1.2. 디비 연결
			con = getCon();
		
			// board_id 계산
			// 3. SQL 구문(select) & pstmt 객체
			sql = "select max(board_id) from board_remaster";
			pstmt = con.prepareStatement(sql);
			
			// 4. SQL 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()) {
				// board_id = rs.getInt("max(bno)") + 1;
				// => getInt(int columnIndex):
				boardId = rs.getInt(1) + 1; 
			} else {
				boardId = 1;
			}
			
			System.out.println("DAO: 글번호: " + boardId);
			
			// 3. SQL 구문(insert) & pstmt 객체
			sql = "insert into board_remaster(board_id, member_user_id, rental_item_id, "
					+ "board_type, inquiry_type, answer_state, "
					+ "board_subject, board_content, board_writeTime) "
					+ "values(?, ?, ?, ?, ?, ?, ?, ?, now())";
			pstmt = con.prepareStatement(sql);
					
			// ?		
			pstmt.setInt(1, boardId);
			pstmt.setString(2, bdto.getMember_user_id());
			pstmt.setInt(3, bdto.getRental_item_id());
			pstmt.setString(4, "Q");
			pstmt.setString(5, bdto.getInquiry_type());
			pstmt.setString(6, "답변예정");
			pstmt.setString(7, bdto.getBoard_subject());
			pstmt.setString(8, bdto.getBoard_content());
					
			// 4. SQL 실행
			pstmt.executeUpdate();
					
			System.out.println("DAO: 문의 작성 완료!");		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
				
	} 
	// 렌탈제품 문의글 작성하기 메서드 - insertInquiryQBoard(BoardDTO bdto)
	
	
	// 문의글 개수 계산 메서드 - getInquiryCount()
	public int getInquiryCount() {
		int result = 0;	
		
		try {
			// 1.2. 디비 연결
			con = getCon();		
			
			// 3. SQL 구문 작성(select) & pstmt 객체
			sql = "select count(*) from board_remaster where board_type='Q'";
			pstmt = con.prepareStatement(sql);			
			
			// 4. SQL 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리 - 개수를 저장
			if(rs.next()) {
				result = rs.getInt(1);
				// result = rs.getInt("count(*)"); 
			}
			
			System.out.println("DAO: 글 개수: " + result + "개");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return result;		
	}
	// 문의글 개수 계산 메서드 - getInquiryCount()	
	
	
	// [관리자] 문의글 목록을 가져오는 메서드 - getAdInquiryList(int startRow, int pageSize)
	public ArrayList getAdInquiryList(int startRow, int pageSize) {
		// 글정보를 저장하는 배열
		ArrayList inquiryList = new ArrayList();
					
		try {
			// 1.2. 디비 연결
			con = getCon();
						
			// 3. SQL 구문(select) 작성 & pstmt 객체
			sql = "select * from board_remaster where board_type='Q' order by board_id desc limit ?,?";
			pstmt = con.prepareStatement(sql);
						
			// ?
			pstmt.setInt(1, startRow-1); // 시작행 번호-1
			pstmt.setInt(2, pageSize); // 페이지 개수
						
			// 4. SQL 실행
			rs = pstmt.executeQuery();
						
			// 5. 데이터 처리
			// 글정보 전부 가져오기
			// 여러 개의 정보 => ArrayList 저장
			while(rs.next()) {
				// 글 하나의 정보 => BoardDTO 저장
				BoardDTO bdto = new BoardDTO();
							
				bdto.setBoard_id(rs.getInt("board_id"));
				bdto.setMember_user_id(rs.getString("member_user_id"));
				bdto.setBoard_type(rs.getString("board_type"));
				bdto.setInquiry_type(rs.getString("inquiry_type"));
				bdto.setAnswer_state(rs.getString("answer_state"));
				bdto.setBoard_subject(rs.getString("board_subject"));
				bdto.setBoard_content(rs.getString("board_content"));
				bdto.setBoard_writeTime(rs.getDate("board_writeTime"));
							
				// 글 하나의 정보를 배열의 한 칸에 저장
				inquiryList.add(bdto);				
			} // while
						
			System.out.println("DAO: 공지사항 글 목록 조회 성공!");
			System.out.println("DAO: " + inquiryList.size());
									
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
					
		return inquiryList;
	}	
	// [관리자] 문의글 목록을 가져오는 메서드 - getAdInquiryList(int startRow, int pageSize)
	
	
	// 문의글 목록을 가져오는 메서드 - getInquiryList(int startRow, int pageSize)
	public ArrayList getInquiryList(int rItemId, int startRow, int pageSize) {
		// 글정보를 저장하는 배열
		ArrayList inquiryList = new ArrayList();
					
		try {
			// 1.2. 디비 연결
			con = getCon();
						
			// 3. SQL 구문(select) 작성 & pstmt 객체
			sql = "select board_id, member_name, board_type, inquiry_type, answer_state, "
					+ "board_subject, board_content, board_writeTime "
					+ "from member m join board_remaster br "
					+ "on m.member_user_id  = br.member_user_id "
					+ "where board_type='Q' and rental_item_id=? "
					+ "order by board_id desc limit ?,?";
			pstmt = con.prepareStatement(sql);
						
			// ?
			pstmt.setInt(1, rItemId);
			pstmt.setInt(2, startRow-1); // 시작행 번호-1
			pstmt.setInt(3, pageSize); // 페이지 개수
						
			// 4. SQL 실행
			rs = pstmt.executeQuery();
						
			// 5. 데이터 처리
			// 글정보 전부 가져오기
			// 여러 개의 정보 => ArrayList 저장
			while(rs.next()) {
				// 글 하나의 정보 => BoardDTO 저장
				BoardDTO bdto = new BoardDTO();
							
				bdto.setBoard_id(rs.getInt("board_id"));
				bdto.setMember_name(rs.getString("member_name"));
				bdto.setBoard_type(rs.getString("board_type"));
				bdto.setInquiry_type(rs.getString("inquiry_type"));
				bdto.setAnswer_state(rs.getString("answer_state"));
				bdto.setBoard_subject(rs.getString("board_subject"));
				bdto.setBoard_content(rs.getString("board_content"));
				bdto.setBoard_writeTime(rs.getDate("board_writeTime"));
							
				// 글 하나의 정보를 배열의 한 칸에 저장
				inquiryList.add(bdto);				
			} // while
						
			System.out.println("DAO: 공지사항 글 목록 조회 성공!");
			System.out.println("DAO: " + inquiryList.size());
									
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
					
		return inquiryList;
	}	
	// 문의글 목록을 가져오는 메서드 - getInquiryList(int startRow, int pageSize)
	

	// 리뷰 작성하기 메서드 - insertReviewBoard(BoardDTO bdto)
	public void insertReviewBoard(BoardDTO bdto) {
		int boardId = 0;
		
		try {
			// 1.2. 디비 연결
			con = getCon();
			
			// 3. SQL 구문(select) & pstmt 객체
			sql = "select max(board_id) from board_remaster";
			pstmt = con.prepareStatement(sql);
			
			// 4. SQL 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()) {
				// boardId = rs.getInt("max(bno)") + 1;
				// => getInt(int columnIndex):
				boardId = rs.getInt(1) + 1; 
			} else {
				boardId = 1;
			}
				
			System.out.println("DAO: 글번호: " + boardId);
			// 3. SQL 구문(insert) & pstmt 객체
			sql = "insert into board_remaster(board_id, member_user_id, board_type, "
					+ "board_content, board_writeTime, board_readCount, board_file, rating) "
					+ "values(?, ?, ?, ?, now(), ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			// ?		
			pstmt.setInt(1, boardId);
			pstmt.setString(2, bdto.getMember_user_id());
			pstmt.setString(3, "R");
			pstmt.setString(4, bdto.getBoard_content());
			pstmt.setInt(5, 0);
			pstmt.setString(6, bdto.getBoard_file());
			pstmt.setDouble(7, bdto.getRating()/2);
			
			// 4. SQL 실행
			pstmt.executeUpdate();
			
			System.out.println("DAO: " + boardId + "번 글쓰기 완료!");		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
	} 
	// 리뷰 작성하기 메서드 - insertReviewBoard(BoardDTO bdto)

	
	// 리뷰글 개수 계산 메서드 - getReviewCount()
	public int getReviewCount() {
		int result = 0;	
				
		try {
			// 1.2. 디비 연결
			con = getCon();		
					
			// 3. SQL 구문 작성(select) & pstmt 객체
			sql = "select count(*) from board_remaster where board_type='R'";
			pstmt = con.prepareStatement(sql);			
			
			// 4. SQL 실행
			rs = pstmt.executeQuery();
					
			// 5. 데이터 처리 - 개수를 저장
			if(rs.next()) {
				result = rs.getInt(1);
				// result = rs.getInt("count(*)"); 
			}
					
			System.out.println("DAO: 글 개수: " + result + "개");
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
				
		return result;		
	}
	// 리뷰글 개수 계산 메서드 - getReviewCount()

	
	// 리뷰글 조회수 1 증가 메서드 - updateReviewReadCount(int boardId) 
	public void updateReviewReadCount(int boardId) {
				
		try {	
			// 1.2. 디비 연결
			con = getCon();
					
			// 3. SQL 구문 작성(update) & pstmt 객체
			// 특정 글의 조회수를 1 증가
			sql = "update board_remaster set board_readCount=board_readCount+1 where board_id=?";
			pstmt = con.prepareStatement(sql);
					
			// ?
			pstmt.setInt(1, boardId);
					
			// 4. SQL 실행
			pstmt.executeUpdate();
					
			System.out.println("DAO: 글 조회수 1 증가 완료!");			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
				
	}	
	// 리뷰글 조회수 1 증가 메서드 - updateReviewReadCount(int boardId) 	
	
	
	// 리뷰글 목록을 가져오는 메서드 - getReviewList(int reviewStartRow, int reviewPageSize)
	public ArrayList getReviewList(int reviewStartRow, int reviewPageSize) {
		// 글정보를 저장하는 배열
		ArrayList reviewList = new ArrayList();
					
		try {
			// 1.2. 디비 연결
			con = getCon();
						
			// 3. SQL 구문(select) 작성 & pstmt 객체
			sql = "select board_id, member_name, board_type, board_content, board_writeTime, "
					+ "board_readCount, board_file, rating "
					+ "from member m join board_remaster br "
					+ "on m.member_user_id  = br.member_user_id "
					+ "where board_type='R' "
					+ "order by board_id desc limit ?,?";
			pstmt = con.prepareStatement(sql);
						
			// ?
			pstmt.setInt(1, reviewStartRow-1); // 시작행 번호-1
			pstmt.setInt(2, reviewPageSize); // 페이지 개수
						
			// 4. SQL 실행
			rs = pstmt.executeQuery();
						
			// 5. 데이터 처리
			// 글정보 전부 가져오기
			// 여러 개의 정보 => ArrayList 저장
			while(rs.next()) {
				// 글 하나의 정보 => BoardDTO 저장
				BoardDTO bdto = new BoardDTO();
							
				bdto.setBoard_id(rs.getInt("board_id"));
				bdto.setMember_name(rs.getString("member_name"));
				bdto.setBoard_type(rs.getString("board_type"));
				bdto.setBoard_content(rs.getString("board_content"));
				bdto.setBoard_writeTime(rs.getDate("board_writeTime"));
				bdto.setBoard_readCount(rs.getInt("board_readCount"));
				bdto.setBoard_file(rs.getString("board_file"));
				bdto.setRating(rs.getDouble("rating"));
			
							
				// 글 하나의 정보를 배열의 한 칸에 저장
				reviewList.add(bdto);				
			} // while
						
			System.out.println("DAO: 리뷰 글 목록 조회 성공!");
			System.out.println("DAO: " + reviewList.size());
									
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
					
		return reviewList;
	}	
	// 리뷰글 목록을 가져오는 메서드 - getReviewList(int startRow, int pageSize)
				
	
	// 답변상태 변경하기 메서드 - updateAnswerState(BoardDTO bdto)
	public BoardDTO updateAnswerState(BoardDTO bdto) {
		
		try {
			// 1.2. 디비 연결
			con = getCon();
		
			// 3. SQL 구문 작성(select) & pstmt 객체 생성
			sql = "select * from board_remaster where board_id=?";
			pstmt = con.prepareStatement(sql);
		
			// ?
			pstmt.setInt(1, bdto.getBoard_id()); 
			
			// 4. SQL 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()) {
				// 3. SQL 구문 작성(update) & pstmt 객체
				sql = "update board_remaster set answer_state=? where board_id=?";
				pstmt = con.prepareStatement(sql);
				
				// ?
				pstmt.setString(1, "답변완료");
				pstmt.setInt(2, bdto.getBoard_id());
				
				// 4. SQL 구문 실행
				pstmt.executeUpdate();
			}
			
			System.out.println("DAO: 답변상태 변경하기 성공!");
		} catch (Exception e) { 
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return bdto;
	}
	// 답변상태 변경하기 메서드 - updateAnswerState(BoardDTO bdto)
	
}