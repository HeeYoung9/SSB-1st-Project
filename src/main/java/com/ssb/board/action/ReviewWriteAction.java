package com.ssb.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.ssb.board.db.BoardDAO;
import com.ssb.board.db.BoardDTO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class ReviewWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		System.out.println("\nM: ReviewWriteAction_execute() 호출");
		
		// upload 가상의 폴더 생성 (workspace에 만듦)
		// 실제로는 톰캣 서버에 업로드됨
		String realPath = request.getRealPath("/upload");
		System.out.println("M: realPath: " + realPath);
				
		// 첨부파일의 크기 설정 (5MB)
		int maxSize = 5*1024*1024;
				
		// 첨부파일 업로드 => 객체 생성
		MultipartRequest multi = new MultipartRequest(
													request,
													realPath,
													maxSize,
													"UTF-8",
													new ReviewFileNamePolicy()
													);
				
		System.out.println("M: 파일 업로드 성공!");
				
		// 파일 수정 시 아래 코드 추가
		// 업데이트 후 기존의 파일 삭제
//		File file = new File(realPath + "/" + multi.getFilesystemName("file"));
//		file.delete();
		
		String orders_sort = multi.getParameter("orders_sort");
	
		// 나머지 정보 저장
		BoardDTO bdto = new BoardDTO();
		BoardDAO bdao = new BoardDAO();
			
		bdto.setMember_user_id(multi.getParameter("userId"));
		bdto.setBoard_content(multi.getParameter("content"));
		bdto.setBoard_file(multi.getFilesystemName("file"));
		bdto.setRating(Double.parseDouble(multi.getParameter("rating")));

		
		// BoardDAO 객체 -> 첨부파일 저장
		if(orders_sort.equals("SALE")) {
			bdto.setItem_id(Integer.parseInt(multi.getParameter("itemId")));
			bdao.insertReviewItem(bdto);
		} else if(orders_sort.equals("RENTAL")) {
			bdto.setRental_item_id(Integer.parseInt(multi.getParameter("itemId")));
			bdao.insertReviewRItem(bdto);
		}
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./Main.in");
		forward.setRedirect(true);
				
		return forward;
	}

}