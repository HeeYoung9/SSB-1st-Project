package com.ssb.main.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.util.Action;
import com.ssb.util.ActionForward;




public class MainFrontController extends HttpServlet{
	

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println(" C : MemberFrontController doProcess() 호출!");
	System.out.println(" C : GET/POST방식 모두 처리!");
	
	System.out.println("\n ----------------1. 가상주소 계산 시작 ----------------------");

	String requestURI = request.getRequestURI();
	System.out.println(" C : requestURI : "+requestURI);
	
	String CTXPath = request.getContextPath(); //Context = 프로젝트
	System.out.println(" C : CTXPath : "+CTXPath);
	
	String command = requestURI.substring(CTXPath.length());
	
	System.out.println(" C : command " + command);
	
	
	System.out.println(" ----------------1. 가상주소 계산 종료 ----------------------");
	
	
	System.out.println("\n ----------------2. 가상주소 매핑 시작 ----------------------");
	Action action = null;
	ActionForward forward = null; 
	
	if(command.equals("/Main.in")) {
		System.out.println(" C : /Main.in 매핑 ");
		System.out.println(" C : 패턴1 - DB처리 X, 뷰페이지 이동");
		forward = new ActionForward();
		forward.setPath("./main/main_page/main.jsp"); // 메일페이지
		forward.setRedirect(false); 
		
		System.out.println(" C : "+forward); //toString()을 오버라이딩했으므로 객체의 문자열 정보가 호출 됨.

		
	}
	
	
	System.out.println(" ----------------2. 가상주소 매핑 종료 ----------------------");
	
	System.out.println("\n ----------------3. 가상주소 이동 시작 ----------------------");
	
	if(forward != null) {//이동정보가 존재할 때 실행
		if(forward.isRedirect()) { //true
			System.out.println(" C : "+forward.getPath()+"로, 이동방식 : sendRedirect()");
			response.sendRedirect(forward.getPath());
		}else {//false
			System.out.println(" C : "+forward.getPath()+"로, 이동방식 : forward() ");
			RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
			dis.forward(request, response);
			
			
		}
	}
	
	
	System.out.println(" ----------------3. 가상주소 이동 종료 ----------------------");
	
	
	
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n\n C : MemberFrontController doGet() 호출!");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" C : MemberFrontController doPost() 호출!");
		doProcess(request, response);
		
	}
	
	

}

