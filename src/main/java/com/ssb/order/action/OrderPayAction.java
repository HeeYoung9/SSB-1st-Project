package com.ssb.order.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.order.db.OrderDetailDAO;
import com.ssb.order.db.OrderDetailDTO;
import com.ssb.order.db.OrdersDAO;
import com.ssb.order.db.OrdersDTO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class OrderPayAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//필요한거 유저 정보
		//Member member = request.getSession();
		//long orderId = Long.parseLong(request.getParameter("orderId"));
		long userId = 1;
		long orderId = 20231111000003L;
		
		
		System.out.println("호출이다 호출");
		
		
		
		
		//주문, 주문상세 모두 가져오기
		OrdersDAO ordersDAO = new OrdersDAO();
		OrderDetailDAO orderDDAO = new OrderDetailDAO();
		
		OrdersDTO ordersDTO = ordersDAO.findById(orderId);
		
		//----------------테스트 코드-------------------------------------
		System.out.println("소환된 ID" + ordersDTO.getId());
		//----------------------------------------------
		
		List<OrderDetailDTO> orderDDTOs = orderDDAO.findByOrdersId(orderId);
		
		//----------------------------------------------
		System.out.println(orderDDTOs.size());
		
		for(OrderDetailDTO order : orderDDTOs) {
			System.out.println(order.getOrderD_id());
			System.out.println(order.getItem_name());
		}
		
		request.setAttribute("ordersDTO", ordersDTO);
		request.setAttribute("orderDDTOs", orderDDTOs);
		
		
		
		//------------------------------------------------------------
		
		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./order/order_pay.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
