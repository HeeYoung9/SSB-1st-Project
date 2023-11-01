package com.ssb.member.action;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.member.db.MemberDAO;
import com.ssb.member.db.MemberDTO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class MemberJoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : MemberJoinAction_execute() 실행");
		
		// 전달정보 저장(파라메터) 저장 + 회원가입일
		MemberDTO dto = new MemberDTO();
//		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//		
		dto.setMember_user_id(request.getParameter("member_user_id"));
		dto.setMember_pw(request.getParameter("member_pw"));
		dto.setMember_name(request.getParameter("member_name"));
//		dto.setMember_birth(); // Date 타입 고민해보기
		dto.setMember_gender(request.getParameter("member_gender"));
		dto.setMember_email(request.getParameter("member_email"));
		dto.setMember_phone(request.getParameter("member_phone"));
		dto.setMember_regdate(new Timestamp(System.currentTimeMillis()));
		dto.setMember_situation(request.getParameter("member_situation"));
		dto.setMember_agree(request.getParameter("member_agree"));
		
		System.out.println("M : " +dto);
		
		// MemberDAO 객체 생성
		MemberDAO dao = new MemberDAO();
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./MemberLogin.me");
		forward.setRedirect(true);
		
		System.out.println("M : "+forward);
		
		return forward;
	}

}
