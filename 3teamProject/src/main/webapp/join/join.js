// 도메인 직접 입력 or domain option 선택
const domainListEl = document.querySelector('#domain-list')
const domainInputEl = document.querySelector('#domain-txt')
// select 옵션 변경 시
domainListEl.addEventListener('change', (event) => {
  // option에 있는 도메인 선택 시
  if(event.target.value !== "type") {
    // 선택한 도메인을 input에 입력하고 disabled
    domainInputEl.value = event.target.value
    domainInputEl.disabled = true
  } else { // 직접 입력 시
    // input 내용 초기화 & 입력 가능하도록 변경
    domainInputEl.value = ""
    domainInputEl.disabled = false
  }
});
  
// 아이디 중복 확인 구현  
$('.inputId').focusout(function(){
	let userId =  $('.inputId').val(); // inputId에 입력되는 값
	
	$.ajax({
		url : "./MemberJoinIdCheck.me",
		type : "post",
		data : {"userId": userId},
		dataType : 'text',
		success : function(result){
			if(result == -1){
				$("#checkId").html('사용할 수 없는 아이디입니다.');
				$("#checkId").attr('color','red');
				$("#floatingId").css({
					'border-color' : 'red',
					'border-width' : '2px'
				});
				$("#floatingId").focus();
			}else{
				$("#checkId").html('사용할 수 있는 아이디입니다.');
				$("#checkId").attr('color','skyblue');
				$("#floatingId").css({
					'border-color' : '',
					'border-width' : ''
				});
				
			}
		},
		error : function(){
			alert("서버요청실패");
		}
	})
});