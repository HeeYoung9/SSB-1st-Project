package com.ssb.wishlist.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;
import com.ssb.wishlist.db.wishlistDAO;

@WebServlet("*.wl")
public class wishlistController extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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
		Gson gson = new Gson();
		String json = null;
		wishlistDAO dao;

		// 수정
		if (command.equals("/wishlist.wl")) {
			System.out.println("C : /wishlist.wl 호출");
			System.out.println("C : 패턴 3 - DB사용O, 페이지 출력");

			action = new wishlistAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/switchWishlist.wl")) {
			// 정보저장
			String item_id = request.getParameter("item_id");
			String member_id = (String)request.getSession().getAttribute("member_id");
			System.out.println("item_id : " + item_id);
			System.out.println("member_id : " + member_id);
			//정보처리
			dao = new wishlistDAO();
			String result = dao.switchWishlist(item_id,member_id);
			json = gson.toJson(result);
		}else if (command.equals("/getWishlist.wl")) {
			// 정보저장
			int member_id = Integer.parseInt((String)request.getSession().getAttribute("member_id"));
			System.out.println("member_id : " + member_id);
			dao = new wishlistDAO();
			//정보처리
			ArrayList<Integer> result = dao.getWishlist(member_id);
			json = gson.toJson(result);
		}else if (command.equals("/deleteWishlist.wl")) {
			// 정보저장
			int member_id = Integer.parseInt((String)request.getSession().getAttribute("member_id"));
			String item_idArr = request.getParameter("item_idArr");
			System.out.println("member_id : " + member_id);
			System.out.println("item_idArr : " + item_idArr);
			dao = new wishlistDAO();
			//정보처리
			int result = dao.deleteWishlist(item_idArr,member_id);
			json = gson.toJson(result);
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
		}else if(json != null) {
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().print(json);
		}
		/*********************** 3. 가상주소 이동 끝 **************************/

	}// doProcess

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
