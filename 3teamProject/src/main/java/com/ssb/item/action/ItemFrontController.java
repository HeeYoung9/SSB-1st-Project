package com.ssb.item.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.util.Action;
import com.ssb.util.ActionForward;

/**
 *  Item 정보 처리를 수행하는 컨트롤러 
 *  
 */

@WebServlet("*.bo")	// 컨트롤러 주소 매핑
public class ItemFrontController extends HttpServlet {
	
	
	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			System.out.println(" C : ItemFrontController_doProcess()");


			/***********************1. 가상주소 계산 시작 **************************/
			System.out.println("\n\n---------- C : 1. 가상주소 계산 시작 -----------");
			String requestURI = request.getRequestURI();
			System.out.println(" requestURI: " + requestURI);
			String CTXPath = request.getContextPath();
			System.out.println(" CTXPath: " + CTXPath);
			String command = requestURI.substring(CTXPath.length());
			System.out.println(" command: " + command);
			System.out.println("---------- C : 1. 가상주소 계산 끝 -----------");
			/***********************1. 가상주소 계산 끝  ***************************/
			
			
			/***********************2. 가상주소 매핑 시작 **************************/
			System.out.println("\n---------- C: 2. 가상주소 매핑 시작 -----------");
			Action action = null;
			ActionForward forward = null;


			//------------(관리자) 상품 정보 리스트----------
			if (command.equals("/ItemMgt.bo")) {
				System.out.println(" C : /ItemMgt.bo 호출 ");
				System.out.println(" C : 패턴 3 - DB정보사용 O, 화면 출력 ");
				action = new ItemMgtAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

            //----------------상품 등록----------------
			else if (command.equals("/ItemAdd.bo")) {
				forward = new ActionForward();
				forward.setPath("./item/itemAddForm.jsp");
				forward.setRedirect(false);	
			}			
			else if (command.equals("/ItemAddAction.bo")) {
				action = new ItemAddAction();
				try {
				  forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			//----------------상품 수정----------------
			else if (command.equals("/ItemEdit.bo")) {
				action = new ItemEditAction();
				try {
				  forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if (command.equals("/ItemEditProAction.bo")) {
				action = new ItemEditProAction();
				try {
				  forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			//----------------상품 삭제----------------
			else if (command.equals("/ItemDelete.bo")) {
				forward = new ActionForward();
				action = new ItemDeleteAction();
				try {
				  forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			//----------------상품 상세----------------
			else if (command.equals("/ItemDetail.bo")) {
				action = new ItemDetailAction();
				try {
				  forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			System.out.println("\n---------- C: 2. 가상주소 매핑 끝 -----------");
			/***********************2. 가상주소 매핑 끝  **************************/
			
			
			/***********************3. 가상주소 이동 시작**************************/
			System.out.println("\n---------- C: 3. 가상주소 이동 시작 -----------");
			if(forward != null) { // ActionForward 포워딩 방식에 따라 수행
				if(forward.isRedirect()) { // true
					System.out.println(" C : 이동주소 : "+forward.getPath());
					System.out.println(" C : 이동방법 : sendRedirect() 방식 ");
					response.sendRedirect(forward.getPath()); 
				}else { 				   // false
					System.out.println(" C : 이동주소 : "+forward.getPath());
					System.out.println(" C : 이동방법 : forward() 방식 ");
					RequestDispatcher dis = 
							request.getRequestDispatcher(forward.getPath());
					dis.forward(request, response);
				}			
			}		
			System.out.println("\n---------- C: 3. 가상주소 이동 끝 -----------");
			/***********************3. 가상주소 이동 끝**************************/
			
	} //doProcess
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n\n C : ItemFrontController_doGET()");
		doProcess(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n\n C : ItemFrontController_doPOST()");
		doProcess(request, response);
	}

	
} // ItemFrontController
