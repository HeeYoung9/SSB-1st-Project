package com.ssb.rental.action;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssb.location.db.locationDAO;
import com.ssb.location.db.locationDTO;
import com.ssb.rental.db.RentalDAO;
import com.ssb.rental.db.RentalDTO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class RentalReserveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RentalReserveAction_execute() 실행! ");
		
		
		// 전달정보 저장 (member_user_id, 예약선택날짜
		 HttpSession session = request.getSession();
	     String userId = (String) session.getAttribute("userId");
	     
		String selectedDate = request.getParameter("selectedDate");

		System.out.println("선택 날짜는 ? "+selectedDate);
		
		
		// 선택 날짜 LocalDate 타입으로 변환하기
		
		String[] strd= selectedDate.split("-");				
		LocalDate strDate = LocalDate.of(Integer.parseInt(strd[0]) , Integer.parseInt(strd[1]), Integer.parseInt(strd[2]));
		
		System.out.println("LocalDate 타입 변환 날짜는????" + strDate);
	
				
	
	
		int rItemId = Integer.parseInt(request.getParameter("itemId"));
		
		// 렌탈 아이템 정보 조회
		RentalDAO rdao = new RentalDAO();
		RentalDTO rdto = rdao.getReserveRentalItem(rItemId,strDate);
		
		// 배송지 정보 조회
		locationDAO ldao = new locationDAO();
		ArrayList locaList = ldao.getlocationRental(userId);
		
		
		
		System.out.println("주소정보는? " +locaList);
		
		
		// 렌탈아이템 정보, 선택날짜, 배송지 주소 전달
		request.setAttribute("rdto", rdto);
		/* request.setAttribute("selectedDate", selectedDate); */
		request.setAttribute("locaList", locaList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./rental/rental_page/reservePage.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
