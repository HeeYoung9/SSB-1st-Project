package com.itwillbs.ssb.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.ssb.db.cartDAO;
import com.itwillbs.ssb.db.cartDTO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class cartAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//정보저장
		String member_id = request.getParameter("member_id");
		cartDAO dao = new cartDAO();
		ArrayList<cartDTO> dtoArray = dao.getCart(member_id);
		
		request.setAttribute("dtoArray", dtoArray);
		
		// 페이지 이동준비 
		ActionForward forward = new ActionForward();
		forward.setPath("./cart/cartList.jsp");
		forward.setRedirect(false);

		return forward;
	}
}
