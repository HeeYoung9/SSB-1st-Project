package com.ssb.rental.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.rental.db.RentalDAO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class RentalMainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RentalMainAction_execute()호출!");
		
		RentalDAO rdao = new RentalDAO();
	
		
		ArrayList rentalList = rdao.getRentalList();
		
		request.setAttribute("rentalList", rentalList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./rental/rental_page/rentalMain.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
