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

@WebServlet("*.bo")
public class BoardFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C: BoardFrontController_doProcess() 호출");
		
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
		
		if(command.equals("/NoticeWrite.bo")) {
			System.out.println("C: /NoticeWrite.bo 호출");
			System.out.println("C: 패턴1 - DB사용X, 페이지 이동");
			
			forward = new ActionForward();
			forward.setPath("./board/notice/noticeWriteForm.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/NoticeWriteAction.bo")) {
			System.out.println("C: /NoticeWriteAction.bo 호출");
			System.out.println("C: 패턴2 - DB사용O, 페이지 이동");
			
			// NoticeWriteAction 객체 생성
			action = new NoticeWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/NoticeList.bo")) {
			System.out.println("C: /NoticeList.bo 호출");
			System.out.println("C: 패턴3 - DB사용O, 페이지 출력");
			
			// NoticeListAction 객체 생성
			action = new NoticeListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/NoticeContent.bo")) {
			System.out.println("C: /NoticeContent.bo 호출");
			System.out.println("C: 패턴3 - DB사용O, 페이지 출력");
			
			// BoardContentAction 객체 생성
			action = new NoticeContentAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/NoticeUpdate.bo")) {
			System.out.println("C: /NoticeUpdate.bo 호출");
			System.out.println("C: 패턴3 - DB사용O, 페이지 출력");
			
			// NoticeUpdateAction 객체 생성
			action = new NoticeUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/NoticeUpdateProAction.bo")) {
			System.out.println("C: /NoticeUpdateProAction.bo 호출");
			System.out.println("C: 패턴2 - DB사용O, 페이지 이동");
			
			// BoardUpdateProAction 객체 생성 
			action = new NoticeUpdateProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/NoticeDeleteAction.bo")) {
			System.out.println("C: /NoticeDeleteAction.bo 호출");
			System.out.println("C: 패턴2 - DB사용O, 페이지 이동");
			
			// BoardDeleteAction 객체 생성
			action = new NoticeDeleteAction();
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
		System.out.println("\nC: BoardFrontController_doGet() 호출");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\nC: BoardFrontController_doPost() 호출");
		doProcess(request, response);
	}
	
}