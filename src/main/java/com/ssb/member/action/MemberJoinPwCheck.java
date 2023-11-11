package com.ssb.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class MemberJoinPwCheck implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : MemberJoinPwCheck_execute() 호출");
		
		// 정보 저장
		String member_pw = request.getParameter("userPw");
//		String result = "";
//		
		PrintWriter out = response.getWriter();
//		
//		if(member_pw.matches("^[a-zA-Z]$")) { // 대소문자
//			System.out.println("대소문자 포함!");
//			result = "1";
//		}else if(member_pw.matches("^[0-9]$")) { // 숫자
//			System.out.println("숫자 포함!");
//			result = "2";
//		}else if(member_pw.matches("^[a-zA-Z]$")) { // 특수문자
//			System.out.println("특수문자 포함!");
//			result = "3";
//		}else if(member_pw.length()>=8 || member_pw.length()<=20) { // 8~20자 이내
//			System.out.println("8~20자 이내 충족!");
//			result = "4";
//		}else {
//			System.out.println("예외 경우 발생!");
//		}
		
		boolean containsAlphabetCase = member_pw.matches(".*[a-zA-Z].*"); // 대소문자
		boolean containsNumber = member_pw.matches(".*\\d.*");	// 숫자
		boolean containsSpecialChar = member_pw.matches(".*[!@#$%^&*()_\\-+=].*"); // 특수문자
		boolean isLength= member_pw.length() >= 8 && member_pw.length() <= 20; // 8~20자 이내

		// 대소문자, 숫자, 특수문자, 8~20자 이내 여부를 체크
		int result = 0;
		
		// 1개 해당
		if (containsAlphabetCase) result=1;
		if (containsNumber) result=2;
		if (containsSpecialChar) result=3;
		if (isLength) result=4;

		// 2개 해당
		if (containsAlphabetCase && containsNumber) result=5;
		if (containsAlphabetCase && containsSpecialChar) result=6;
		if (containsAlphabetCase && isLength) result=7;
		if (containsNumber && containsSpecialChar) result=8;
		if (containsNumber && isLength) result=9;
		if (containsSpecialChar && isLength) result=10;

		// 3개 해당
		if (containsAlphabetCase && containsNumber && containsSpecialChar) result=11;
		if (containsAlphabetCase && containsNumber && isLength) result=12;
		if (containsAlphabetCase && containsSpecialChar && isLength) result=13;
		if (containsNumber && containsSpecialChar && isLength) result=14;

		// 4개 해당
		if (containsAlphabetCase && containsNumber && containsSpecialChar && isLength) result=15;
		
		System.out.println("result :"+result);
		
		
		out.write(result+"");
		
		
		return null;
	}

}
