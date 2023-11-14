package com.ssb.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssb.member.db.MemberDAO;
import com.ssb.member.db.MemberDTO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;
import com.ssb.util.JSMoveFunction;	

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberDeletAciton_execute() 호출");
		
		// 로그인 세션제어
		HttpSession session = request.getSession();
		String admin_id = (String) session.getAttribute("adminId");
		
		ActionForward forward = new ActionForward();
		if(admin_id == null) {
			forward.setPath("./AdminMain.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// 선택한 회원들의 아이디를 전달받아 저장
		// => checkId라는 파라미터를 갖고 있는 값들이 많으므로
		// => getParameterValues()를 사용해서 값을 전달받아 저장
		String[] deleteMember = request.getParameterValues("chk");
		
		// 선택한 회원의 아이디를 이용하여 member 테이블에서 회원정보를 삭제
		// MemberDAO 객체 생성 - 회원정보 삭제 메서드 호출
		MemberDAO dao = new MemberDAO();
		for(String member_id : deleteMember) {
			dao.deleteMember(Integer.parseInt(member_id));
		}
//		int result = dao.deleteMember(dto);
		
		// 삭제 결과에 따른 페이지 이동
//		if(result == 1) { // 삭제 완료
////			session.invalidate();
//			JSMoveFunction.alertLocation(response, "회원삭제 완료", "./AdMemberList.me");
//			return null;
//		}else if(result == 0) { // 삭제 실패
//			JSMoveFunction.alertBack(response, "비밀번호 오류");
//			return null;
//		}else { // result -1 => 아이디없음
//			JSMoveFunction.alertLocation(response, "아이디 없음", "./AdminMain.ad");
//		}
		
		return null;
	}

}
