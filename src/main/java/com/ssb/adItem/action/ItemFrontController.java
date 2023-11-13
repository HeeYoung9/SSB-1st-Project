package com.ssb.adItem.action;

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

@WebServlet("*.it")	// 컨트롤러 주소 매핑
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


			//------------ 상품 관리 리스트------------( O )
			if (command.equals("/ItemMgt.it")) {
				System.out.println(" C : /ItemMgt.it 호출 ");
				System.out.println(" C : 패턴 3 - DB정보사용 O, 화면 출력 ");
				action = new ItemMgtAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

            //----------------상품 등록----------------( O )
			else if (command.equals("/itemAddForm.it")) {
				System.out.println("C: /itemAddForm.it 호출");
				System.out.println("C: 패턴1 - DB사용X, 페이지 이동");
				forward = new ActionForward();
				forward.setPath("./adItem/itemAddForm.jsp");
				forward.setRedirect(false);	
			}			
			else if (command.equals("/ItemAddAction.it")) {
				System.out.println("C: /ItemAddAction.it 호출");
				System.out.println("C: 패턴2 - DB사용O, 페이지 이동");
				action = new ItemAddAction();
				try {
				  forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			//----------------상품 수정----------------
			else if (command.equals("/ItemEdit.it")) {
			//	action = new ItemEditAction();
				try {
				  forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if (command.equals("/ItemEditProAction.it")) {
			//	action = new ItemEditProAction();
				try {
				  forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			//----------------상품 삭제----------------( O )
			else if (command.equals("/ItemDeleteAction.it")) {
				System.out.println("C: /ItemDeleteAction.it 호출");
				System.out.println("C: 패턴2 - DB사용O, 페이지 이동");
				forward = new ActionForward();
				action = new ItemDeleteAction();
				try {
				  forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			//----------------상품 상세----------------
			else if (command.equals("/ItemDetail.it")) {
			//	action = new ItemDetailAction();
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
