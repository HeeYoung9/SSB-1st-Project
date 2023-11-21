package com.ssb.cart.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;
import com.ssb.cart.db.cartDAO;
import com.ssb.cart.db.cartDTO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class insertCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("action");
		// 정보저장
		//int member_id = Integer.parseInt((String)request.getSession().getAttribute("member_id"));
		int member_id = 1006;
		JSONParser parser = new JSONParser();
		ArrayList<cartDTO> dtoArray = new ArrayList<cartDTO>();
		cartDTO dto = null;
		try {
			JSONArray arr = (JSONArray) parser.parse(request.getParameter("arr"));
			for (int i = 0; i < arr.size(); i++) {
				JSONObject obj = (JSONObject) arr.get(i);
				dto = new cartDTO();
				dto.setItem_id(Integer.parseInt((String)obj.get("item_id"))); 
				dto.setCart_quantity(Integer.parseInt((String)obj.get("cart_quantity"))) ;
				dto.setOptions_id(Integer.parseInt((String)obj.get("options_id"))); 
				System.out.println(dto.getItem_id());
				System.out.println(dto.getCart_quantity());
				System.out.println(dto.getOptions_id());
				dtoArray.add(dto);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		//액션으로 만들기
		System.out.println("member_id : " + member_id);
		cartDAO dao = new cartDAO();
		//정보처리
		int result = dao.insertCart(member_id,dtoArray);
		Gson gson = new Gson();
		String json = gson.toJson(result);
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(json);

		return null;
	}

}
