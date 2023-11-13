package com.ssb.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.board.db.BoardDAO;
import com.ssb.board.db.BoardDTO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class InquiryAWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		System.out.println("\nM: InquiryAWriteAction_execute() 호출");
		
		// 전달정보 저장 (boardId, pageNum)
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		String pageNum = request.getParameter("pageNum");
								
		//      "        - 특정 글의 정보를 가져오는 메서드
		BoardDAO bdao = new BoardDAO();
		BoardDTO bdto = bdao.getBoard(boardId);
						
		// 글정보를 request 영역에 저장
		request.setAttribute("bdto", bdto);
				
		// pageNum값도 request 영역에 저장=
		request.setAttribute("pageNum", pageNum);
				
		// 페이지 출력 (./board/inquiry/inquiryAWriteForm.jsp)
		ActionForward forward = new ActionForward();
		forward.setPath("./board/inquiry/inquiryAWriteForm.jsp");
		forward.setRedirect(false);
				
		return forward;
	}

}