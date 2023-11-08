package com.ssb.rental.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.stream.events.Comment;

import com.ssb.util.Action;
import com.ssb.util.ActionForward;


@WebServlet("*.re")

public class RentalFrontController extends HttpServlet{
	

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println(" C : RentalFrontController doProcess() 호출!");
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
	
	if(command.equals("/RentalMain.re")) {
		System.out.println(" C : /RentalMain.re 매핑 ");
		System.out.println(" C : 패턴3 - DB처리 o, 뷰페이지 출력");
		
		action = new RentalMainAction();
		
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(" C : "+forward); //toString()을 오버라이딩했으므로 객체의 문자열 정보가 호출 됨.
		
	}else if(command.equals("/RentalItem.re")) {
		System.out.println(" C : /RentalItem.re 매핑 ");
		System.out.println(" C : 패턴3 - DB처리 o, 뷰페이지 출력");
		
		action = new RentalItemAction();
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
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

