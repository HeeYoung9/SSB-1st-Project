package com.ssb.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.util.Action;
import com.ssb.util.ActionForward;

@WebServlet("*.me")
public class MemberFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C : MemberFrontController_doProcess()");
		
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
		System.out.println("C : MemberFrontController_doGet()");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C : MemberFrontController_doPost()");
	}
	
	
}
