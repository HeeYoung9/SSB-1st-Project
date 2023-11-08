package com.ssb.cart.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.cart.db.cartDAO;
import com.ssb.location.db.locationDTO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class locationInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 받은정보저장
		locationDTO dto = new locationDTO();
		dto.setLocation_name(request.getParameter("location_name"));
		dto.setLocation_phone(request.getParameter("location_phone"));
		dto.setLocation_postcode(request.getParameter("location_postcode"));
		dto.setLocation_add(request.getParameter("location_add"));
		dto.setLocationD_add(request.getParameter("locationD_add"));
		dto.setLocation_title(request.getParameter("location_title"));
		dto.setLocation_requested(request.getParameter("location_requested"));
		dto.setMember_id(Integer.parseInt(request.getParameter("member_id")));//세션에서 받아오기
		// 데이터 처리
		cartDAO dao = new cartDAO();
		int result = dao.insertLocation(dto);
		System.out.println(result);
		// 페이지 이동준비
		ActionForward forward = new ActionForward();
		forward.setPath("/location.bo?"+request.getParameter("member_id"));
		forward.setRedirect(false);

		return forward;
	}

}
