<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="./location/locationInsert.css">
</head>
<body>
	<form action="./locationInsertAction.lo" method="post">
		<table>
			<tr>
				<td><label>수취인이름 : </label></td>
				<td><input type="text" name="location_name" placeholder="수취인 성함" value="${dto.location_name}" required="required"></td>
			</tr>
			<tr>
				<td><label>수취인전화번호 : </label></td>
				<td>
					<!-- <input type="tel" name="location_phone" placeholder="수취인 전화번호" value="${dto.location_phone}" required="required"> -->
					<input id="location_phone0" type="text" name="location_phone[]" pattern="\d*" maxlength="3" value="${dto.location_phone.substring(0,3)}" required="required">
					<label> - </label>
					<input id="location_phone1" type="text" name="location_phone[]" pattern="\d*" maxlength="4" value="${dto.location_phone.substring(3,7)}" required="required">
					<label> - </label>
					<input id="location_phone2" type="text" name="location_phone[]" pattern="\d*" maxlength="4" value="${dto.location_phone.substring(7,11)}" required="required">
				</td>
			</tr>
			<tr>
				<td><label>배송지우편번호 : </label></td>
				<td>
					<input type="text" id="sample6_postcode" placeholder="우편번호" name="location_postcode" value="${dto.location_postcode}" readonly="readonly">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
				</td>
			</tr>
			<tr>
				<td><label>주소 : </label></td>
				<td><input type="text" id="sample6_address" placeholder="주소" name="location_add" value="${dto.location_add}" readonly="readonly"></td>
			</tr>
			<tr>
				<td><label>상세주소 : </label></td>
				<td><input type="text" id="sample6_extraAddress" placeholder="상세주소" name="locationD_add" value="${dto.locationD_add}"  required="required"></td>
			</tr>
			<tr>
				<td><label>배송지이름 : </label></td>
				<td><input type="text" name="location_title" placeholder="배송지 이름" value="${dto.location_title}"  required="required"></td>
			</tr>
			<tr>
				<td><label>배송요청사항 : </label></td>
				<td>
					<select id="sample6_detailAddress" name="location_requested">
						<option label="배송 시 요청사항을 선택해주세요" selected="selected">
						<option label="부재시 경비실에 맞겨주세요" value="부재 시 경비실에 맞겨주세요">
						<option label="부재 시 택배함에 넣어주세요" value="부재 시 택배함에 넣어주세요">
						<option label="부재 시 집 앞에 놓아주세요" value="부재 시 집 앞에 놓아주세요">
						<option label="배송 전 연락 바랍니다" value="배송 전 연락 바랍니다">
						<option label="파손의 위험이 있는 상품입니다.배송 시 주의해 주세요" value="파손의 위험이 있는 상품입니다.배송 시 주의해 주세요">
						<option label="직접 입력">
					</select>
					<br>
					<textarea id="directInput" rows="3" cols="40" hidden=""></textarea>
				</td>
			</tr>
		</table>
		<input type="hidden" name="member_id" value="1">
		<input type="hidden" name="location_id" value="${dto.location_id}">
		<input type="hidden" name="location_phone">
		<!-- 세션에서 회원ID 받아오게 바꾸기 -->
		<input type="submit" value="등록" onclick="return validityCheck()">
		<input type="button" value="취소" onclick="history.back();">
	</form>
	<script type="text/javascript">
		$(function() {
			$("#sample6_detailAddress").change(function() {
				var result = $('#sample6_detailAddress option:selected').attr("label") == '직접 입력';
				if (result) {//직접입력 체크
					$("textarea").removeAttr("hidden");
				}else{
					$("textarea").attr("hidden","hidden");
				}
			});
		});
		function sample6_execDaumPostcode() {//카카오 주소API
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수
	
					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}
	
					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("sample6_extraAddress").value = extraAddr;
	
					} else {
						document.getElementById("sample6_extraAddress").value = '';
					}
	
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample6_postcode').value = data.zonecode;
					document.getElementById("sample6_address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("sample6_extraAddress").focus();
				}
			}).open();
		}
		function validityCheck() {//우편번호,주소,배송요청사항 유효성 체크
			var result = $('#sample6_detailAddress option:selected').attr("label") == '직접 입력';
		
			var phoneArr = new Array();//전화번호 유효성 체크
			var phone0 = $("input[name='location_phone[]']")[0].value;
			var phone1 = $("input[name='location_phone[]']")[1].value;
			var phone2 = $("input[name='location_phone[]']")[2].value;
			
			if (phone0.length < 3 || phone1.length < 4 || phone2.length < 4) {//전화번호 유효성 체크
				alert("유효하지 않은 전화번호");
				return false;
			}else{
				for (var i = 0; i < 3; i++) {
					phoneArr.push($("input[name='location_phone[]']")[i].value);
				}
				$("input[name='location_phone']").attr("value",phoneArr.join(""));
			}
			
			if (result) {//직접 입력 체크
				$('#sample6_detailAddress option:selected').attr("value",$("#directInput").val());
			}
			
			if($("#sample6_postcode").val() == "" || $("#sample6_address").val() == ""){//우편번호,주소 체크
				alert("우편번호를 확인해주세요");
				return false;
			}
		}
	</script>
</body>
</html>