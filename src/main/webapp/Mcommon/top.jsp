<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<!-- header 시작 -->
	<header class="header">
		<div class="logo">
			<a href="./Main.in"><img src="./main/item_img/SSB_gold.png"
				style="width: 200px;"></a>
		</div>
		<div class="fm">
			<form role="search" class="search-box" action="./Main.in"> <!--style="display: flex;"  -->
				<input class="search-input" type="text" placeholder="내 스타일 찾기" name="search"
					style="width: 80%;">
				<button type="submit" class="search-icon">
					<img width="38" height="38" src="./main/img/hoodie.png" alt="검색버튼" />
				</button>
			</form>
		</div>

		<!-- ID 세션값이 null 일때 보일 버튼 (로그아웃/ 비회원상태)-->
		<c:if test="${empty sessionScope.userId }">
			<div class="button-container">
				<button style="background-color: transparent; border:none;"><a href="./AdminMain.ad" style="color:white; opacity: 0.3">admin</a></button>
				<button class="login-button"><a href="./MemberLogin.me" style="color:white;">login</a></button>
				<button class="signup-button">
					<img width="20" height="15" src="./main/img/market.png" alt="장바구니" />cart
				</button>
			</div>
		</c:if>
		<!-- ID 세션값이 null 일때 보일 버튼 (로그아웃/ 비회원상태) -->

		<!-- ID 세션값이 있을때 보일 버튼(로그인 상태) -->
		<c:if test="${!empty sessionScope.userId && not fn:containsIgnoreCase(sessionScope.userId, 'admin')}">
			<div class="button-container">
				<button class="signup-button"><a href="./update.ud">My Page</a></button>
				<button class="signup-button">
				<img width="20" height="15" src="./main/img/redHeart.png" alt="하트" /> 찜</button>
				<button class="signup-button">
				<img width="20" height="15" src="./main/img/market.png" alt="장바구니" /> cart
				</button>
				<button class="login-button"><a href="./MemberLogout.me" style="color:white;">logout
				</a></button>
			</div>
		</c:if>
		<!-- ID 세션값이 있을때 보일 버튼 (로그인 상태) -->
		
		<!-- ID 세션값이 admin일때 보일 버튼 (관리자전용) -->
		<c:if test="${fn:containsIgnoreCase(sessionScope.userId, 'admin')}">
			<div class="button-container">
				<a style="background-color: transparent; margin-top:10px; " href="./AdminMain.ad">
				<img width="30" height="30" src="./main/img/admin.png" />관리자</a>
			</div>
		</c:if>
		<!-- ID 세션값이 admin일때 보일 버튼 (관리자전용) -->
		
	</header>
	<!-- header 끝 -->
	
		<!-- 상단 메인 메뉴바 시작 -->
	<div class="menu">
		<div class="submenu">
			<a href="./Main.in"><b>New arrival</b>l</a>
			<div class="submenu-content">
				<a href="./Main.in">전체보기</a> <a href="./Main.in">베스트</a> <a href="./Main.in">추천제품</a>
			</div>

		</div>
		<div class="submenu">
			<a href="./Main.in"><b>Sports</b></a>
			<div class="submenu-content">
				<a href="./Main.in?category=골프">골프</a> <a href="./Main.in?category=테니스">테니스</a> <a href="./Main.in?category=런닝">런닝</a> 
				<a href="./Main.in?category=농구">농구</a> <a href="./Main.in?category=축구">축구</a>
				<a href="./Main.in?category=요가필라테스">요가/필라테스</a><a href="./Main.in?category=겨울스포츠">겨울스키/보드</a> 
				<a href="./Main.in?category=헬스">헬스</a> <a href="./Main.in?category=수영">수영</a> 
				<a href="./Main.in?category=기타">기타</a>
			</div>
		</div>

		<div class="submenu">
			<a href="./Main.in?category_major=의류"><b>Clothing</b></a>
			<div class="submenu-content">
				<a href="#">전체보기</a> 
				<a href="./Main.in?category_sub=아우터">아우터</a>
				 <a href="./Main.in?category_sub=상의">상의</a>
				  <a href="./Main.in?category_sub=하의">하의</a>
			</div>
		</div>

		<div class="submenu">
			<a href="./Main.in?category_major=신발"><b>Shoes</b></a>
			<div class="submenu-content">
				<a href="#">실내스포츠</a> <a href="#">액티비티</a> <a href="#">릴렉스</a>
			</div>
		</div>

		<div class="submenu">
			<a href="./Main.in?category_major=악세사리"><b>Accessories</b></a>
			<div class="submenu-content">
				<a href="#">모자</a> <a href="#">양말</a>
			</div>
		</div>

		<div class="submenu">
			<a href="./Main.in?category_major=용품"><b>Sport Item</b></a>
			<div class="submenu-content">
				<a href="#">전체보기</a> <a href="#">가방</a> <a href="#">라켓</a> <a href="#">기타</a>
			</div>
		</div>

		<div class="submenu">
			<a href="./RentalMain.re"><b>For rental</b></a>
			<div class="submenu-content">
				<a href="./RentalMain.re?category=골프">골프</a>
				<a href="./RentalMain.re?category=캠핑">캠핑</a>
				<a href="./RentalMain.re?category=겨울스포츠">겨울스포츠</a>
			</div>
		</div>
	</div>
	<!-- 상단 메인 메뉴바 끝 -->