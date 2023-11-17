package com.ssb.login.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssb.util.Action;
import com.ssb.util.ActionForward;

@WebServlet("*.lg")
public class loginController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C : loginController_doProcess() 호출");
		
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
		
		if(command.equals("/login.lg")) {
			System.out.println("C : /login.lg 매핑");
			System.out.println("C : 패턴1 - DB처리X, 뷰페이지 이동");
			
			forward = new ActionForward();
			forward.setPath("./login/login.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/loginAction.lg")) {
			System.out.println("C : /loginAction.lg 매핑");
			System.out.println("C : 패턴2 - DB처리X, 뷰페이지 이동");
			
			action = new loginAction();
		
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}else if(command.equals("/MemberJoinIdCheck.me")) {
		    System.out.println("C : /MemberJoinIdCheck.me 매핑");
		    System.out.println("C : 패턴 - DB사용o, 가만히 ");
		    
		    
		    try {
				action.execute(request, response);
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
		
		/*
		 * String member_user_id = request.getParameter("member_user_id"); String
		 * member_pw = request.getParameter("member_pw");
		 * 
		 * com.ssb.login.db.loginDAO dao = new com.ssb.login.db.loginDAO(); boolean
		 * loginResult = dao.login(member_user_id, member_pw);
		 * 
		 * if (loginResult) { response.sendRedirect("./Main.in"); // 로그인 성공 시 Main.in
		 * 페이지로 이동 } else { response.sendRedirect("./login.lg"); // 로그인 실패 시 login.lg
		 * 페이지로 이동1 }
		 */
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