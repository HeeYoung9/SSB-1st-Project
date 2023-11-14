package com.ssb.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.login.action.logoutAction;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

@WebServlet("*.me")
public class MemberFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C : MemberFrontController_doProcess() 호출");
		
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
		
		if(command.equals("/MemberJoin.me")) {
			System.out.println("C : /MemberJoin.me 매핑");
			System.out.println("C : 패턴1 - DB처리X, 뷰페이지 이동");
			
			forward = new ActionForward();
			forward.setPath("./join/join.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/MemberJoinAction.me")) {
			System.out.println("C : /MemberJoin.me 매핑");
			System.out.println("C : 패턴2 - DB처리X, 뷰페이지 이동");
			
			action = new MemberJoinAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberLogin.me")) {
			System.out.println("C : /MemberLogin.me 매핑");
			System.out.println("C : 패턴 1 - DB사용X, view페이지 출력 ");
			
			forward = new ActionForward();
			forward.setPath("./login/login.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/MemberJoinIdCheck.me")) { // Ajax 아이디 중복 체크 매핑
		    System.out.println("C : /MemberJoinIdCheck.me 매핑");
		    System.out.println("C : Ajax 패턴 - DB사용o, 가만히 ");
		    
		    action = new MemberJoinIdCheck();
		    try {
				action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberJoinPwCheck.me")) { // Ajax 비밀번호 체크 매핑
		    System.out.println("C : /MemberJoinPwCheck.me 매핑");
		    System.out.println("C : Ajax 패턴 - DB사용x, 가만히 ");
		    
		    action = new MemberJoinPwCheck();
		    try {
				action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberLogout.me")) {
			System.out.println("C : /MemberLogout.me 매핑");
		    System.out.println("C : 패턴3 - DB사용x, 페이지 이동 ");
		    
		    action = new logoutAction();
		    try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		    
		}
		System.out.println("-------------------------- 2. 가상주소 매핑 끝 ---------------------------------");
		
		System.out.println("\n-------------------------- 3. 가상주소 이동 시작 -------------------------------");
		if(forward != null) { // 이동정보가 존재할때
			if(forward.isRedirect()) { // true
				System.out.println("C : "+forward.getPath()+"로, 이동방식 : sendRedirect()");
				
				response.sendRedirect(forward.getPath());
			}else { // false
				System.out.println("C : "+forward.getPath()+"로, 이동방식 : forward()");
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
		System.out.println("-------------------------- 3. 가상주소 이동 끝 ---------------------------------");

	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C : MemberFrontController_doGet() 호출");
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C : MemberFrontController_doPost() 호출");
		doProcess(request, response);
	}
	
	
}