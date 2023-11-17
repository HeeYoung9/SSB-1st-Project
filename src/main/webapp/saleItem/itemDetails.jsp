<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SSB 상품 상세</title>
<!----------- Bootstrap CSS ----------->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<!------------ common CSS ------------->
<link rel="stylesheet" href="${pageContext.request.contextPath}/saleItem/itemD.css">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/Mcommon/top.css"> --%>
<!-------------- jQuery --------------->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="crossorigin="anonymous"></script>
<!------------- 공통 헤더 ------------->
	<div class="header">
	<c:import url="../Mcommon/top.jsp" charEncoding="UTF-8"/>
	</div>
	
	
</head>
<body>
	<main style="width:1500px;" >
    <section>

			<form class="item_container" id="one" method="get" action="<c:url value='./ItemReserve.in'/>">

				<div class="first">
					<p class="gray"> 
					<img src="${pageContext.request.contextPath}/main/item_img/${itemDTO.item_img_logo}" alt="브랜드로고">
					</p>
					<img src="${pageContext.request.contextPath}/main/item_img/${itemDTO.item_img_main}" alt="상품이미지">
					<p class="detail1">본 상품은 본사 인증 정품입니다. 브랜드 공식 택과 A/S가 제공됩니다.</p>
				</div>
					${itemDTO.item_img_logo}
					${itemDTO.item_img_main}

				<div class="second">
					<br>
					<p class="gray">홈 > 스포츠 > <b>${itemDTO.category_sport}</b> </p>

					<div id="fifth">
						<div class="rara">
							<p class="Info_m">Product Info</p>
							<p class="Info_s">제품 정보</p>
						</div>
						<div id="heart2">
							<a href="#"><i class="far fa-heart" id="heart3"></i></a>
						</div>
					</div>

					<input type = "hidden" name="item_id" value=${itemDTO.item_id}>
					<input type = "hidden" name="optID" value=${itemDTO.options_id}>

					<p class="detail1">와 진짜 이쁘다 꼭 사야겠다 춥다 정말 춥다</p>



					<div class="detail3">
						<div class="boxone">
							<ul>
								<li><span class="l">브랜드</span> <span>${itemDTO.category_brand}</span class="r"></li>
								<li><span class="l">구분</span> <span>${itemDTO.category_sub} ( ${itemDTO.category_major} )</span class="r"></li>
								<li><span class="l">설명</span> <span>오~</span class="r"></li>
							</ul>
						</div>

						<div class="boxtwo">
							<ul>
								<ul>
									<li><span class="l">판매가</span> <span> <fmt:formatNumber value="${itemDTO.item_price }" />원 </span class="r"></li>
									<li><span class="l">설명</span> <span>오~</span class="r"></li>
									<li><span class="l">배송비</span> <span>무료</span class="r"></li>
								</ul>
						</div>

					</div>


					수량 : <input type="number" max="5" min="1" >
					<div class="detail2">
						<span>${itemDTO.options_name }</span> 
						<span>
							<select class="options-select" name="options_value" required>
            					<c:forEach var="optList" items="${getOptList}">
  									<option value="${optList.options_id}" label="${optList.options_value}"></option>
								</c:forEach>
							</select> 
						</span>
					</div>
					
					


					<div class="detail2">
						<button class="reserve-button" type="submit">구매하기</button>
						<button class="cart" type="button">cart담기</button>
					</div>




					<div class="allegy"> <p>리뷰 별점: 4.5/5 ( )</p> </div>

					<p class="rev">리뷰게시판</p>

					<div class="All">
						<div class="bee">
							<span class="iii">도도도</span> <span class="mmm">레레레</span>
							<a href="#" class="rec"><i class=""></i></a>
						</div>

						<div class="bee">
							<span class="iii">미미미</span> <span class="mmm">파파파</span>
							<a href="#" class="rec"><i class=""></i></a>
						</div>

						<div class="bee">
							<span class="iii">솔솔솔</span> <span class="mmm">라라라</span>
							<a href="#" class="rec"><i class=""></i></a>
						</div>
					</div> <!-- All -->

					<input text="" placeholder="" class="rev_c">
	
					</div> <!-- 2번째 -->



			</form>
			
									
	
				<div class="">
					<h2>PRODUCT IMAGE</h2>
					<img src="${pageContext.request.contextPath}/main/item_img/${itemDTO.item_img_sub}" alt="상세이미지">
				</div>


				<div class="questions">
					<h2>문의 게시판</h2>
				</div>



		</section>
    </main>
    
    <footer>
    <div class="last">
	</div>    
    </footer>

	
	
	<nav class="top">
		<a href="#">↑TOP</a>
	</nav>

	<script src="../saleItem/js/itemD.js"></script>
	
</body>
</html>