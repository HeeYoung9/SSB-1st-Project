<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>start.jsp</title>
</head>
<body>
	<h1>start.jsp</h1>
	MVC 프로젝트의 시작지점
	<%
		System.out.println( " \n\n\n 프로젝트를 시작합니다 "); 
	
		response.sendRedirect("./ItemMgt.bo");
	%>
</body>
</html>