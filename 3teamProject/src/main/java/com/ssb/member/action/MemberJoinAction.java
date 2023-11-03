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
		
		// 전달정보 저장 전 가공		
		String member_email = request.getParameter("member_email");
		String member_email2 = request.getParameter("member_email2");
		String domain = request.getParameter("domain");
		String completeEmail = member_email +"@"+(domain.equals("type")? member_email2:domain);
		
//		String member_birth = request.getParameter("member_birth");
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
//		Date birth = (Date) sdf.parse(member_birth);
		
		String member_birth = request.getParameter("member_birth");
		java.sql.Date sqlBirth = java.sql.Date.valueOf(member_birth);
		
		// 전달정보 저장(파라메터) 저장 + 회원가입일
		MemberDTO dto = new MemberDTO();
//		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		dto.setMember_user_id(request.getParameter("member_user_id"));
		dto.setMember_pw(request.getParameter("member_pw"));
		dto.setMember_name(request.getParameter("member_name"));
		dto.setMember_birth(sqlBirth);
		dto.setMember_gender(request.getParameter("member_gender"));
		dto.setMember_email(completeEmail);
		dto.setMember_phone(request.getParameter("member_phone"));
		dto.setMember_agree(request.getParameter("member_agree"));
		dto.setMember_situation(request.getParameter("member_situation"));
		dto.setMember_regdate(new Timestamp(System.currentTimeMillis()));
		
		System.out.println("M : " +dto);
		
		// MemberDAO 객체 생성
		MemberDAO dao = new MemberDAO();
		
		// 회원가입 메서드를 호출
		dao.insertMember(dto);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./MemberLogin.me");
		forward.setRedirect(true);
		
		System.out.println("M : "+forward);
		
		return forward;
	}

}
