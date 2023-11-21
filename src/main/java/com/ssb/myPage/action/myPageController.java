package com.ssb.myPage.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssb.myPage.db.myPageDAO;
import com.ssb.myPage.db.myPageDTO;
import com.ssb.order.action.OrderRefundAction;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

@WebServlet("*.mp")
public class myPageController extends HttpServlet {

    protected void doProcess(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("C : myPageController_doProcess() 호출");

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
            myPageDAO myPageDAO = new myPageDAO();
            myPageDTO currentMember = myPageDAO.getMember(userId);

            // 현재 로그인된 사용자의 정보를 request에 저장
            request.setAttribute("currentMember", currentMember);
        }

        if (command.equals("/myPage.mp")) {
            System.out.println("C : /myPage.mp 매핑");
            System.out.println("C : 패턴3 - DB처리O, 페이지 출력");

            // DB 처리를 Action 클래스에서 수행하도록 변경
            action = new myPageAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else if (command.equals("/myPageAction.mp")) {
            System.out.println("C : /myPageAction.mp 매핑");
            System.out.println("C : 패턴2 - DB처리O, 뷰페이지 이동");
            action = new myPageAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if (command.equals("/myPageRefundAction.mp")) {
        	System.out.println("C : myPageRefund");
        	
        	action = new OrderRefundAction();
        	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }else if(command.equals("/myPageOrderDetail.mp")) {
        	action = new MyPageDetailAction();
        	
        	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("C : updateController_doGet() 호출");
        doProcess(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("C : updateController_doPost() 호출");
        doProcess(request, response);
    }

}
