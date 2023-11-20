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

<style>
  @import url('https://fonts.googleapis.com/css2?family=Archivo&display=swap');
  @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
</style>

	
	
</head>
<body>
	<main style="width:1500px;  margin: 0 auto;" >
    <section>

			<form id="topBox" method="post" action="<c:url value='./ItemReserve.in'/>" >
			<input type = "hidden" name="item_id" value="${itemDTO.item_id}">
			<input type = "hidden" name="optID" value="${itemDTO.options_id}">
			
			
				<div class="leftBigBox">
					<div class="brandLogo"> 
					<img src="${pageContext.request.contextPath}/main/item_img/${itemDTO.item_img_logo}" alt="브랜드로고">
					</div>
					<img src="${pageContext.request.contextPath}/main/item_img/${itemDTO.item_img_main}" alt="상품이미지">
					<p></p>
					
				</div>


				<div class="rightBigBox">
				<br>
					<div class="category">홈 > <b>${itemDTO.category_sport}</b> > <b>${itemDTO.category_sub} (${itemDTO.category_major})</b> </div>
					<span class="Info_M">Product Info</span>
					<span class="Info_S"> No. ${itemDTO.item_id} </span>
					
					<p class="itemName">  ${itemDTO.item_name} </p>
					<p class="Info_S"> | ${itemDTO.category_brand} </p>
					

					<div class="detail">
					<ul>
						<li><span>판매가</span> <span class="r"> <b> <fmt:formatNumber value="${itemDTO.item_price }" />원 </b> </span></li>
						<li><span>적립금</span> <span class="r"> 500 P </span></li>
						<li><span>구매후기</span> 
							<span class="star"> 
								<c:forEach begin="1" end="4" step="1">
									<img width="20" height="20" src="${pageContext.request.contextPath}/rental/icon/star.png"/>
								</c:forEach>
									<img width="20" height="20" src="${pageContext.request.contextPath}/rental/icon/harfStar.png""/> 
									<a href="#review">&nbsp;4.5/5 <b>리뷰 426개</b> </a> 
							</span></li>
						<li><span>배송비</span> <span class="r">무료</span></li>
					</ul>
					</div>

					<div class="pick"> 
						<label> > ${itemDTO.options_name } </label>
						<select class="form-control" name="options_value" required="required">
        						<option value="" disabled selected>-[필수] 옵션을 선택해 주세요</option>
            				<c:forEach var="optList" items="${getOptList}" >
  								<option value="${optList.options_value}"> ${optList.options_value}</option>
							 </c:forEach>
   							 </select>
					</div> 
					<div class="pick"> 
						<label> > 수량 </label>
						<input class="form-control" id="number" type="number" max="10" min="1" placeholder="-[필수] 수량을 선택해 주세요" required > 
					</div>
					
					
					<button class="custom-btn btn-1" type="submit">BUY NOW</button>
					







					<div class="allegy"> <p>anjttkn</p> </div>


	
					</div> <!-- 2번째 -->




			</form>
			
			
<div id="midBox">
    <h2>PRODUCT IMAGE</h2>
    <p>본 상품은 본사 인증 정품입니다. 브랜드 공식 택과 A/S가 제공됩니다.</p>

    <div class="detailinfo showstep1">
        <div class="content">
            <img src="${pageContext.request.contextPath}/main/item_img/${itemDTO.item_img_sub}" alt="상세이미지">
        </div>
    </div>

    <div class="buttons">
        <button class="btn_open">더보기</button>
        <button class="btn_close hide">상세 이미지 접기</button>
    </div>
</div>






					
		<div id="board">
					
						<div class="reviews" id="review">
		<h2>REVIEW</h2>
		 <div class="container">
		  <table class="table table-sm">
		    <colgroup>
			  <col style="width:10%;" />
			  <col style="width:60%;" />
			  <col style="width:10%;" />
			  <col style="width:10%;" />
			  <col style="width:10%;" />
			</colgroup>
		    <thead>
		    <tr>
			  <th>평점</th>
		      <th>내용</th>
			  <th>작성자</th>
			  <th>조회수</th>
			  <th>작성일</th>
		    </tr>
		    </thead>
		    <tbody>
		     <tr>
		      <td>★★★★★</td>
		      <td>처음 이용해봤는데 너무 좋네요!</td>
		      <td>김철수</td>
		      <td>3</td>
		      <td>2023-11-15</td>
		     </tr> 
		    </tbody>
		  </table>
		 </div>		
		</div>
		
		
		
		<div class="questions">
		<h2>Q&A</h2>
		 <div class="container">
		  <table class="table table-sm">
		    <colgroup>
			  <col style="width:10%;" />
			  <col style="width:15%;" />
			  <col style="width:50%;" />
			  <col style="width:15%;" />
			  <col style="width:10%;" />
			</colgroup>		  
		    <thead>
		    <tr>
		      <th>답변상태</th>
			  <th>구분</th>
			  <th>제목</th>
			  <th>작성자</th>
			  <th>등록일</th>
		    </tr>
		    </thead>
		    <tbody class="heading">
		    <c:forEach var="bdto" items="${inquiryList }">
		     <tr>
		      <td>
		        <c:if test="${!empty bdto.answer_state }">
			     <font style="color: red;">${bdto.answer_state }</font>
			    </c:if>
			    <c:if test="${bdto.answer_state == null}">
			     답변예정
			    </c:if>
		      </td>
		      <td><c:out value="${bdto.inquiry_type }"/></td>
		      <td>
               <div class="panel-faq-container">
                <p class="panel-faq-title">${bdto.board_subject }</p>
               </div>
              </td> 
		      <td>${bdto.member_name }</td>
		      <td>${bdto.board_writeTime }</td>
		     </tr>
		     <tr>
		      <td colspan="5" width="100%" style="border-bottom: inherit;">
		       <div class="panel-faq-answer">
                <p style="text-align: left; margin: 10px 0px 0px 10px;">${bdto.board_content }</p>
               </div>
		      </td>
		     </tr>
		    </c:forEach>
		    </tbody>
		  </table>
		 </div>

		 <nav aria-label="Page navigation example">
  		   <ul class="pagination pagination-sm justify-content-center">
    	     <c:if test="${startPage > pageBlock }">
    	      <li class="page-item">
      		   <a class="page-link" href="./RentalItem.re?pageNum=${startPage-pageBlock }" aria-label="Previous">
        		<span aria-hidden="true">&laquo;</span>
      		   </a>
    	      </li>
      		 </c:if>  
    	     <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
    	      <li class="page-item">
    	        <a class="page-link" href="./RentalItem.re?pageNum=${i }">${i }</a>
    	      </li>
			 </c:forEach>
    	     <c:if test="${endPage < pageCount }">
    	      <li class="page-item">
    	       <a class="page-link" href="./RentalItem.re?pageNum=${startPage+pageBlock }" aria-label="Next">
    	         <span aria-hidden="true">&raquo;</span>
    	       </a>
    	      </li>
    	     </c:if> 
  		   </ul>
		 </nav>
		<div style="text-align: right; margin-right: 180px;">
	     <a class="btn btn-sm btn-dark rbtn" role="button" onclick="openPop()">작성하기</a>
		</div>
		</div>


		</div>

		</section>
    </main>



	<nav class="top">
		<a href="#">↑TOP</a>
	</nav>
    
    <footer>
    <div class="last">
	</div>    
    </footer>

	
	

	<script src="${pageContext.request.contextPath}/saleItem/itemD.js"></script>
	
</body>
</html>