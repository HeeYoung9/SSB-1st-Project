package com.ssb.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class MemberCloseAccountAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberResignAction_execute() 호출");
		
		// 마이페이지에서 회원탈퇴 버튼을 누를때 updateAciton 페이지
		// updateAciton에서 member_id를 세션영역에 저장 후 MemberCloseAccount.me 이동(사유선택하고)
		
		
		return null;
	}

}
