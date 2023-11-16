<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>
<body>
	<h1>start.jsp</h1>
	
	MVC 프로젝트의 시작지점
	
	<% 
	    System.out.println(" MVC 프로젝트의 시작지점 ");  
	    System.out.println(" * MVC프로젝트에서 실행가능한 유일한 JSP 파일 ");  
	    System.out.println(" * 주소줄에 .jsp 호출X ");  
	
	    //response.sendRedirect("./Order.od");
	    //response.sendRedirect("./OrderSalePay.od");	// (실제) 판매아이템 주문
	    //response.sendRedirect("./OrderRefund.od");	// (실제) 환불	    
	  	//response.sendRedirect("./PayTest.od");
	  	//response.sendRedirect("./OrderTest.od");
	  	//response.sendRedirect("./realTest.od"); // (테스트) 주문 테스트
	  	//response.sendRedirect("./refundTest.od");	// (테스트) 환불 테스트
	  	response.sendRedirect("./AdOrderList.od");	// (테스트) 주문리스트
			
	%>
	
	
	
	
	
</body>
</html>