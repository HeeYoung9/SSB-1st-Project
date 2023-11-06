package com.ssb.util;

/**
 * 
 * ActionForward - 페이지 이동에 필요한 정보를 저장하는 객체 (기차표-티켓)
 *   이동할 주소 path												(목적지)
 *   이동할 방식 isRedirect - true  : sendRedirect() 방식으로 이동  (직행 or 환승)
 *   								  가상 -> 가상 (주소변경o, 화면변경o)
 *   						- false : forward() 방식으로 이동
 *   								  가상 -> 실제 (주소변경x, 화면변경)
 *
 */

public class ActionForward {
	
	private String path;
	private boolean isRedirect;
	
	
	public ActionForward() {
		System.out.println("\n----------------------------------");
		System.out.println("\t 티켓정보 생성");
		System.out.println("\t 목적지 x, 방식 x");
		System.out.println("----------------------------------\n");
	}
	
	
	// alt shift s + r  (get/set)
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
		//boolean 타입의 변수명에 is가 있으면 get을 대신함.
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
		//boolean 타입의 변수명에 is가 있으면 is를 지우고, set을 표기.
	}
	
	
	// alt shift s + s
	@Override
	public String toString() {
		return "ActionForward(티켓) [path(목적지)=" + path + ", isRedirect=(방법)" + isRedirect + "]";
	}
	
	
	
	
	
}