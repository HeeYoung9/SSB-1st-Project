package com.ssb.main.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssb.adItem.db.ItemDAO;
import com.ssb.adItem.db.ItemDTO;
import com.ssb.location.db.locationDAO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class ItemReserveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ItemReserveAction_execute() 실행! ");
		
		HttpSession session = request.getSession();
	    String userId = (String) session.getAttribute("userId");
	    
	    int item_id = Integer.parseInt(request.getParameter("item_id"));
	    session.setAttribute("item_id", item_id);
		
		// 상품 정보 조회
		ItemDAO idao = new ItemDAO();
	    ItemDTO itemDTO = idao.getItem(item_id);
		
		// 배송지 정보 조회
		locationDAO ldao = new locationDAO();
		ArrayList locaList = ldao.getlocationRental(userId);
		
		System.out.println("나와라");
		
		request.setAttribute("itemDTO", itemDTO);
		request.setAttribute("locaList", locaList);
		
		System.out.println("나와라22222");
		ActionForward forward = new ActionForward();
		forward.setPath("./saleItem/ItemReserve.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
