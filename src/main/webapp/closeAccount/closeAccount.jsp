<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../main/main.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link href="./closeAccount/closeAccount.css" rel="stylesheet">
</head>
<body>
	<h1>closeAccount.jsp</h1>
<%-- 	<jsp:include page="../Mcommon/top.jsp"></jsp:include> --%>
	
	<!-- section 시작 -->
    <section class="section">
       	<div id="withdrawalForm">
        	<h2>탈퇴 사유 선택</h2>
	        <form action="./MemberCloseAccountAction.me" id="reasonForm">
	            <label for="withdrawalReason">탈퇴 사유:</label>
	            <select id="withdrawalReason" name="withdrawalReason">
	                <option value="personalReason">개인적인 이유</option>
	                <option value="betterService">다른 서비스 이용 중</option>
	                <option value="technicalIssues">기술적인 문제</option>
	                <option value="other">기타</option>
	            </select>
	
	            <button type="button" onclick="confirmCloseAccount()">탈퇴하기</button>
        		<button type="button" style="margin-left: 10%" onclick="location.href='./Main.in'">취소</button>
	        </form>
    	</div>
    </section>
    <!-- section 끝  -->

    <!-- footer 시작 -->
    <footer class="footer">
        <p>&copy; 2023 SSB Style</p>
    </footer>
    <!-- footer 끝 -->
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="./closeAccount/closeAccount.js"></script>
</body>
</html>