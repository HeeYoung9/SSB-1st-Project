<%@page import="com.ssb.myPage.db.myPageDTO"%>
<%@page import="com.google.gson.Gson"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="./myPage/myPage.css" rel="stylesheet">
<link href="./main/main.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="path/to/order-list-styles.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
        
        // 메뉴 토글 함수
        function toggleMenu() {
            $(".category-buttons").slideToggle();
        }
        
    </script>

<!-- 파비콘 -->
<link rel="shortcut icon" href="./favicon/favicon.ico">
</head>
<body>
	<!-- 헤더/ 상단메뉴바 영역 top.jsp 공통 페이지 사용 -->
	<div class="header">
		<jsp:include page="../Mcommon/top.jsp" />

		<!-- 헤더/ 상단메뉴바 영역 top.jsp 공통 페이지 사용 -->

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
    }
</script>




			<% myPageDTO currentMember = (myPageDTO) request.getAttribute("currentMember"); %>

			<% if (currentMember != null) { %>
			<div style="display: flex;">
				<div
					style="width: 300px; margin-right: 10px; text-align: right; font-style: bold;">
					<p style="font-size: 150px;"><%= currentMember.getMember_grade() %></p>
					<!-- 등급부분 -->
				</div>
				<div style="flex-grow: 1; text-align: left;">
					<table style="margin: auto; text-align: left; width: 80%;">
						<tr>
							<td style="font-size: 20px;">ID:</td>
							<td style="font-size: 20px;"><%= currentMember.getMember_user_id() %></td>
						</tr>
						<tr>
							<td style="font-size: 20px;">이메일:</td>
							<td style="font-size: 20px;"><%= currentMember.getMember_email() %></td>
						</tr>
						<tr>
							<td style="font-size: 20px;">전화번호:</td>
							<td style="font-size: 20px;"><%= currentMember.getMember_phone() %></td>
						</tr>
						<tr>
							<td style="font-size: 20px;">가입일시:</td>
							<td style="font-size: 20px;"><%= currentMember.getMember_regdate() %></td>
						</tr>
						<tr>
							<td style="font-size: 20px;">적립금:</td>
							<td style="font-size: 20px;"><fmt:formatNumber
									value="${currentMember.getMember_payment() }" /> 원</td>
						</tr>
						<tr>
							<td style="font-size: 20px;">포인트:</td>
							<td style="font-size: 20px;"><fmt:formatNumber
									value="${currentMember.getMember_point() }" /> Point</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="search-bar-container"
				style="width: 80%; margin: 20px auto; text-align: center;">
				<form action="./AdOrderList.od" method="get" class="search-bar"
					style="display: inline-block;">
					<h2 style="display: inline-block; margin-right: 20px;">주문 내역</h2>
					<select name="orders_state" class="form-select"
						aria-label="Default select example"
						style="width: 80%; float: left;">
						<option value="PURCHASE">결제상품</option>
						<option value="DETERMINE">구매확정 상품</option>
						<option value="REFUND">환불된 상품</option>
						<option value="CANCEL">취소된 상품</option>
					</select> <input type="submit" value="검색" id="searchButton "
						style="float: left;"></input>
				</form>
			</div>

			<table class="order-table" style="width: 80%; margin: 0 auto;">
				<thead>
					<tr>
						<th>주문번호</th>
						<th>주문날짜</th>
						<th>상태</th>
						<th>가격</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${orderList}">
						<tr>
							<td>${dto.orderD_id}</td>
							<td>${dto.orders_state}</td>
							<td>${dto.orders_sort})</td>
							<td>${dto.orders_date}</td>
							<td>${dto.total_price}</td>
							<td>
								<button class="edit-button"
									onclick="location.href='./AdOrderDetail.od?orders_id=${dto.id}'">상세보기</button>
							<button id="editButton">취소하기</button></td>
							
							<td>
								<button class="cancel-button" onclick="cancelOrder(${dto.id})">주문
									취소</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


			<% } else { %>
			<p>현재 로그인된 계정 정보가 없습니다.</p>
			<% } %>



			<span>
				<button class="withdrawal-button">
					<a href="./MemberCloseAccount.me" style="color: black;">회원 탈퇴</a>
				</button>
			</span>
		</div>
</body>
</html>
