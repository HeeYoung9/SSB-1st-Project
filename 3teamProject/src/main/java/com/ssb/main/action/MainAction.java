package com.ssb.main.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MainAction_execute() 호출! ");
		
		// 추후 메인페이지의 사진/이름/가격정보를 디비에서 연결해야함!
		
		return null;
	}

}
