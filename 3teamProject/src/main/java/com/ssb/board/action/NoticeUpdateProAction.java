package com.ssb.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.board.db.BoardDAO;
import com.ssb.board.db.BoardDTO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;
import com.ssb.util.JSMoveFunction;

public class NoticeUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		System.out.println("\nM: NoticeUpdateProAction_execute() 호출");
		
		// 한글 처리 => web.xml에 필터 처리 (생략)
		
		// 전달정보(pageNum, boardId, subject, content) 저장
		// => BoardDTO 객체 저장
		String pageNum = request.getParameter("pageNum");
				
		BoardDTO bdto = new BoardDTO();
		bdto.setBoard_id(Integer.parseInt(request.getParameter("boardId")));
		bdto.setBoard_subject(request.getParameter("subject"));
		bdto.setBoard_content(request.getParameter("content"));
				
		// 전달받은 정보를 사용해서 기존 정보 수정
		BoardDAO bdao = new BoardDAO();
		int result = bdao.updateNotice(bdto);
				
		if(result == 1) {
			// JS사용 페이지 이동
			JSMoveFunction.alertLocation(response, "수정 완료!", "./NoticeList.bo?pageNum="+pageNum);
			return null;
		}
				
		if(result == -1) {
			// JS사용 페이지 이동
			JSMoveFunction.alertBack(response, "게시판 글 없음!");
			return null;
		}
		
		return null;
	}

}