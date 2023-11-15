package com.ssb.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class MemberCloseAccountProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberResignAction_execute() 호출");
		
		//- 회원탈퇴 확인시 MemberCloseAccountAction.me 에서 상태(탈퇴), 탈퇴일시 update 한 후
		//- 세션 해재 및 메인페이지
		
		
		return null;
	}

}
