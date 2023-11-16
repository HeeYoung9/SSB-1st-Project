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

<!-- ��� �޴��� ���� �� ���� Ȯ�� -->
<script>
	document.addEventListener("DOMContentLoaded", function() {

		const submenus = document.querySelectorAll(".menu .submenu");
		const submenuContents = document.querySelectorAll(".submenu-content");

		submenus.forEach(function(submenu, index) {
			const submenuContent = submenuContents[index];

			// �޴� �׸��� ȣ���� ��
			submenu.addEventListener("mouseover", function() {
				// �ش� �޴� �׸��� ���� �޴��� ǥ�õǸ� �޴��� ���̸� ����
				submenuContent.style.display = "block";
				submenu.style.height = submenuContent.clientHeight + "px";
			});

			// �޴� �׸񿡼� ���콺�� ���� ��
			submenu.addEventListener("mouseout", function() {
				// �ش� �޴� �׸��� ���� �޴��� �������� �޴��� ���̸� ������� ����
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

  <!-- �ĺ��� -->
<link rel="shortcut icon" href="./favicon/favicon.ico">
</head>
<body>
    <!-- ���/ ��ܸ޴��� ���� top.jsp ���� ������ ��� -->
<div class="header">
	<jsp:include page="../Mcommon/top.jsp" />
</div>
<!-- ���/ ��ܸ޴��� ���� top.jsp ���� ������ ��� -->


	<!-- section ���� -->

	<section class="section" style="margin:5%;">

		<!-- ���� �������� �°� �����Ϸ��� ���� �Ʒ������� �����ϰ�, ���� ����� �˴ϴ�. Ȥ�� ���� ����� ���Ǳ��� ���� �غ��°� ��õ!!!!-->

		<!-- left-container ���� -->
		<div class="left-container" style="margin: 5%; width: 60%;">
			<div class="col-md-7 col-lg-8">
				<h4 class="mb-3">���� ����</h4>
				<hr>
				<h4 class="mb-3">���� ��ǰ ����</h4>
				<table class="table table-dark table-striped">
					<thead>
						<tr>
							<th scope="col">No.</th>
							<th scope="col">��ǰ��</th>
							<th scope="col">����</th>
							<th scope="col">����</th>
							<th scope="col">�� ����</th>
							
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
				<h4 class="mb-3">���� ����</h4>
				
				<input type="radio" class="btn-check" name="paymentOption" id="option1" autocomplete="off" value="naverPay">
				<label class="btn btn-secondary" for="option1">�ٳ� �޴��� ����</label>

				<input type="radio" class="btn-check" name="paymentOption" id="option2" autocomplete="off" value="kakaoPay">
				<label class="btn btn-secondary" for="option2">īī����</label>

				<input type="radio" class="btn-check" name="paymentOption" id="option3" autocomplete="off" value="">
				<label class="btn btn-secondary" for="option3">�佺����</label>

				<input type="radio" class="btn-check" name="paymentOption" id="option4" autocomplete="off" value="">
				<label class="btn btn-secondary" for="option4">����</label>
				
				
				<hr class="my-4">



				<button class="w-100 btn btn-primary btn-lg" onclick="requestPay()">Continue to checkout</button>
			</div>
		</div>
		</main>
	
	</div>
<!-- left-container �� -->

<!-- right-container ���� -->
	<div class="right-container" style="margin: 5%; width: 30%;">
		<h4 class="mb-3">����</h4>
		<hr>
		<h4 class="mb-3">��������</h4>
		<hr>
		<h4 class="mb-3">�� ����</h4>  <h4 class="mb-3">${ordersDTO.total_price}</h4> 
		
	</div>
<!-- right-container �� -->


<!-- ���� �������� �°� �����Ϸ��� ������� �����ϰ�, ���� ����� �˴ϴ�. Ȥ�� ���� ����� ���Ǳ��� ���� �غ��°� ��õ!!!!-->
	</section>
	<!-- section ��  -->

	<!-- footer ���� -->
	<footer class="footer">
		<p>&copy; 2023 SSB Style</p>
	</footer>
	<!-- footer �� -->

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
            merchant_uid: muid,   // �ֹ���ȣ
            name: orderName,
            amount: price,                         // ���� Ÿ��
            buyer_email: "sm302010@naver.com",
            buyer_name: "����縣",
            buyer_tel: "000-0000-0000",
            buyer_addr: "�׽�Ʈ �Դϴ�.",
            buyer_postcode: ""
            }, function (rsp) {
            if (rsp.success) {
            // ajax�� HTTP ��û
          
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
                		console.log('���� �����ΰ� ���ϴ�');
                        alert(`���� ��������`);
                        alert('data�� ���� :' + data);
                        location.href='./OrderResult.od?mid='+muid;
                	}else if(data=="PAYDIFF"){
                		alert('���� �ݾװ� �ٸ� �ݾ��� �����Ǿ����ϴ�. �ٽ� Ȯ�� ���ֽñ� �ٶ��ϴ�.');
                	}else if(data == 'EEROR'){
                		alert('���������� ������ ����Ǿ����Ƿ� ������ ����Ǿ����ϴ�.');
                	}
        
                } //success ����
            })//ajax ����
        } else{
        alert(`������ �����Ͽ����ϴ�. ���� ����: ${rsp.error_msg}`);
        } //else ����
        });//
    }
</script>


</body>

</html>