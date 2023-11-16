<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="./rental/rental_css/rental.css" rel="stylesheet">

	<!-- header 시작 -->
	<header class="header">
		<div class="logo">
			<a href="./RentalMain.re"><img src="./main/img/SSB_gold.png" alt="SSB 로고"
				style="width: 200px;"></a>
		</div>
		<div class="fm">
			<form role="search" class="search-box"> <!--style="display: flex;"  -->
				<input class="search-input" type="text" placeholder="내 스타일 찾기" name="search"
					style="width: 80%;">
				<button type="submit" class="search-icon">
					<img width="38" height="38" src="./main/img/camping.png" alt="검색버튼" />
				</button>
			</form>
		</div>

			<!-- ID 세션값이 null 일때 보일 버튼 (로그아웃/ 비회원상태)-->
		<c:if test="${empty sessionScope.userId }">
			<div class="button-container">
				<button class="login-button"><a href="./MemberLogin.me">login</a></button>
				<a href="./cartList.ca"><button class="signup-button">
					<img width="20" height="15" src="./main/img/market.png" alt="장바구니" />cart
				</button></a>
			</div>
		</c:if>
		<!-- ID 세션값이 null 일때 보일 버튼 (로그아웃/ 비회원상태) -->

		<!-- ID 세션값이 있을때 보일 버튼(로그인 상태) -->
		<c:if test="${!empty sessionScope.userId && not fn:containsIgnoreCase(sessionScope.userId, 'admin')}">
			<div class="button-container">
				<button class="signup-button"><a href="./update.ud" style="white">My Page</a></button>
				<button class="signup-button">
				<img width="20" height="15" src="./main/img/redHeart.png" alt="하트" />
				<a href="#" > 찜</a></button>
				<button class="signup-button">
				<img width="20" height="15" src="./main/img/market.png" alt="장바구니" />
				<a href="#" > cart</a>
				</button>
				<button class="login-button"><a href="./MemberLogout.me">logout
				</a></button>
			</div>
		</c:if>
		<!-- ID 세션값이 있을때 보일 버튼 (로그인 상태) -->
		
		<!-- ID 세션값이 admin일때 보일 버튼 (관리자전용) -->
		<c:if test="${fn:containsIgnoreCase(sessionScope.userId, 'admin')}">
			<div class="button-container">
				<a style="background-color: transparent; margin-top:10px; " href="./AdminMain.ad">
				<img width="30" height="30" src="./main/img/admin.png" /></a>
			</div>
		</c:if>
		<!-- ID 세션값이 admin일때 보일 버튼 (관리자전용) -->
	</header>
	<!-- header 끝 -->
	
	
	<!-- 상단 메인 메뉴바 시작 -->
	<div class="menu">
		<div class="submenu">
			<a href="./RentalMain.re?category=캠핑"><b>Camping</b></a>
			<div class="submenu-content">
				<a href="#">세트</a><a href="#">텐트</a> <a href="#">테이블&의자</a> <a href="#">그늘막</a>
			</div>

		</div>
		<div class="submenu">
			<a href="./RentalMain.re?category=겨울스포츠"><b>Ski/SnowBoard</b></a>
			<div class="submenu-content">
				<a href="#">스키장비</a> <a href="#">보드장비</a> <a href="#">고글</a> <a href="#">장갑</a>
			</div>
		</div>

		<div class="submenu">
			<a href="./RentalMain.re?category=골프"><b>Golf</b></a>
			<div class="submenu-content">
				<a href="#">모자</a> <a href="#">상의</a> <a href="#">하의</a> <a href="#">원피스</a> <a href="#">신발</a>
			</div>
		</div>

		<div class="submenu">
			<a href="./Main.in"><b>For Buy</b></a>
		</div>
	</div>
	<!-- 상단 메인 메뉴바 끝 -->