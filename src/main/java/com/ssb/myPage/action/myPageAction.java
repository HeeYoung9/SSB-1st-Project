package com.ssb.myPage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.myPage.db.myPageDTO;
import com.ssb.myPage.db.myPageDAO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class myPageAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("M : myPageAction_execute() 호출");

        String userId = (String) request.getSession().getAttribute("userId");

        // updateDAO 객체 생성
        myPageDAO dao = new myPageDAO();

        // dao를 이용하여 현재 로그인된 사용자 정보를 가져옵니다.
        myPageDTO mdto = dao.getMember(userId);

        // 가져온 정보를 request에 설정합니다.
        request.setAttribute("currentMember", mdto);

        // 페이지 이동(./myPage/myPage.jsp)
        ActionForward forward = new ActionForward();
        forward.setPath("./myPage/myPage.jsp");
        forward.setRedirect(false);

        return forward;
    }
}
