package com.ssb.order.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.payment.service.PaymentService;
import com.ssb.payment.vo.StoreInfo;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class OrderTestAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 주문 생성과 동시에 결제창으로 이동
		
		//받아올 정보
		
//		OrdersDAO orderDAO = new OrdersDAO();
//		Long result1 = orderDAO.findByTodayDate(20231103L);
//		Long result2 = orderDAO.findByTodayDate(20231102L);
//		
//		
//		//request 정보에 저장
//		request.setAttribute("result1", result1);
//		request.setAttribute("result2", result2);
//		
//		orderDAO.updateOrdersState(20231105000003L, OrdersState.PURCHASE);
//		
		
		//----------------------핵심 테스트 코드 시작-----------------------------------		
		
//		long createNum1 = orderDAO.createOrdersId();
//		System.out.println("생성된 첫번째 상품 ID = " +createNum1);
//		OrdersDTO testId1 = OrdersDTO.createSaleOrder(createNum1, 1);
//		
//		ItemDAO Idao = new ItemDAO();
//		ItemDTO iDTO1 = Idao.getItem(7);
//		ItemDTO iDTO2 = Idao.getItem(8);
//		ItemDTO iDTO3 = Idao.getItem(9);
//		ItemDTO iDTO4 = Idao.getItem(10);
//		
//		int totalPrice = 0;
//		
//		OrderDetailDTO detail1 = OrderDetailDTO.createSaleItem(createNum1, 7, 3, iDTO1.getItem_price(), 9);
//		totalPrice +=detail1.getTotalPrice();
//		OrderDetailDTO detail2 = OrderDetailDTO.createSaleItem(createNum1, 8, 2, iDTO1.getItem_price(), 8);
//		totalPrice +=detail2.getTotalPrice();
//		
//		OrderDetailDTO detail3 = OrderDetailDTO.createSaleItem(createNum1, 9, 1, iDTO1.getItem_price(), 9);
//		totalPrice +=detail3.getTotalPrice();
//		OrderDetailDTO detail4 = OrderDetailDTO.createSaleItem(createNum1, 10, 3, iDTO1.getItem_price(), 11);
//		totalPrice +=detail4.getTotalPrice();
//		
//		String test = "10,11,12,13";
//		
//		OrderDetailDAO orderDDAO = new OrderDetailDAO();
//		cartDAO cartDAO = new cartDAO();
//		cartDAO.decreaseQuantity(test);
//		
//		testId1.changeTotalPrice(totalPrice);
//		
//		System.out.println("전체 토탈 가격 "+testId1.getTotal_price());
////		
//		orderDAO.saveSaleOrders(testId1);
//		orderDDAO.saveSaleDetail(detail1);
//		orderDDAO.saveSaleDetail(detail2);
//		orderDDAO.saveSaleDetail(detail3);
//		orderDDAO.saveSaleDetail(detail4);
//	
//----------------------핵심 테스트 코드 끝-----------------------------------		
		
//		
//		List<OrderDetailDTO> dtoList = new ArrayList<>();
//		
//		dtoList= orderDDAO.findByOrdersId(20231108000006L);
//		
//		for(OrderDetailDTO dto : dtoList) {
//			System.out.println(dto.getOrderD_id());
//			System.out.println(dto.getItem_name());
//			System.out.println(dto.getQuantity());
//			System.out.println(dto.getPrice());
//			System.out.println("=========================");
//		}
//		
//		
//		
//		long createNum2 = orderDAO.createOrdersId();
//		System.out.println("생성된 첫번째 상품 ID = " +createNum2);
		
//		OrdersDTO findOrder = orderDAO.findById(20231110000008L);
//		
//		System.out.println(findOrder.getId());
//		System.out.println(findOrder.getMember_id());
//		System.out.println(findOrder.getOrders_date());
//		System.out.println(findOrder.getOrders_sort());
//		System.out.println(findOrder.getOrders_state());
//		
//		StoreInfo info = new StoreInfo();
//		PaymentService service = new PaymentService();
//		String mytoken = service.getTokenV3(info);
//		
//		
//		System.out.println("토큰 출력 값 : " + mytoken);
//		
//		ItemDAO itemDAO = new ItemDAO();
//		
//		ItemDTO itemDTO = itemDAO.getItem(7, 9);
//		System.out.println("가져온 item의 id값 : " + itemDTO.getItem_id());
//		System.out.println("가져온 item의 name값 : " + itemDTO.getItem_name());
//		System.out.println("가져온 item의 옵션 id값 : " + itemDTO.getOptions_id());
//		System.out.println("가져온 item의 옵션 name값 : " + itemDTO.getOptions_name());
//		System.out.println("가져온 item의 옵션 수량 : " + itemDTO.getOptions_quantity());
//		System.out.println("가져온 item의 물품 가격 : " + itemDTO.getItem_price());

//		System.out.println("호출 시작");
//		
//		List<OrdersDTO> orderDTO =  orderDAO.findByUserAndState(1, OrdersState.PURCHASE);
//		
//		for(OrdersDTO order : orderDTO) {
//			System.out.println("주문 아이디"+order.getId());
//		}
//		
		
		PaymentService paymentService = new PaymentService();
		
		StoreInfo info = new StoreInfo();
		
		String myToken = paymentService.getTokenV3(info);
		
		paymentService.refundPayment(myToken, 20231112000012L);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./ssm/order/test.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
