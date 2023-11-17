
<%@page import="com.ssb.myPage.db.myPageDTO"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="./myPage/myPage.css" rel="stylesheet">
  	<link href="./main/main.css" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script type="text/javascript">
    // 기존 정보 표시 함수
    function populateExistingInfo() {
        var currentMember = <%= (myPageDTO)request.getAttribute("currentMember") %>;

        if (currentMember) {
            $("#member_user_id").val(currentMember.getMember_user_id());
            $("#member_name").val(currentMember.getMember_name());
            $("#member_birth").val(currentMember.getMember_birth());
            $("#member_gender").val(currentMember.getMember_gender());
            $("#member_email").val(currentMember.getMember_email());
            $("#member_phone").val(currentMember.getMember_phone());
            $("#member_regdate").val(currentMember.getMember_regdate());
            $("#member_payment").val(currentMember.getMember_payment());
            $("#member_point").val(currentMember.getMember_point());
            $("#member_grade").val(currentMember.getMember_grade());
        }
    }

    // 페이지 로딩 시 기존 정보 표시
    $(document).ready(function() {
        populateExistingInfo();
    });
</script>

<!-- 파비콘 -->
<link rel="shortcut icon" href="./favicon/favicon.ico">

 <script type="text/javascript">
    // 기존 정보 표시 함수
    function populateExistingInfo() {
        var currentMember = <%= (myPageDTO)request.getAttribute("currentMember") %>;

<<<<<<< Updated upstream
        if (currentMember) {
            $("#member_user_id").val(currentMember.getMember_user_id());
            $("#member_name").val(currentMember.getMember_name());
            $("#member_birth").val(currentMember.getMember_birth());
            $("#member_gender").val(currentMember.getMember_gender());
            $("#member_email").val(currentMember.getMember_email());
            $("#member_phone").val(currentMember.getMember_phone());
            $("#member_regdate").val(currentMember.getMember_regdate());
            $("#member_payment").val(currentMember.getMember_payment());
            $("#member_point").val(currentMember.getMember_point());
            $("#member_grade").val(currentMember.getMember_grade());
        }
=======
		<!-- 상단 메인 메뉴바 끝 -->
		<div class="content-container">
			<h1 style="text-align: left; font-weight: bold;">My Page</h1>


			<!-- 내용 수정된 부분 -->
			<div class="right-section">
				<button class="menu-toggle" onclick="toggleCategory()">메뉴이미지삽입</button>
				<div class="category-content m-2" id="categoryContent"
					style="display: none;">

					<div class="accordion accordion-flush" id="accordionFlushExample">
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
									aria-expanded="false" aria-controls="flush-collapseOne">
									<a href="update.ud"
										style="color: black; text-decoration: none;">정보수정</a>
								</button>
							</h2>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
									aria-expanded="false" aria-controls="flush-collapseTwo">
									<a href="ReviewList.rv"
										style="color: black; text-decoration: none;">후기작성</a>
								</button>
							</h2>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
									aria-expanded="false" aria-controls="flush-collapseThree">
									<a href="./location.lo"
										style="color: black; text-decoration: none;">배송지</a>
								</button>
							</h2>
						</div>
					</div>
				</div>
			</div>

			<script>
    function toggleCategory() {
        var categoryContent = document.getElementById("categoryContent");
        categoryContent.style.display = (categoryContent.style.display === 'none' || categoryContent.style.display === '') ? 'block' : 'none';
>>>>>>> Stashed changes
    }

    // 페이지 로딩 시 기존 정보 표시
    $(document).ready(function() {
        populateExistingInfo();
    });
</script>

</head>
<body>
  <!-- 헤더/ 상단메뉴바 영역 top.jsp 공통 페이지 사용 -->
<div class="header">
	<jsp:include page="../Mcommon/top.jsp" />
</div>
<!-- 헤더/ 상단메뉴바 영역 top.jsp 공통 페이지 사용 -->
	<!-- 상단 메인 메뉴바 끝 -->
	<div class="content-container">

    <h1>나의 정보</h1>

    <%
        myPageDTO currentMember = (myPageDTO) request.getAttribute("currentMember");
    %>

   <% if (currentMember != null) { %>
    <div style="display: flex;">
    <div style="width: 300px; margin-right: 10px; text-align: right; font-style: bold;" >
        <p style="font-size: 150px;"><%= currentMember.getMember_grade() %></p> <!-- 등급부분 -->
    </div>
	<div style="flex-grow: 1; text-align: left;" >
        <table style="margin: auto; text-align: left; width: 80%;">
            <tr>
                <td style="font-size: 40px;">ID:</td>
                <td style="font-size: 40px;"><%= currentMember.getMember_user_id() %></td>
            </tr>
            <tr>
                <td style="font-size: 40px;">이름:</td>
                <td style="font-size: 40px;"><%= currentMember.getMember_name() %></td>
            </tr>
            <tr>
                <td style="font-size: 40px;">생년월일:</td>
                <td style="font-size: 40px;"><%= currentMember.getMember_birth() %></td>
            </tr>
            <tr>
                <td style="font-size: 40px;">성별:</td>
                <td style="font-size: 40px;"><%= currentMember.getMember_gender() %></td>
            </tr>
            <tr>
                <td style="font-size: 40px;">이메일:</td>
                <td style="font-size: 40px;"><%= currentMember.getMember_email() %></td>
            </tr>
            <tr>
                <td style="font-size: 40px;">전화번호:</td>
                <td style="font-size: 40px;"><%= currentMember.getMember_phone() %></td>
            </tr>
            <tr>
                <td style="font-size: 40px;">가입일시:</td>
                <td style="font-size: 40px;"><%= currentMember.getMember_regdate() %></td>
            </tr>
            <tr>
                <td style="font-size: 40px;">적립금:</td>
                <td style="font-size: 40px;"><%= currentMember.getMember_payment() %></td>
            </tr>
            <tr>
                <td style="font-size: 40px;">포인트:</td>
                <td style="font-size: 40px;"><%= currentMember.getMember_point() %></td>
            </tr>
        </table>
        
    </div>
</div>


<% } else { %>
    <p>현재 로그인된 계정 정보가 없습니다.</p>
<% } %>

<div>
    <button class="login-button"><a href="update.ud" style="color:black;">정보 수정</a></button>
</div>

<span>
    <button class="withdrawal-button"><a href="#" style="color:black;">회원 탈퇴</a></button>
</span>
</div>


</body>
</html>
