package com.ssb.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.member.db.MemberDAO;
import com.ssb.member.db.MemberDTO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;


public class MemberJoinIdCheck implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : MemberJoinIdCheck.execute() 호출");
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		// 정보 저장
		String member_user_id = request.getParameter("userId");
	
		MemberDAO dao = new MemberDAO();
		int idCheck = dao.checkId(member_user_id);
		
		// 성공여부 확인
		if(idCheck == -1) {
			System.out.println("이미 존재하는 아이디입니다.");
		} else if (idCheck == 1) {
			System.out.println("사용 가능한 아이디입니다.");
		}
		
		out.write(idCheck + ""); // -> ajax 결과값인 result가 됨
		// -> String으로 값을 내보낼 수 있도록 해준다
		
		return null;
	}

}
