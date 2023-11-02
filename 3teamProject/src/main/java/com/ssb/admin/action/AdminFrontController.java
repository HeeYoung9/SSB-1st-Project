package com.ssb.admin.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.util.Action;
import com.ssb.util.ActionForward;

@WebServlet("*.ad")
public class AdminFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C: AdminFrontController_doProcess() 호출");
		
		/****************************** 1. 가상주소 계산 시작 ****************************/
		System.out.println("\n---------- C: 1. 가상주소 계산 시작 -----------");
		String requestURI = request.getRequestURI();
		System.out.println("requestURI: " + requestURI);
		String CTXPath = request.getContextPath();
		System.out.println("CTXPath: " + CTXPath);
		String command = requestURI.substring(CTXPath.length());
		System.out.println("command: " + command);
		System.out.println("---------- C: 1. 가상주소 계산 끝   -----------");
		/****************************** 1. 가상주소 계산 끝 ******************************/
		
		
		/****************************** 2. 가상주소 매핑 시작 ****************************/
		System.out.println("\n---------- C: 2. 가상주소 매핑 시작 -----------");
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/AdminMain.ad")) {
			System.out.println("C: /AdminLogin.ad 호출");
			System.out.println("C: 패턴1 - DB사용X, 페이지 이동");
			
			forward = new ActionForward();
			forward.setPath("./admin/adminMain.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/AdminLogin.ad")) {
			System.out.println("C: /AdminLogin.ad 호출");
			System.out.println("C: 패턴1 - DB사용X, 페이지 이동");
			
			forward = new ActionForward();
			forward.setPath("./admin/loginForm.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/AdminLoginAction.ad")) {
			System.out.println("C: /AdminLoginAction.ad 호출");
			System.out.println("C: 패턴2 - DB사용O, 페이지 이동");
			
			// AdminLoginAction() 객체 생성
			action = new AdminLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/AdminLogout.ad")) {
			System.out.println("C: /AdminLogout.ad 호출");
			System.out.println("C: 패턴2 - DB사용O, 페이지 이동");
			
			// AdminLogoutAction() 객체 생성
			action = new AdminLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}		
		System.out.println("---------- C: 2. 가상주소 매핑 끝   -----------");
		/****************************** 2. 가상주소 매핑 끝 ******************************/
		
		
		/****************************** 3. 가상주소 이동 시작 ****************************/
		System.out.println("\n---------- C: 3. 가상주소 이동 시작 -----------");
		if(forward != null) {
			if(forward.isRedirect()) { // true
				System.out.println("C: 이동주소: " + forward.getPath());
				System.out.println("C: 이동방법: sendRedirect() 방식");
				response.sendRedirect(forward.getPath());
			} else { // false
				System.out.println("C: 이동주소: " + forward.getPath());
				System.out.println("C: 이동방법: forward() 방식");
				
				RequestDispatcher dis = 
						request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
		System.out.println("---------- C: 3. 가상주소 이동 끝   -----------");
		/****************************** 3. 가상주소 이동 끝 ******************************/
	}
	
		
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\nC: AdminFrontController_doGet() 호출");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\nC: AdminFrontController_doPost() 호출");
		doProcess(request, response);
	}
	
}