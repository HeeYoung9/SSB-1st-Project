package com.itwillbs.ssb.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.itwillbs.ssb.db.cartAjaxDAO;
import com.itwillbs.ssb.db.optionsDTO;

@WebServlet("*.ca")
public class cartAJAX extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public cartAJAX() {
		super();
	}

	public void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 가상주소
		String requestURI = request.getRequestURI();
		System.out.println("\t requestURI : " + requestURI);
		String CTXPath = request.getContextPath();
		System.out.println("\t CTXPath : " + CTXPath);
		String command = requestURI.substring(CTXPath.length());
		System.out.println("\t command : " + command);
		// GSON생성
		Gson gson = new Gson();
		if (command.equals("/changeOption.ca")) {
			// 정보저장
			String item_id = request.getParameter("item_id");
			System.out.println(item_id);
			// 정보처리
			cartAjaxDAO dao = new cartAjaxDAO();
			List<optionsDTO> list = dao.getOptions(item_id);
			String listJson = gson.toJson(list);
			System.out.println(listJson);
			// 정보전송
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().print(listJson); // 전송이 되는 부분
		} else if (command.equals("/changeOptionAction.ca")) {
			// 정보저장
			String option_id = request.getParameter("option_id");
			String item_id = request.getParameter("item_id");
			String cart_id = request.getParameter("cart_id");
			String cart_quantity = request.getParameter("cart_quantity");
			System.out.println("item_id : " + item_id);
			System.out.println("option_id : " + option_id);
			System.out.println("cart_id : " + cart_id);
			System.out.println("option_quantity : " + cart_quantity);
			//정보처리
			cartAjaxDAO dao = new cartAjaxDAO();
			int result = dao.updateCart(cart_id,item_id,option_id,cart_quantity);
			System.out.println(result);
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().print(result);
		} else if (command.equals("/deleteCart.ca")) {
			// 정보저장
			String member_id = request.getParameter("member_id");
			String cart_id = request.getParameter("cart_id");
			System.out.println("member_id : " + member_id);
			System.out.println("cart_id : " + cart_id);
			//정보처리
			cartAjaxDAO dao = new cartAjaxDAO();
			int result = dao.deleteCart(cart_id,member_id);
			System.out.println(result);
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().print(result);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("cartAJAX doGet()");
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("cartAJAX doPOST()");
		doProcess(request, response);
	}

}
