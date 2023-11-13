package com.ssb.location.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.util.Action;
import com.ssb.util.ActionForward;

@WebServlet("*.lo")
public class locationController extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/*********************** 1. 가상주소 계산 시작 **************************/
		String requestURI = request.getRequestURI();
		System.out.println("requestURI : " + requestURI);
		String CTXPath = request.getContextPath();
		System.out.println("CTXPath : " + CTXPath);
		String command = requestURI.substring(CTXPath.length());
		System.out.println("command : " + command);
		/*********************** 1. 가상주소 계산 끝 **************************/

		/*********************** 2. 가상주소 매핑 시작 **************************/
		System.out.println("C : 2. 가상주소 매핑 시작------------------");
		Action action = null;
		ActionForward forward = null;
		
		//수정
		 if (command.equals("/location.lo")) {
			System.out.println("C : /location.lo 호출");
			System.out.println("C : 패턴 3 - DB사용O, 페이지 출력");
			
			action = new locationAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/locationInsert.lo")) {
			System.out.println("C : /locationInsert.lo 호출");
			System.out.println("C : 패턴 1 - DB사용X, 페이지 출력");
			
			action = new locationInsert();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/locationInsertAction.lo")) {
			System.out.println("C : /locationInsert.lo 호출");
			System.out.println("C : 패턴 3 - DB사용O, 페이지 출력");
			
			action = new locationInsertAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/deleteLocation.lo")) {
			System.out.println("C : /deleteLocation.lo 호출");
			System.out.println("C : 패턴 3 - DB사용O, 페이지 출력");
			
			action = new locationDelete();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		/*********************** 2. 가상주소 매핑 끝 **************************/

		/*********************** 3. 가상주소 이동 시작 **************************/
		if (forward != null) {
			if (forward.isRedirect()) { // true
				System.out.println("C : 이동주소 : " + forward.getPath());
				System.out.println("C : 이동방법 : sendRedirect() 방식");
				response.sendRedirect(forward.getPath());
			} else { // false
				System.out.println("C : 이동주소 : " + forward.getPath());
				System.out.println("C : 이동방법 : forward() 방식");
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
		/*********************** 3. 가상주소 이동 끝 **************************/

	}// doProcess

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
