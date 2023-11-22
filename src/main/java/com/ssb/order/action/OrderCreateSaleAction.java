package com.ssb.order.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssb.Mitem.ItemDAO;
import com.ssb.Mitem.ItemDTO;
import com.ssb.cart.db.cartDAO;
import com.ssb.cart.db.cartDTO;
import com.ssb.order.db.OrderDetailDAO;
import com.ssb.order.db.OrderDetailDTO;
import com.ssb.order.db.OrdersDAO;
import com.ssb.order.db.OrdersDTO;
import com.ssb.order.exception.OrderPriceException;
import com.ssb.order.exception.StockLackException;
import com.ssb.order.service.OrderService;
import com.ssb.order.vo.CreateOrderResult;
import com.ssb.order.vo.InvalidatedReason;
import com.ssb.order.vo.OrderCheckState;

import com.ssb.util.Action;
import com.ssb.util.ActionForward;
import com.ssb.util.JSMoveFunction;

public class OrderCreateSaleAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		CreateOrderResult result = CreateOrderResult.FAILED;
		
		//받아올 정보
		
		String cartItems = request.getParameter("strCartList");
		int member_id = Integer.parseInt((String)request.getSession().getAttribute("member_id"));
		// long memberId =  Integer.parseInt(request.getParameter("memberId"));
		//String cartItems = "19,20,21,22";
		// long memberId = 1000;
		
		
		//----------------------11월 16일 추가 ----------------------------------------
		int location_id = Integer.parseInt(request.getParameter("location_id"));
		System.out.println("OrderCreateAction : location_id 값" + location_id);
		//-------------------------------------------------------------------------
		
		
		cartDAO cartDAO = new cartDAO();
		
		List<cartDTO> carts = cartDAO.getCartsV2(cartItems);
		
		
		OrderCheckState orderCheckState;
		
		//최종 화면에 출력할 결과값들
		OrdersDTO ordersDTO = new OrdersDTO();
		List<OrderDetailDTO> orderDDTOs = new ArrayList<>();
		
		try {
			
			//재고수량 체크 확인 -> 재고 수량이 구매 하고자 하는 양보다 부족시 예외 발생
			orderCheckState = OrderService.stockCheck(carts);
			
			//-----------------------재고 수량 체크에서 문제 없을시 아래 코드 진헹-----------------------------
			OrdersDAO orderDAO = new OrdersDAO();
			
			//orderㄴID생성
			long ordersID = orderDAO.createOrdersId();
			System.out.println("생성된 첫번째 상품 ID = " +ordersID);
			
			//----------------------11월 16일 변경내용-----------------@@@@@@@@@@@@@@@@@@@@@@
			ordersDTO = OrdersDTO.createSaleOrder(ordersID, member_id, location_id);
			//------------------------------------------------------@@@@@@@@@@@@@@@@@@@@@@
			
			int orderTotalPrice = 0;

			
			//----------------------------옵션 수량 깎는 메서드 들어갈 자리------------------------
			cartDAO.decreaseQuantity(cartItems);
			
			//-------------------------------------------------------------------
			//할인율
			int discount = 0;
			//------------------------------------------------------------------
			
			//주문 무한 생성
			for(cartDTO cartDTO : carts) {
				
				
				//귀찮아서 그냥 기존에 있던거 끌어씀
				ItemDAO itemDAO = new ItemDAO();
				
				System.out.println("OrderCreateSale 78번줄 : cartDTO 아이템 ID"+ cartDTO.getItem_id());
				System.out.println("OrderCreateSale 79번줄 : cartDTO 옵션 ID : "+ cartDTO.getOptions_id());
				
				//아이템 가격 추출
				ItemDTO itemDTO = itemDAO.getItemV2(cartDTO.getItem_id());
				
				System.out.println("OrderCreateSale 84번줄 : "+ itemDTO.getItem_id());
				System.out.println("OrderCreateSale 85번줄 : "+ itemDTO.getItem_price());
				//주문상세 생성
				OrderDetailDTO orderDetail = OrderDetailDTO.createSaleItem(ordersID, cartDTO.getItem_id(),itemDTO.getItem_name() ,cartDTO.getCart_quantity(),itemDTO.getItem_price()-(itemDTO.getItem_price()*discount), cartDTO.getOptions_id());
				
				OrderDetailDAO orderDDAO = new OrderDetailDAO();
				//주문상세 저장
				orderDDAO.saveSaleDetail(orderDetail);
				orderDDTOs.add(orderDetail);
				
				System.out.println("OrderCreate 호출 확인 1");
				//총 주문 금액 plus
				orderTotalPrice += orderDetail.getTotalPrice();
				//결제완료시 장바구니 삭제 메서드
				cartDAO.deleteCart(cartDTO.getCart_id(), member_id);
			}
			
			
			System.out.println("OrderCreate 호출 확인 2");
			//계싼된 총 주문 금액 DTO에 입력
			ordersDTO.changeTotalPrice(orderTotalPrice);
			
			
			//ordersDTO DB에 최종 저장
			orderDAO.saveSaleOrders(ordersDTO);
			
			System.out.println("OrderCreate 호출 확인 3");
			result = CreateOrderResult.SUCCESS;
			
		} catch (StockLackException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	
			result = CreateOrderResult.FAILED;
			String message = "수량이 부족한 제품이 있습니다.";
			JSMoveFunction.alertBack(response,message);
			
		} catch (OrderPriceException e) {
			System.out.println("주문 금액 문제 발생");

			e.printStackTrace();
			result = CreateOrderResult.FAILED;
			
			String message = "주문 금액에 문제가 발생하였습니다. 다시 시도 해주시길 바랍니다.";
			JSMoveFunction.alertBack(response,message);
			
		}


		request.setAttribute("ordersDTO", ordersDTO);
		request.setAttribute("orderDDTOs", orderDDTOs);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./order/order_pay.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
	
	
}