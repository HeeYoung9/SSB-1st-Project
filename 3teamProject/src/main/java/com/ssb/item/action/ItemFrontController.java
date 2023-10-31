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
			String requestURI = request.getRequestURI();
			String CTXPath = request.getContextPath();
			String command = requestURI.substring(CTXPath.length());
			/***********************1. 가상주소 계산 끝  ***************************/
			
			
			/***********************2. 가상주소 매핑 시작 **************************/
			Action action = null;
			ActionForward forward = null;

            //----------------상품 등록----------------
			if (command.equals("/ItemAdd.bo")) {
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
			//------------(관리자)상품 리스트----------
			else if (command.equals("/AdminItemList.bo")) {
				action = new AdminItemListAction();
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
			//--------------상품 Q&A 작성?--------------
			else if (command.equals("/QnaWrite.bo")) {
				forward = new ActionForward();
//				forward.setPath("./board/qnawriteform.jsp");
				forward.setRedirect(false);	
			}			
			else if (command.equals("/QnaWriteAction.bo")) {
//				action = new QnaWriteAction();
				try {
				  forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
	
			
			//---------------베스트 리뷰---------------
			
			//----------------리뷰 작성----------------
			
			//----------------리뷰 목록----------------
			
			//----------------위시 상품----------------
			
			//----------------위시 취소----------------

			//--------------- ???? ????----------------

			//--------------- ???? ????----------------
			
			

			/***********************2. 가상주소 매핑 끝  **************************/
			
			
			/***********************3. 가상주소 이동 시작**************************/
			if(forward != null) { // ActionForward 포워딩 방식에 따라 수행
				if(forward.isRedirect()) { // true
					response.sendRedirect(forward.getPath()); 
				}else { 				   // false
					RequestDispatcher dis = 
							request.getRequestDispatcher(forward.getPath());
					dis.forward(request, response);
				}			
			}		
			/***********************3. 가상주소 이동 끝**************************/
			
	} //doProcess
	
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
} // ItemFrontController
