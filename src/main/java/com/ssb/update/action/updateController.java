package com.ssb.update.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssb.member.db.MemberDAO;
import com.ssb.member.db.MemberDTO;
import com.ssb.update.db.updateDAO;
import com.ssb.update.db.updateDTO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

@WebServlet("*.ud")
public class updateController extends HttpServlet {

    protected void doProcess(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("C : updateController_doProcess() 호출");

        System.out.println("\n-------------------------- 1. 가상주소 계산 시작 -------------------------------");
        // URI = URL - (프로토콜 - IP -포트번호)
        String requestURI = request.getRequestURI();
        System.out.println("C : requestURI : " + requestURI);
        String CTXPath = request.getContextPath();
        System.out.println("C : CTXPath : " + CTXPath);
        String command = requestURI.substring(CTXPath.length());
        System.out.println("C : command : " + command);
        System.out.println("-------------------------- 1. 가상주소 계산 끝 ---------------------------------");

        System.out.println("\n-------------------------- 2. 가상주소 매핑 시작 -------------------------------");
        Action action = null;
        ActionForward forward = null;

        // 로그인된 사용자 정보를 request에 추가
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        System.out.println("C : 로그인된 사용자 ID : " + userId);

        if (userId != null) {
            // 사용자 정보를 DB에서 가져오기
            updateDAO memberDAO = new updateDAO();
            MemberDTO currentMember = memberDAO.getMember(userId);

            // 현재 로그인된 사용자의 정보를 request에 저장
            request.setAttribute("currentMember", currentMember);
        }

        if (command.equals("/update.ud")) {
            System.out.println("C : /update.ud 매핑");
            System.out.println("C : 패턴3 - DB처리O, 페이지 출력");

            forward = new ActionForward();
            forward.setPath("./update/update.jsp");
            forward.setRedirect(false);

        } else if (command.equals("/updateAction.ud")) {
            System.out.println("C : /updateAction.ud 매핑");
            System.out.println("C : 패턴2 - DB처리O, 뷰페이지 이동");
            action = new updateAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/updateProAction.ud")) {
            System.out.println("C : /updateProAction.ud 매핑");
            System.out.println("C : 패턴2 - DB처리O, 뷰페이지 이동");
            action = new updateProAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        System.out.println("-------------------------- 2. 가상주소 매핑 끝 ---------------------------------");

        System.out.println("\n-------------------------- 3. 가상주소 이동 시작 -------------------------------");
        if (forward != null) { // 이동정보가 존재할때
            if (forward.isRedirect()) { // true
                System.out.println("C : " + forward.getPath() + "로, 이동방식 : sendRedirect()");

                response.sendRedirect(forward.getPath());
            } else { // false
                System.out.println("C : " + forward.getPath() + "로, 이동방식 : forward()");
                RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
                dis.forward(request, response);
            }
        }
        System.out.println("-------------------------- 3. 가상주소 이동 끝 ---------------------------------");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("C : updateController_doGet() 호출");
        doProcess(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("C : updateController_doPost() 호출");
        doProcess(request, response);
    }
}
