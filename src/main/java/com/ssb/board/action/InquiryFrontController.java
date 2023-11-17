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

@WebServlet("*.iq")
public class InquiryFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C: InquiryFrontController_doProcess() 호출");
		
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
		
		if(command.equals("/InquiryQWrite.iq")) {
			System.out.println("C: /InquiryQWrite.iq 호출");
			System.out.println("C: 패턴1 - DB사용X, 페이지 이동");
			
			forward = new ActionForward();
			forward.setPath("./board/inquiry/inquiryQWriteForm.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/InquiryQWriteAction.iq")) {
			System.out.println("C: /InquiryQWriteAction.iq 호출");
			System.out.println("C: 패턴2 - DB사용O, 페이지 이동");
			
			// InquiryQWriteAction 객체 생성
			action = new InquiryQWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/InquiryList.iq")) {
			System.out.println("C: /InquiryList.iq 호출");
			System.out.println("C: 패턴3 - DB사용O, 페이지 출력");
			
			// NoticeListAction 객체 생성
			action = new InquiryListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/InquiryContent.iq")) {
			System.out.println("C: /InquiryContent.iq 호출");
			System.out.println("C: 패턴3 - DB사용O, 페이지 출력");
			
			// InquiryContentAction 객체 생성
			action = new InquiryContentAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/InquiryAWriteAction.iq")) {
			System.out.println("C: /InquiryAWriteAction.iq 호출");
			System.out.println("C: 패턴3 - DB사용O, 페이지 출력");
			
			// InquiryAWriteAction 객체 생성
			action = new InquiryAWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/InquiryAWriteProAction.iq")) {
			System.out.println("C: /InquiryAWriteProAction.iq 호출");
			System.out.println("C: 패턴2 - DB사용O, 페이지 이동");
			
			// InquiryAWriteProAction 객체 생성
			action = new InquiryAWriteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		else if(command.equals("/InquiryDeleteAction.iq")) {
			System.out.println("C: /InquiryDeleteAction.iq 호출");
			System.out.println("C: 패턴2 - DB사용O, 페이지 이동");
			
			// InquiryDeleteAction 객체 생성
			action = new InquiryDeleteAction();
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
		System.out.println("\nC: InquiryFrontController_doGet() 호출");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\nC: InquiryFrontController_doPost() 호출");
		doProcess(request, response);
	}
	
}