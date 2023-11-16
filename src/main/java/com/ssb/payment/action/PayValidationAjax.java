package com.ssb.payment.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.order.db.OrdersDAO;
import com.ssb.order.db.OrdersDTO;
import com.ssb.order.vo.OrdersState;
import com.ssb.payment.db.PaymentDAO;
import com.ssb.payment.db.PaymentDTO;
import com.ssb.payment.exception.PayFailedValidationException;
import com.ssb.payment.exception.PriceValidationException;
import com.ssb.payment.service.PaymentService;
import com.ssb.payment.vo.PaymentValidationCheckState;


@WebServlet("/PayValidationAjax.od")
public class PayValidationAjax extends HttpServlet {

	public void doProcess(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		System.out.println("pay.od 호출 ");

		String result = null;

		System.out.println(request.getParameter("imp_uid"));
		System.out.println(request.getParameter("merchant_uid"));
		
		//포트원에서 전달받은 결제 정보 PaymentDTO 객체에 저장
		PaymentDTO payment = PaymentDTO.createPayment(
				request.getParameter("imp_uid"), 
				Long.parseLong(request.getParameter("merchant_uid")), 
				Integer.parseInt(request.getParameter("paid_amount")),
				request.getParameter("status"),
				request.getParameter("pay_method"),
				Boolean.parseBoolean(request.getParameter("success")),
				request.getParameter("pg_provider")
				);
		
		
		System.out.println(payment.toString());
		
		OrdersDAO ordersDAO = new OrdersDAO();
		
		//payment의 merchant_uid값 ( 주문번호) 검색
		OrdersDTO ordersDTO = ordersDAO.findById(payment.getMerchantUid());
		
		PaymentValidationCheckState checkState = PaymentValidationCheckState.OPEN;
		
		try {
			PaymentService.validationCheck(payment, ordersDTO);
			
			ordersDAO.updateOrdersState(ordersDTO.getId(), OrdersState.PURCHASE);
			
			checkState = PaymentValidationCheckState.SUCCESS;
			
			ordersDAO.updateOrdersState(ordersDTO.getId(), OrdersState.PURCHASE);
			result = "SUCCESS";
			
			PaymentDAO paymentDAO = new PaymentDAO();
			paymentDAO.savePaymentInfo(payment);
			
		} catch (PayFailedValidationException e) {
			e.printStackTrace();
			checkState = PaymentValidationCheckState.FAILED;
			ordersDAO.updateOrdersState(ordersDTO.getId(), OrdersState.CANCEL);
			
			result = "ERROR";
		} catch (PriceValidationException e) {
			e.printStackTrace();
			checkState = PaymentValidationCheckState.PRICEDIFF;
			ordersDAO.updateOrdersState(ordersDTO.getId(), OrdersState.CANCEL);
			
			result="PAYDIFF";
		}
		System.out.println("위변조 결과 값 : " + checkState);
		
		
		

		response.setContentType("utf-8");
		response.getWriter().print(result);
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
		
	}

	

}