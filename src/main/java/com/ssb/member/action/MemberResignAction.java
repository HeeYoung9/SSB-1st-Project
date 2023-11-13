package com.ssb.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssb.member.db.MemberDAO;
import com.ssb.member.db.MemberDTO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;
import com.ssb.util.JSMoveFunction;	

public class MemberResignAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberDeletAciton_execute() 호출");
		
		// 로그인 세션제어
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("member_user_id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// 전달정보 저장
		MemberDTO dto = new MemberDTO();
		dto.setMember_user_id(request.getParameter("member_user_id"));
		dto.setMember_pw(request.getParameter("member_pw"));
		
		// MemberDAO 객체 생성 - 회원정보 삭제 메서드 호출
		MemberDAO dao = new MemberDAO();
		int result = dao.deleteMember(dto);
		
		// 삭제 결과에 따른 페이지 이동
		if(result == 1) { // 삭제 완료
			session.invalidate();
			JSMoveFunction.alertLocation(response, "회원탈퇴 완료", "./Main.in");
			return null;
		}else if(result == 0) { // 삭제 실패
			JSMoveFunction.alertBack(response, "비밀번호 오류");
			return null;
		}else { // result -1 => 아이디없음
			JSMoveFunction.alertLocation(response, "아이디 없음", "./Main.in");
		}
		
		return null;
	}

}
