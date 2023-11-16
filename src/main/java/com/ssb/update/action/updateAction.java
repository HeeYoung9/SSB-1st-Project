package com.ssb.update.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssb.member.db.MemberDTO;
import com.ssb.update.db.updateDAO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class updateAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("M : UpdateAction_execute() 호출");
        
        String userId = request.getParameter("user_id");
       
        System.out.println("저장된 userId는 ? "+userId);

        // updateDAO 객체 생성
        updateDAO dao = new updateDAO();

        // dao를 이용하여 현재 로그인된 사용자 정보를 가져옵니다.
          MemberDTO mdto = dao.getMember(userId);

        // 가져온 정보를 request에 설정합니다.
        request.setAttribute("currentMember", mdto);

        // 아래 부분은 필요한 속성에 따라 수정해야 합니다. 이건 왜하는거죠???????????????
		
		 if (mdto != null) { mdto.setMember_name(request.getParameter("name"));
		 mdto.setMember_pw(request.getParameter("current_pw"));
		 mdto.setMember_phone(request.getParameter("phone"));
		 mdto.setMember_email(request.getParameter("email")); }
		 mdto.setNew_member_pw(request.getParameter("pw"));

        // 페이지 이동(./update/updateForm.jsp)
        ActionForward forward = new ActionForward();
        forward.setPath("./update/update.jsp");
        forward.setRedirect(false);

        return forward;
    }
}
