<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="com.ssb.adItem.db.ItemDAO"%>
<%@ page import="com.ssb.adItem.db.ItemDTO"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SSB 상품 등록</title>

<!----- Bootstrap CSS ---->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-------  jQuery  ------->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<!------ common CSS  ----->
<link rel="stylesheet" href="${pageContext.request.contextPath}/adItem/css/itemMgt.css">

<style>
</style>
</head>

<body>

	<c:set var="CategoryList" value="<%=new com.ssb.adItem.db.ItemDAO().getCategoryList()%>" />

	<form class="validation-form" action="./ItemAddAction.it" method="post" novalidate style="width:1500px; margin-bottom: 60px;" align="center">

		<div class="container">
				<div class="add-form col-md-12 mx-auto">


						<h4 class="addTitle">상품 등록</h4>
							
							
						<div class="row" >
							<div class="Add-A">
								<!-- <label for="code">상품 구분</label> --> 
									<select class="custom-select" name="category_code" required>
										<!-- <option value="" disabled selected>&nbsp;분류</option> -->
										<option value="1" selected>판매</option>
										<!-- <option >렌탈</option> -->
									</select>
							</div>

						
						</div>

						<!---------------------------------------------------------------------------------------------->
						<BR>

						<div class="row" >
        						<label for="category" class="c_label">카테고리 설정</label>
   							<div class="Add-C">
       								<select class="custom-select" name="category_sport"  required>
            						<c:forEach var="category" items="${CategoryList}" >
                						<option value="${category.category_sport}">${category.category_sport}</option>
            						</c:forEach>
                						<option value="" disabled selected>스포츠</option>
        							</select>

        							<select class="custom-select" name="category_major" id="m_jump" required>
            						<c:forEach var="category" items="${CategoryList}">
                						<option value="${category.category_major}">${category.category_major}</option>
            						</c:forEach>
                						<option value="" disabled selected>대분류</option>
        							</select>

        							<select class="custom-select" name="category_sub" id="s_jump" required>
            						<c:forEach var="category" items="${CategoryList}">
                						<option value="${category.category_sub}">${category.category_sub}</option>
            						</c:forEach>
                						<option value="" disabled selected>소분류</option>
        							</select>

        							<select class="custom-select" name="category_brand" id="b_jump" required>
            						<c:forEach var="category" items="${CategoryList}">
                						<option value="${category.category_brand}">${category.category_brand}</option>
            						</c:forEach>
                						<option value="" disabled selected>브랜드</option>
        							</select>
    						</div>
						</div>
						
						
						<!---------------------------------------------------------------------------------------------->

						
						<div class="row">
							<div class="Add-B">
								<label for="name">상품명</label> 
									<input type="text" class="form-control" name="item_name" placeholder="" value="" required>
										<div class="invalid-feedback">상품명을 입력해주세요.</div>
							</div>
							
							<div class="Add-D">
								<label for="item">상품 가격</label> 
									<input type="text" class="form-control" name="item_price" placeholder="" required>
										<div class="invalid-feedback">값을 입력해주세요.</div>
							</div>
						</div>

						
						<!---------------------------------------------------------------------------------------------->
						<BR>


						<div class="row">
							<div class="filebox">
									<input class="upload-main" value="" placeholder="&nbsp;&nbsp;상품의 대표 이미지" required> 
								<label for="img_main">파일찾기</label> 
									<input type="file" id="img_main" name="item_img_main" accept="image/*" required>
										<div class="invalid-feedback">썸네일용 이미지가 필요해요.</div>
							</div>

							<div class="filebox">
									<input class="upload-sub" value="" placeholder="&nbsp;&nbsp;상품 설명 이미지" required>
										<div class="invalid-feedback">상품 설명 이미지가 필요해요.</div>
								<label for="img_sub">파일찾기</label> 
									<input type="file" id="img_sub" name="item_img_sub" accept="image/*" required>
							</div>

							<div class="filebox">
									<input class="upload-logo" value="" placeholder="&nbsp;&nbsp;브랜드 로고">
								<label for="img_logo">선택사항</label> 
									<input type="file" id="img_logo" name="item_img_logo" accept="image/*">
							</div>
						</div>


						<BR>
						<hr class="mc">
						<!---------------------------------------------------------------------------------------------->
						<BR>


						<div class="row">
							<div class="Add-G"> 
							<label for="name">옵션명</label> 
								<input type="text"class="form-control" name="options_name" placeholder="size, color, Etc" value="" required>
									<div class="invalid-feedback">옵션명을 입력해주세요.</div>
							</div>

							<div class="Add-H">
								<label for="name">옵션값</label> <input type="text" class="form-control" name="options_value" placeholder="" value="" required>
									<div class="invalid-feedback">옵션값을 입력해주세요.</div>
							</div>
						</div>

						<div class="row">
							<div class="Add-E">
							<label for="item">잔여 재고</label> 
								<input type="text" class="form-control" name="options_quantity" placeholder="" required>
									<div class="invalid-feedback">재고 수량을 입력해주세요.</div>
							</div>

						<!-- 	<div class="Add-F">
							<label for="item">옵션추가금</label> 
								<input type="text" class="form-control" placeholder="" disabled="disabled">
									<div class="invalid-feedback">브랜드명을 입력해주세요.</div>
							</div> -->
						</div>






						<!---------------------------------------------------------------------------------------------->
						<hr class="mc">
						<input type="submit" value="등록">

						</div>
		
			</div>

	<footer class="my-3 text-center text-small">
		<p class="mb-1">&copy; 2023 SSB</p>
	</footer>

	</form>

	<script src="${pageContext.request.contextPath}/adItem/js/item.js"></script>

</body>
</html>
