package com.itwillbs.ssb.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.ssb.db.cartDAO;
import com.itwillbs.ssb.db.orderDTO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class orderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String checkArray = request.getParameter("checkArray");
		System.out.println(checkArray);
		cartDAO dao = new cartDAO();
		ArrayList<orderDTO> dtoArray = dao.getOrder(checkArray);
		
		request.setAttribute("dtoArray", dtoArray);
		
		// 페이지 이동준비 
		ActionForward forward = new ActionForward();
		forward.setPath("./order/order.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
