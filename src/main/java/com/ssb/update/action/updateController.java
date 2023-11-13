package com.ssb.update.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.util.Action;
import com.ssb.util.ActionForward;

@WebServlet("*.ud")
public class updateController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		if(command.equals("/update.ud")) {
			System.out.println("C : /update.ud 매핑");
			System.out.println("C : 패턴1 - DB처리X, 가만히");
			
			forward = new ActionForward();
			forward.setPath("./update/update.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/updateAction.ud")) {
			System.out.println("C : /updateAction.ud 매핑");
			System.out.println("C : 패턴2 - DB처리O, 뷰페이지 이동");
			action = new updateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}
		System.out.println("-------------------------- 2. 가상주소 매핑 끝 ---------------------------------");
		
		System.out.println("\n-------------------------- 3. 가상주소 이동 시작 -------------------------------");
		if (forward != null && forward.isRedirect()) {
		    response.sendRedirect(forward.getPath());
		} else {
		    RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
		    dis.forward(request, response);
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