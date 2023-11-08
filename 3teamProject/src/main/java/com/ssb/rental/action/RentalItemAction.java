package com.ssb.rental.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.ssb.rental.db.RentalDAO;
import com.ssb.rental.db.RentalDTO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class RentalItemAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RentalItemAction_execute() 호출");
		
		request.setCharacterEncoding("UTF-8");
		
			
		// 전달정보 저장
		int rItemId = Integer.parseInt(request.getParameter("rental_item_id"));
		
		
		
		RentalDAO rdao = new RentalDAO();
		
		RentalDTO rdto = rdao.getRentalItem(rItemId);
		
		
		
		// 제품 정보 가져오는 메서드 호출
		
				
		request.setAttribute("rdto", rdto);
		ActionForward forward = new ActionForward();
		forward.setPath("./rental/rental_page/rentalItem.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
