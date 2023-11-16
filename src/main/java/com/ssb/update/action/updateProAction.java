package com.ssb.update.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssb.member.db.MemberDTO;
import com.ssb.update.db.updateDAO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;
import com.ssb.util.JSMoveFunction;

public class updateProAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("M : UpdateProAction_execute() 호출");

        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
  
        
        // 전달받은 정보 저장
        MemberDTO mdto = new MemberDTO();
        mdto.setMember_user_id(userId);
        mdto.setMember_name(request.getParameter("name"));
        mdto.setMember_phone(request.getParameter("phone"));
        mdto.setMember_email(request.getParameter("email"));
        mdto.setMember_pw(request.getParameter("current_pw"));
        mdto.setNew_member_pw(request.getParameter("pw")); 
        // 비밀번호 변경하는 거 만들거면 쿼리 다시 짜야함. 수정비번은 두번 확인받고, 해야함.

        // updateDAO 객체 생성
        updateDAO dao = new updateDAO();

        // dao를 이용하여 현재 로그인된 사용자 정보를 가져옵니다.
  //      mdto = dao.getMember(userId); 위에 입력받은 정보를 저장했는데, 다시 회원정보 조회해서 기존 정보를 저장함
        // => 그러니까 계속해서 수정이 안됐음.

		 

        // 회원 정보 수정 메서드 호출
        int result = dao.updateMember(userId, mdto);

        // 결과에 따른 페이지 이동(JS)
        if (result == 1) {
            // 수정완료 -> 메인페이지로 이동
            JSMoveFunction.alertLocation(response, "회원정보 수정완료!", "./Main.in");
        } else if (result == 0) {
            // 수정실패 -> 비밀번호 오류 -> 뒤로가기 이동
            JSMoveFunction.alertBack(response, "수정실패X- 비밀번호 오류");
        } else {
            // result == -1
            JSMoveFunction.alertBack(response, "회원정보가 없음!!!");
        }

        return null;
    }
}
