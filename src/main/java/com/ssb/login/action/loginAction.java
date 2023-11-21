package com.ssb.login.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssb.login.db.loginDAO;
import com.ssb.member.db.MemberDAO;
import com.ssb.member.db.MemberDTO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;
import com.ssb.util.JSMoveFunction;


public class loginAction implements Action {

	// alt + shift + s + v
	@Override
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		System.out.println(" M : loginAction_execute() 실행 ");
		// 한글처리 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 전달정보 저장(id,pw)
		//String id = request.getParameter("id");
		//String pw = request.getParameter("pw");
		MemberDTO dto = new MemberDTO();
		dto.setMember_user_id(request.getParameter("member_user_id"));
		dto.setMember_pw(request.getParameter("member_pw"));
		System.out.println("비밀번호는? "+dto.getMember_pw());
		
		// DAO객체 생성 -> 로그인 체크 메서드
		loginDAO dao = new loginDAO();
		
		int result = dao.loginMember(dto);
		System.out.println(" M : result : "+result);
		
		ActionForward forward = null;
		
		
		 if(result == 2) {
			 JSMoveFunction.alertBack(response, "회원정보가 없습니다.");
		 }else if(result == 1) {
			// 페이지 이동(JSP)
			// 아이디 정보를 세션에 저장2
			HttpSession session = request.getSession();
			session.setAttribute("userId", dto.getMember_user_id());
			
			MemberDAO mdao = new MemberDAO();
			
			MemberDTO mdto =  mdao.getMember(dto.getMember_user_id());
			session.setAttribute("member_id", String.valueOf(mdto.getMember_id()));
			System.out.println("저장된 멤버 아이디값! : "+mdto.getMember_id());
			
			//response.sendRedirect(null);
			forward = new ActionForward();
			forward.setPath("./Main.in");
			forward.setRedirect(true);
			
			return forward;			
		}else if(result == 0) {
			// 페이지 이동(JS)
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(" <script> ");
			out.println("  alert(' 사용자 비밀번호 오류! '); ");
			out.println("  history.back(); ");
			out.println(" </script> ");
			out.close();
			
			return null; // ActionForward정보가 null=>컨트롤러 페이지이동X
		}else{ //result == -1
			// 페이지 이동(JS)
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(" <script> ");
			out.println("  alert('회원정보 없음!!'); ");
			out.println("  history.back(); ");
			out.println(" </script> ");
			out.close();
		}
		
		return forward;
	}//execute

}
