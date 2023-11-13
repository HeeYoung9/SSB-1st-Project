package com.ssb.update.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssb.member.db.MemberDTO;
import com.ssb.update.db.updateDAO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;
import com.ssb.util.JSMoveFunction;

public class updateAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("updateAction_execute() 호출");

        // 로그인 세션 제어
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("userId");

        ActionForward forward = new ActionForward();
        if (id == null) {
            forward.setPath("./MemberLogin.mg");
            forward.setRedirect(true);
            return forward;
        }

        // 한글 처리
        request.setCharacterEncoding("UTF-8");

        // 페이지 이동(./update/update.jsp)
        forward.setPath("./update/update.jsp");
        forward.setRedirect(false);

        // 전달된 수정정보 저장(DTO)
        MemberDTO dto = new MemberDTO();
        dto.setMember_name(request.getParameter("member_name"));
        dto.setMember_pw(request.getParameter("member_pw"));
        dto.setMember_phone(request.getParameter("member_phone"));
        dto.setMember_email(request.getParameter("member_email"));

        // updateDAO 객체 - 정보 수정 메서드 호출
        updateDAO dao = new updateDAO();

        // 세션에서 아이디 가져와서 정보 수정 메서드 호출
        int result = dao.updateMember(id, dto);

        // 결과에 따른 페이지 이동(JS)
        if (result == 1) {
            JSMoveFunction.alertLocation(response, "회원정보 수정완료!", "./Main.in");
        } else if (result == 0) {
            JSMoveFunction.alertBack(response, "수정실패X- 비밀번호 오류");
        } else {
            JSMoveFunction.alertBack(response, "회원정보가 없음!!!");
        }

        return forward;
    }
}
