package com.ssb.rental.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.board.db.BoardDAO;
import com.ssb.rental.db.RentalDAO;
import com.ssb.rental.db.RentalDTO;
import com.ssb.reply.db.ReplyDAO;
import com.ssb.reply.db.ReplyDTO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;


public class RentalItemAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RentalItemAction_execute() 호출");

			
		// 전달정보 저장
		int rItemId = Integer.parseInt(request.getParameter("rental_item_id"));
		
		
		
		RentalDAO rdao = new RentalDAO();
		
		// 제품 정보 가져오는 메서드 호출
		RentalDTO rdto = rdao.getRentalItem(rItemId);
		

		// Q&A
		// 기존에 저장된 글정보를 가져와서 화면에 출력
		BoardDAO bdao = new BoardDAO();
				
		int count = 0;
		count = bdao.getInquiryCount();
		System.out.println("M: 글 개수: " + count);
				
		/******************************페이징처리 1******************************/
		// 출력할 글의 개수 설정
		int pageSize = 5;
		
		// 현 페이지가 몇 페이지인지 확인
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		} 
				
		// 시작행 번호 계산하기
		// 1  11  21  31 ...
		int currentPage = Integer.parseInt(pageNum);
		int startRow = ((currentPage - 1) * pageSize) + 1;
		
		// 끝행 번호 계산하기
		// 10 20 30 ...
		int endRow = currentPage * pageSize;		
		/******************************페이징처리 1******************************/
				
		// 디비에 저장된 글의 수를 체크해서 있을 때만 글정보 모두를 조회
		// DAO - 글정보 모두(List)를 가져오는 메서드 호출
		ArrayList inquiryList = new ArrayList();
		
		if(count > 0) {
			inquiryList = bdao.getInquiryList(rItemId, startRow, pageSize);
		}
		
		System.out.println("M: size: " + inquiryList.size());
				
		// 리스트를 출력 => 연결된 뷰페이지에서 출력하도록 정보 전달
		request.setAttribute("inquiryList", inquiryList);
			
		/******************************페이징처리 2******************************/
		// 페이지 블럭 생성 (1, 2, 3, ..., 10)
					
		// 전체 페이지수
		int pageCount = count / pageSize + (count % pageSize == 0? 0:1);
					
		// 한 화면에 보여줄 페이지 블럭 개수
		int pageBlock = 5;
					
		// 페이지 블럭의 시작 번호 계산
		int startPage = ((currentPage - 1)/pageBlock) * pageBlock + 1;
					
		// 페이지 블럭의 마지막 번호 계산
		int endPage = startPage + pageBlock - 1;
					
		// 페이지의 글이 없는 경우
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		/******************************페이징처리 2******************************/

		// 페이징 처리에 필요한 정보 모두를 request 영역에 저장해서 전달
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("count", count);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		// 답변 정보를 가져와서 화면에 출력 
				ReplyDAO rpdao = new ReplyDAO();
				ReplyDTO rpdto = rpdao.getRItemReply(rItemId);
				request.setAttribute("rpdto", rpdto);
				
		request.setAttribute("rdto", rdto);
		ActionForward forward = new ActionForward();
		forward.setPath("./rental/rental_page/rentalItem.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
