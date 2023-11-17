package com.ssb.order.service;

import java.util.List;

import com.ssb.cart.db.cartDTO;
import com.ssb.option.db.optionsDAO;
import com.ssb.option.db.optionsDTO;
import com.ssb.order.exception.StockLackException;
import com.ssb.order.vo.OrderCheckState;

public class OrderService {

	public  static OrderCheckState stockCheck(List<cartDTO> cartItems) throws StockLackException {
		
		OrderCheckState orderCheckState = OrderCheckState.STANDBY; 
		
		System.out.println("[stockCheck] cartItems 사이즈 : " + cartItems.size());
		
		System.out.println(cartItems.get(0).getItem_id());
		System.out.println(cartItems.get(0).getOptions_id());
		
		for(cartDTO cartDTO : cartItems) {
			
			optionsDTO optionsDTO = new optionsDTO();
			optionsDAO optionsDAO = new optionsDAO();
			
			optionsDTO = optionsDAO.findById(cartDTO.getOptions_id());
			
			System.out.println("stockCheck : options의 값 : "+ optionsDTO.getOptions_id());
			System.out.println("stockCheck : options의 수량 : "+ optionsDTO.getOptions_quantity());
			
			System.out.println("OrderService : 아이템 ID : "+cartDTO.getItem_id());
			System.out.println("OrderService : 옵션 ID : "+cartDTO.getOptions_id());
			System.out.println("OrderService : 구매희망 수량 : "+cartDTO.getCart_quantity());
			
			if(cartDTO.getCart_quantity()> optionsDTO.getOptions_quantity()) {
				
				System.out.println("stockCheck : cartDTO의 수량 : " + cartDTO.getCart_quantity());
				System.out.println("stockCheck : itemDTO의 수량 : " + optionsDTO.getOptions_quantity());
				orderCheckState = OrderCheckState.LOQ;
				throw new StockLackException("수량이 부족합니다.");		
			}else {
				orderCheckState = OrderCheckState.PASS;
			}
		}
		
		
		return orderCheckState;
		
	}
	
	
}
