package com.ssb.order.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.payment.action.PayValidationAjax;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

@WebServlet("*.od")
public class OrderFrontController extends HttpServlet{
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		System.out.println(" C : OrderFrintController");
		
		//-----------------------1. 가상주소 계산 시작--------------------
		String requestURI = request.getRequestURI();
		String CTXPath = request.getContextPath();
		String command = requestURI.substring(CTXPath.length());
		
		//-----------------------1. 가상주소 계산 종료 인가봄----------------
		
		
		
		Action action = null;
		ActionForward forward = null;
		
		
		if(command.equals("/OrderTest.od")) {
			System.out.println(" C : /OrderTest.od 매핑");
			System.out.println(" C : DB 사용 , 뷰 페이지");

			action = new OrderTestAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		else if(command.equals("/PayTest.od")) {
			System.out.println(" C : /Pay 매핑");
			System.out.println(" C : 사용 ㅌ");
			
			forward = new ActionForward();
			forward.setPath("./ssm/order/test/tmp_pay.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/Order.od")){ // 주문페이지
			
			
			action = new OrderAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if(command.equals("/OrderSalePay.od")) { //주문 결제 페이지
			System.out.println( " C : /PayPage (디자인 구현중)");
			System.out.println(" 아무것도 없음");
			
			action = new OrderCreateSaleAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if(command.equals("/OrderResult.od")) { //주문 결과 뷰 페이지
			
			action = new OrderResultAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/OrderRefund.od")) { // 주문 환불 주소
			
			action = new OrderRefundAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		else if(command.equals("/realTest.od")) {
		
			action = new OrderCreateSaleAction();
			
			try {
				forward= action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/refundTest.od")) {
			
			action = new OrderRefundAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if(command.equals("/AdOrderList.od")) {
			
			action = new AdOrderListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/AdOrderDetail.od")) {
			
			action = new AdOrderDetailAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		//-------------------Ajax 라인 시작---------------------------
		//---------------결제 결과 검증AJAX 호출
		else if(command.equals("PayValidationAjax.od")) {
			System.out.println(" C : /Pay.od 매핑");
			System.out.println(" C : AJAX 응답용");
			
			PayValidationAjax payValidatAction= new PayValidationAjax();
			payValidatAction.doProcess(request, response);
		}
		
		
		//-------------------Ajax 라인 끝--------------------
		
		if(forward !=null) {
			
			if(forward.isRedirect()) {
				System.out.println(" C : "+ forward.getPath()+"로, 이동방식 : sendRedirect()");
			
				response.sendRedirect(forward.getPath());
			}else {
				System.out.println(" C : "+ forward.getPath()+"로, 이동방식 : forward()");
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
		
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	
	
}
