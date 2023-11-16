<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<script type="text/javascript">
	function toggleCategory() {
		var categoryContent = document.querySelector('.category-content');
		var brandContent = document.querySelector('.brand-content');

		categoryContent.style.display = 'block';
		brandContent.style.display = 'none';
	}

	function toggleBrand() {
		var categoryContent = document.querySelector('.category-content');
		var brandContent = document.querySelector('.brand-content');

		categoryContent.style.display = 'none';
		brandContent.style.display = 'block';
	}
</script>

<!-- 상단 메뉴바 오픈 및 영역 확장 -->
<script>
	document.addEventListener("DOMContentLoaded", function() {

		const submenus = document.querySelectorAll(".menu .submenu");
		const submenuContents = document.querySelectorAll(".submenu-content");

		submenus.forEach(function(submenu, index) {
			const submenuContent = submenuContents[index];

			// 메뉴 항목을 호버할 때
			submenu.addEventListener("mouseover", function() {
				// 해당 메뉴 항목의 하위 메뉴가 표시되면 메뉴의 높이를 조절
				submenuContent.style.display = "block";
				submenu.style.height = submenuContent.clientHeight + "px";
			});

			// 메뉴 항목에서 마우스가 나갈 때
			submenu.addEventListener("mouseout", function() {
				// 해당 메뉴 항목의 하위 메뉴가 숨겨지면 메뉴의 높이를 원래대로 복원
				submenuContent.style.display = "none";
				submenu.style.height = "auto";
			});
		});
	});
</script>


<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SSB Layout</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link href="./main/main_css/main.css" rel="stylesheet">

  <!-- 파비콘 -->
<link rel="shortcut icon" href="./favicon/favicon.ico">
</head>
<body>
    <!-- 헤더/ 상단메뉴바 영역 top.jsp 공통 페이지 사용 -->
<div class="header">
	<jsp:include page="../Mcommon/top.jsp" />
</div>
<!-- 헤더/ 상단메뉴바 영역 top.jsp 공통 페이지 사용 -->


	<!-- section 시작 -->

	<section class="section" style="margin:5%;">

		<!-- 본인 페이지에 맞게 수정하려면 여기 아래서부터 삭제하고, 새로 만들면 됩니다. 혹시 문제 생기면 섹션까지 삭제 해보는거 추천!!!!-->

		<!-- left-container 시작 -->
		<div class="left-container" style="margin: 5%; width: 60%;">
			<div class="col-md-7 col-lg-8">
				<h4 class="mb-3">결제 정보</h4>
				<hr>
				<h4 class="mb-3">구매 상품 정보</h4>
				<table class="table table-dark table-striped">
					<thead>
						<tr>
							<th scope="col">No.</th>
							<th scope="col">상품명</th>
							<th scope="col">가격</th>
							<th scope="col">수량</th>
							<th scope="col">총 가격</th>
							
						</tr>
					</thead>
					<tbody>
					<c:forEach var="item" items="${requestScope.orderDDTOs}">
						<tr>
							<td>${item.orderD_id}</td>
							<td>${item.item_name }</td>
							<td>${item.price}</td>
							<td>${item.quantity}</td>
							<td>${item.totalPrice}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>

				<hr>
				<h4 class="mb-3">결제 수단</h4>
				
				<input type="radio" class="btn-check" name="paymentOption" id="option1" autocomplete="off" value="naverPay">
				<label class="btn btn-secondary" for="option1">다날 휴대폰 결제</label>

				<input type="radio" class="btn-check" name="paymentOption" id="option2" autocomplete="off" value="kakaoPay">
				<label class="btn btn-secondary" for="option2">카카오톡</label>

				<input type="radio" class="btn-check" name="paymentOption" id="option3" autocomplete="off" value="">
				<label class="btn btn-secondary" for="option3">토스페이</label>

				<input type="radio" class="btn-check" name="paymentOption" id="option4" autocomplete="off" value="">
				<label class="btn btn-secondary" for="option4">몰라</label>
				
				
				<hr class="my-4">



				<button class="w-100 btn btn-primary btn-lg" onclick="requestPay()">Continue to checkout</button>
			</div>
		</div>
		</main>
	
	</div>
<!-- left-container 끝 -->

<!-- right-container 시작 -->
	<div class="right-container" style="margin: 5%; width: 30%;">
		<h4 class="mb-3">쿠폰</h4>
		<hr>
		<h4 class="mb-3">할인적용</h4>
		<hr>
		<h4 class="mb-3">총 가격</h4>  <h4 class="mb-3">${ordersDTO.total_price}</h4> 
		
	</div>
<!-- right-container 끝 -->


<!-- 본인 페이지에 맞게 수정하려면 여기까지 삭제하고, 새로 만들면 됩니다. 혹시 문제 생기면 섹션까지 삭제 해보는거 추천!!!!-->
	</section>
	<!-- section 끝  -->

	<!-- footer 시작 -->
	<footer class="footer">
		<p>&copy; 2023 SSB Style</p>
	</footer>
	<!-- footer 끝 -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>

<script>
	var pgv;
	var pam;
	var muid = '${ordersDTO.id}';
	var price = '${ordersDTO.total_price}';
	var orderName = '${ordersDTO.id}';
	
	$('#option1').on("click", function(){
		pgv="danal"
		pam="phone"
	})
	$('#option2').on("click", function(){
		pgv="kakaopay"
		pam="kakaopay"
	})
	
	$('#option3').on("click", function(){
		pgv="tosspay"
		pam="card"
	})
	
	
	    var IMP = window.IMP;
        IMP.init("imp32277628");

        function requestPay() {
            IMP.request_pay({
            pg: pgv,
            pay_method: pam,
            merchant_uid: muid,   // 주문번호
            name: orderName,
            amount: price,                         // 숫자 타입
            buyer_email: "sm302010@naver.com",
            buyer_name: "드락사르",
            buyer_tel: "000-0000-0000",
            buyer_addr: "테스트 입니다.",
            buyer_postcode: ""
            }, function (rsp) {
            if (rsp.success) {
            // ajax로 HTTP 요청
          
            $.ajax({
                type:"POST",
                url:"./PayValidationAjax.od",
                DataType : "text",
                data:{
                "imp_uid":rsp.imp_uid,
                "merchant_uid":rsp.merchant_uid,         
                "paid_amount" :rsp.paid_amount,
                "status" :rsp.status,
                "name":rsp.name,
                "pay_method":rsp.pay_method,
                "success" :rsp.success,
                "pg_provider" : rsp.pg_provider
                
                },
                success:function(data){
                	if(data=='SUCCESS'){
                		console.log('결제 성공인가 봅니다');
                        alert(`결제 성공했음`);
                        alert('data의 값은 :' + data);
                        location.href='./OrderResult.od?mid='+muid;
                	}else if(data=="PAYDIFF"){
                		alert('결제 금액과 다른 금액이 결제되었습니다. 다시 확인 해주시길 바랍니다.');
                	}else if(data == 'EEROR'){
                		alert('비정상적인 결제가 진행되었으므로 결제가 종료되었습니다.');
                	}
        
                } //success 종료
            })//ajax 종료
        } else{
        alert(`결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}`);
        } //else 종료
        });//
    }
</script>


</body>

</html>