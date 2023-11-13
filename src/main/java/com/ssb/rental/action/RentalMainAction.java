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
		
		String search = request.getParameter("search");
		String category = request.getParameter("category");
		RentalDAO rdao = new RentalDAO();
		
	
		
		ArrayList rentalList = null;
		
		 if(search==null&&category==null) { 
				System.out.println(" M : 검색어 없음! "); 
				rentalList = rdao.getRentalList();
			}else if(search != null){ //검색어가 있을때 - 검색결과 유무에따라 추가적인 제어 필요
			  System.out.println(" M : 검색어 있음! ("+search+")"); 
			  rentalList = rdao.getRentalList(search);
			}else if(search==null&& category != null){
				System.out.println(" M : 카테고리 선택! ("+category+")"); 
				rentalList = rdao.getCategoryItem(category);
			}
		
		
		request.setAttribute("rentalList", rentalList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./rental/rental_page/rentalMain.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
