package com.ssb.myPage.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.location.db.locationDAO;
import com.ssb.location.db.locationDTO;
import com.ssb.order.db.OrderDetailDAO;
import com.ssb.order.db.OrderDetailDTO;
import com.ssb.order.db.OrdersDAO;
import com.ssb.order.db.OrdersDTO;
import com.ssb.order.vo.OrdersSort;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class MyPageDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String orderId = request.getParameter("orders_id");
		
		System.out.println("MyPageDetailAction -전달받은 주문번호  " + orderId);
		
		OrdersDAO ordersDAO = new OrdersDAO();
		OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
		
		OrdersDTO findOrderDTO = ordersDAO.findById(Long.parseLong(orderId));
		
		
		
		List<OrderDetailDTO> orderDetailDTO = new ArrayList<>();
		
		if(findOrderDTO.getOrders_sort().equals(OrdersSort.SALE)) {
			orderDetailDTO = orderDetailDAO.findByOrdersId(Long.parseLong(orderId));
		}else if(findOrderDTO.getOrders_sort().equals(OrdersSort.RENTAL)) {
			orderDetailDTO = orderDetailDAO.findByOrdersIdForRental(Long.parseLong(orderId));
			
		}
		
		
		
		System.out.println("MyPageDetailAction ( 주문상세 개수 ) : " + orderDetailDTO.size());
		
		//주문 배송지 정보 소환
		locationDAO locationDAO = new locationDAO();
		
		locationDTO locationDTO = locationDAO.findById(findOrderDTO.getLocation_id());
		
		
		
		
		request.setAttribute("orders_id", orderId);
		request.setAttribute("orders_state", findOrderDTO.getOrders_state());
		request.setAttribute("orders", findOrderDTO);
		request.setAttribute("orderDetailDTO", orderDetailDTO);
		request.setAttribute("location", locationDTO);
		System.out.println(findOrderDTO.getId());
		System.out.println(findOrderDTO.getOrders_sort());
		System.out.println("로케이션 아이디 값 ??? "+locationDTO.getLocation_id());
		
		ActionForward forward = new ActionForward();
		forward.setPath("./myPage/myPageDetail.jsp");
		forward.setRedirect(false);
		
		return forward;
		
	}

}