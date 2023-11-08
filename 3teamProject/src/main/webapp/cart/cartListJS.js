$(function() {
	$("#checkAll").click(function() {//체크박스 전체선택/해제
		if ($("#checkAll").is(":checked")) $("input[name=cart_id]").prop("checked", true);
		else $("input[name=cart_id]").prop("checked", false);
	});
	$("input[name=cart_id]").click(function() {//체크박스 전체선택 감지
		var total = $("input[name=cart_id]").length;
		var checked = $("input[name=cart_id]:checked").length;
		if (total != checked) $("#checkAll").prop("checked", false);
		else $("#checkAll").prop("checked", true);
	});
});
function getOptions(cart_id, item_id, cart_quantity) {//옵션 가져오기
	$.ajax({
		type: "POST",
		url: "./getOptions.ca",
		dataType: "text",
		data: {
			"item_id": item_id
		},
		error: function() {
			alert('통신실패!!');
		},
		success: function(data) {
			$("#optionSelecter").removeAttr("hidden");//옵션 변경창 히든 제거
			var optionList = JSON.parse(data);//json 객체로 전환
			//객체를 사용해 웹에 뿌리기
			//장바구니 수량
			$("#selectedQuantitiy").attr("value",cart_quantity);
			//제품 아이디
			$("#optionSelecter").append("<input type='hidden' name='hidden_item_id' value='" + item_id + "'>");
			//장바구니 아이디
			$("#optionSelecter").append("<input type='hidden' name='hidden_cart_id' value='" + cart_id + "'>");
			//셀렉트 옵션 이름 초기값 설정
			//옵션 이름 히든처리
			$("#chooseOptions").html("<option label='" + optionList[0].options_name + "' hidden selected='selected'>");
			//옵션값 forEach 처리
			for (var optionDTO of optionList) {
				$("#chooseOptions").append("<option value='" + optionDTO.options_id + "' label='" + optionDTO.options_value + "'>");
			}
		}
	});
}
function optionSelecterClose() {//옵션 변경창 닫기
	$("#optionSelecter").attr("hidden", "hidden");//옵션 변경창 히든 부여
}
function updateCart() {//장바구니 업데이트
	var option_id = $("#chooseOptions option:selected").val();//선택된 옵션아이디 받아오기
	var cart_id = $("[name=hidden_cart_id]").val();//장바구니 아이디
	var item_id = $("[name=hidden_item_id]").val();//제품 아이디
	var cart_quantity = $("#selectedQuantitiy").val();//장바구니 수량
	//옵션 null값 체크
	if(option_id==""){
		alert("옵션을 선택해 주십시오");
		return;
	}else if(cart_quantity==""){
		alert("수량을 확인해 주십시오");
		return;
	}
	//AJAX
	$.ajax({
		type: "POST",
		url: "./updateCart.ca",
		dataType: "text",
		data: {
			"cart_id": cart_id,
			"item_id": item_id,
			"option_id": option_id,
			"cart_quantity": cart_quantity
		},
		error: function() {
			alert('통신실패!!');
		},
		success: function(data) {
			var result = JSON.parse(data);
			$("#optionSelecter").attr("hidden", "hidden");//옵션 변경창 히든 부여
			//옵션 변경 결과
			if(result = 1){
				alert("변경완료");
			}else if(result = 0){
				alert("변경실패");
			}else{
				alert("알수없는 오류");
			}
			//페이지 새로고침
			location.reload();
		}
	});
}
function deleteCart() {//장바구니 삭제
	arrayData();//선택된 체크박스값 추출
	var member_id = 1;//회원ID
	var checkArray = $("#checkArray").val();
	alert(checkArray);
	//옵션 null값 체크
	if(member_id==""){
		alert("로그인 정보를 확인해 주십시오");
		return;
	}else if(checkArray==""){
		alert("제품을 선택해 주십시오");
		return;
	}
	//AJAX
	$.ajax({
		type: "POST",
		url: "./deleteCart.ca",
		dataType: "text",
		data: {
			"cart_id": checkArray,
			"member_id": member_id
		},
		error: function() {
			alert('통신실패!!');
		},
		success: function(data) {
			var result = JSON.parse(data);
			//옵션 삭제 결과
			if(result = 1){
				alert("삭제완료");
			}else if(result = 0){
				alert("삭제실패");
			}else{
				alert("알수없는 오류");
			}
			//페이지 새로고침
			location.reload();
		}
	});
}
function arrayData(){//배열 넘기기
	var checkArray = new Array();
	$("input:checkbox[name=cart_id]:checked").each(function(){
		checkArray.push(this.value);
	});
	$("#checkArray").val(checkArray);
}
