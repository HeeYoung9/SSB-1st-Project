package com.ssb.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class JSMoveFunction {

	// alert + location.href 기능
	public static void alertLocation(HttpServletResponse response, 
										String msg,
										String url) {
		System.out.println("JSMoveFunction_alertLocation() 호출");
			
		try {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('"+msg+"');");
			out.println("location.href='"+url+"';");			
			out.println("</script>");
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}	
		
	// alert + history.back() 기능
	public static void alertBack(HttpServletResponse response,
									String msg) {
		System.out.println("JSMoveFunction_alertBack() 호출");
			
		try {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('"+msg+"');");
			out.println("history.back();");			
			out.println("</script>");
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
		
}