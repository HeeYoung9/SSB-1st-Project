package com.ssb.cart.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.cart.db.cartDAO;
import com.ssb.cart.db.cartDTO;
import com.ssb.location.db.locationDTO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class locationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 받은정보저장
		String member_id = request.getParameter("member_id");
		System.out.println("locationAction.member_id : " + member_id);
		// 데이터 처리
		cartDAO dao = new cartDAO();
		ArrayList<locationDTO> dtoArray = dao.getlocation(member_id);
		// 보낼정보저장
		request.setAttribute("dtoArray", dtoArray);
		// 페이지 이동준비
		ActionForward forward = new ActionForward();
		forward.setPath("./location/location.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
