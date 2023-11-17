package com.ssb.board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.board.db.BoardDAO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class ReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		System.out.println("\nM: ReviewListAction_execute() 호출");
		
		// 기존에 저장된 글정보를 가져와서 화면에 출력
		BoardDAO bdao = new BoardDAO();
		
		int reviewCount = 0;
		reviewCount = bdao.getReviewCount();
		System.out.println("M: 리뷰글 개수: " + reviewCount);
		
		/******************************페이징처리 1******************************/
		// 한 페이지에 출력할 글의 개수 설정
		int reviewPageSize = 5;
		
		// 현 페이지가 몇 페이지인지 확인
		String reviewPageNum = request.getParameter("pageNum");
		
		if(reviewPageNum == null) {
			reviewPageNum = "1";
		} 
				
		// 시작행 번호 계산하기
		// 1  11  21  31 ...
		int reviewCurrentPage = Integer.parseInt(reviewPageNum);
		int reviewStartRow = ((reviewCurrentPage - 1) * reviewPageSize) + 1;
		
		// 끝행 번호 계산하기
		// 10 20 30 ...
		int reviewEndRow = reviewCurrentPage * reviewPageSize;		
		/******************************페이징처리 1******************************/
				
		// 디비에 저장된 글의 수를 체크해서 있을 때만 글정보 모두를 조회
		// DAO - 글정보 모두(List)를 가져오는 메서드 호출
		ArrayList reviewList = new ArrayList();
		
		if(reviewCount > 0) {
			reviewList = bdao.getReviewList(reviewStartRow, reviewPageSize);
		}
		
		System.out.println("M: size: " + reviewList.size());
				
		// 리스트를 출력 => 연결된 뷰페이지에서 출력하도록 정보 전달
		request.setAttribute("reviewList", reviewList);
			
		/******************************페이징처리 2******************************/
		// 페이지 블럭 생성 (1, 2, 3, ..., 10)
					
		// 전체 페이지수
		// 글 15 / 페이지당 10개 => 2 페이지 
		int reviewPageCount = reviewCount / reviewPageSize + (reviewCount % reviewPageSize == 0? 0:1);
					
		// 한 화면에 보여줄 페이지 블럭 개수
		int reviewPageBlock = 5;
					
		// 페이지 블럭의 시작 번호 계산
		// 1페이지 => 1,      5페이지 => 1
		// 11페이지 => 11
		// 25페이지 => 21
		int reviewStartPage = ((reviewCurrentPage - 1)/reviewPageBlock) * reviewPageBlock + 1;
					
		// 페이지 블럭의 마지막 번호 계산
		int reviewEndPage = reviewStartPage + reviewPageBlock - 1;
					
		// 페이지의 글이 없는 경우
		if(reviewEndPage > reviewPageCount) {
			reviewEndPage = reviewPageCount;
		}
		/******************************페이징처리 2******************************/

		// 페이징 처리에 필요한 정보 모두를 request 영역에 저장해서 전달
		request.setAttribute("reviewPageNum", reviewPageNum);
		request.setAttribute("reviewCount", reviewCount);
		request.setAttribute("reviewPageCount", reviewPageCount);
		request.setAttribute("reviewPageBlock", reviewPageBlock);
		request.setAttribute("reviewStartPage", reviewStartPage);
		request.setAttribute("reviewEndPage", reviewEndPage);
				
		// 페이지 이동 준비
		ActionForward forward = new ActionForward();
		forward.setPath("./board/review/reviewList.jsp");
		forward.setRedirect(false);
				
		return forward;
	}

}