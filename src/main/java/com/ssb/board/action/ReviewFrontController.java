package com.ssb.board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.util.Action;
import com.ssb.util.ActionForward;

@WebServlet("*.rv")
public class ReviewFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C: ReviewFrontController_doProcess() 호출");
		
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
		
		if(command.equals("/ReviewList.rv")) {
			System.out.println("C: /ReviewList.rv 호출");
			System.out.println("C: 패턴1 - DB사용X, 페이지 이동");
			
			forward = new ActionForward();
			forward.setPath("./board/review/reviewList.jsp");
			forward.setRedirect(false);
		}
//		else if(command.equals("/ReviewWrite.rv")) {
//			System.out.println("C: /ReviewWrite.rv 호출");
//			System.out.println("C: 패턴1 - DB사용X, 페이지 이동");
//			
//			forward = new ActionForward();
//			forward.setPath("./board/review/reviewWriteForm.jsp");
//			forward.setRedirect(false);
//		}
//		else if(command.equals("/ReviewWriteAction.rv")) {
//			System.out.println("C: /ReviewWriteAction.rv 호출");
//			System.out.println("C: 패턴2 - DB사용O, 페이지 이동");
//			
//			// ReviewWriteAction 객체 생성
//			action = new ReviewWriteAction();
//			try {
//				forward = action.execute(request, response);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		} 
//		else if(command.equals("/ReviewUpdate.rv")) {
//			System.out.println("C: /ReviewUpdate.rv 호출");
//			System.out.println("C: 패턴3 - DB사용O, 페이지 출력");
//			
//			// ReviewUpdateAction 객체 생성
//			action = new ReviewUpdateAction();
//			try {
//				forward = action.execute(request, response);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		else if(command.equals("/ReviewUpdateProAction.rv")) {
//			System.out.println("C: /ReviewUpdateProAction.rv 호출");
//			System.out.println("C: 패턴2 - DB사용O, 페이지 이동");
//			
//			// ReviewUpdateProAction 객체 생성 
//			action = new ReviewUpdateProAction();
//			try {
//				forward = action.execute(request, response);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		else if(command.equals("/ReviewDeleteAction.rv")) {
//			System.out.println("C: /ReviewDeleteAction.rv 호출");
//			System.out.println("C: 패턴2 - DB사용O, 페이지 이동");
//			
//			// BoardDeleteAction 객체 생성
//			action = new ReviewDeleteAction();
//			try {
//				forward = action.execute(request, response);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}		
//		}
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
		System.out.println("\nC: ReviewFrontController_doGet() 호출");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\nC: ReviewFrontController_doPost() 호출");
		doProcess(request, response);
	}
	
}