package com.ssb.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.util.Action;
import com.ssb.util.ActionForward;

@WebServlet("*.bo")
public class BoardFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C: BoardFrontController_doProcess() 호출");
		
		/****************************** 1. 가상주소 계산 시작 ****************************/
		String requestURI = request.getRequestURI();
		System.out.println("requestURI: " + requestURI);
		String CTXPath = request.getContextPath();
		System.out.println("CTXPath: " + CTXPath);
		String command = requestURI.substring(CTXPath.length());
		System.out.println("command: " + command);		
		/****************************** 1. 가상주소 계산 끝 ******************************/
		
		
		/****************************** 2. 가상주소 매핑 시작 ****************************/
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("")) {
			
		}
		
		
		/****************************** 2. 가상주소 매핑 끝 ******************************/
		
		
		/****************************** 3. 가상주소 이동 시작 ****************************/
		
		/****************************** 3. 가상주소 이동 끝 ******************************/
	}
	
	
	
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\nC: BoardFrontController_doGet() 호출");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\nC: BoardFrontController_doPost() 호출");
		doProcess(request, response);
	}
	
}