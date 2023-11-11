///////////////////////////////////////////////////////////////
// 콤보 박스 - 도메인 직접 입력 or domain option 선택 
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
/////////////////////////////////////////////////////////////

//////////////////// 공통으로 필요한 것 /////////////////////////
// onsubmit시에 필요한 리턴값 초기화
let idCheck = false;
let pwCheck = false;

// 스페이스 제거 함수
function checSpace(str){
	return str.includes(' ');
};
//////////////////// 공통으로 필요한 것 /////////////////////////

// 아이디 중복 확인 ajax
$('.inputId').keyup(function(){
    checkDuplicationId();
    //console.log(pwCheck);
});
function checkDuplicationId(){
	let userId = $('.inputId').val(); // inputId에 입력되는 값

	$.ajax({
		url: "./MemberJoinIdCheck.me",
		type: "post",
		data: { userId: userId },
		dataType: 'text',
		success: function(result) {
			if (result == -1) {
				$("#checkId").html('<b>사용할 수 없는 아이디입니다</b>');
				$("#checkId").attr('color', 'red');
				idCheck = false;
				//				$("#floatingId").focus();
			} else if (result == 0) {
				$("#checkId").html('<b>영문,숫자만 가능합니다</b>');
				$("#checkId").attr('color', 'red');
				idCheck = false;
				//				$("#floatingId").focus();
			} else if (result == 1) {
				$("#checkId").html('사용가능한 아이디입니다');
				$("#checkId").attr('color', 'skyblue');
				idCheck = true;				
			}
		},
		error: function() {
			alert("서버요청실패");
		}
	});
//	console.log(idCheck);
}
// 아이디 중복 확인 ajax

//비밀번호 유효성 검사 ajax
$('.inputPw').keyup(function(){
    checkPasswordHints();
//    console.log(pwCheck);
});
function checkPasswordHints() {
    let userPw = $('.inputPw').val();

    $.ajax({
        url: './MemberJoinPwCheck.me',
        type: 'post',
        data: { userPw: userPw },
        datatype: 'text',
        success: function (result) {
            // 스타일 초기화
            $('.password-hints font').css('color', '');

            // 힌트 표시
            switch (parseInt(result)) {
                case 1:
                    $('.hint1').css('color', 'red'); // 대소문자
                    pwCheck = false;
                    break;
                case 2:
                    $('.hint2').css('color', 'red'); // 숫자
                    pwCheck = false;
                    break;
                case 3:
                    $('.hint3').css('color', 'red'); // 특수문자
                    pwCheck = false;
                    break;
                case 4:
                    $('.hint4').css('color', 'red'); // 8~20자 이내
                    pwCheck = false;
                    break;
                case 5:
                    $('.hint1, .hint2').css('color', 'red'); // 대소문자, 숫자
                    pwCheck = false;
                    break;
                case 6:
                    $('.hint1, .hint3').css('color', 'red'); // 대소문자, 특수문자
                    pwCheck = false;
                    break;
                case 7:
                    $('.hint1, .hint4').css('color', 'red'); // 대소문자, 8~20자
                    pwCheck = false;
                    break;
                case 8:
                    $('.hint2, .hint3').css('color', 'red'); // 숫자, 특수문자
                    pwCheck = false;
                    break;
                case 9:
                    $('.hint2, .hint4').css('color', 'red'); // 숫자, 8~20자
                    pwCheck = false;
                    break;
                case 10:
                    $('.hint3, .hint4').css('color', 'red'); // 특수문자, 8~20자
                    pwCheck = false;
                    break;
                case 11:
                    $('.hint1, .hint2, .hint3').css('color', 'red'); // 대소문자, 숫자, 특수문자
                    pwCheck = false;
                    break;
                case 12:
                    $('.hint1, .hint2, .hint4').css('color', 'red'); // 대소문자, 숫자, 8~20자
                    pwCheck = false;
                    break;
                case 13:
                    $('.hint1, .hint3, .hint4').css('color', 'red'); // 대소문자, 특수문자, 8~20자
                    pwCheck = false;
                    break;
                case 14:
                    $('.hint2, .hint3, .hint4').css('color', 'red'); // 숫자, 특수문자, 8~20자
                    pwCheck = false;
                    break;
                case 15:
                    $('.hint1, .hint2, .hint3, .hint4').css('color', 'red'); // 대소문자, 숫자, 특수문자, 8~20자
                    pwCheck = true;
                    break;
//                default:
//                    break;
            }
        },
        error: function () {
            alert("서버요청실패");
        }
    }); 
}
// 비밀번호 유효성 검사 ajax 끝

// 비밀번호 재확인 ajax
//$('.inputPw').focusout(function(){
//	let userPw = $('.inputPw').val(); // inputPw에 입력되는 값
//	
//	$.ajax({
//		url :'./MemberJoinPwCheck.me' ,
//		type : 'post',
//		data : {userPw : userPw},
//		datatype : 'text',
//		success : function(result){
//			
//				
//		}, 
//		error :function(){
//			alert("서버요청실패");
//		}
//	})
//});
// 비밀번호 재확이 ajax 끝

// onsubmit 유효성 검사
function check() {
	// 아이디 입력여부 체크
	var id = document.fr.member_user_id.value;
	if (id == "") {
		alert('아이디를 입력하세요!');
		document.fr.member_user_id.focus();
		return false;
	}
	
	if (idCheck == false) {
        document.fr.member_user_id.focus();
        return false;
    }

	// 비밀번호 입력여부 체크
	var pw = document.fr.member_pw.value;
	if (pw == "") {
		alert('비밀번호를 입력하세요!');
		document.fr.member_pw.focus();
		return false;
	}

	if(pwCheck == false){
		document.fr.member_pw.focus();
		return false;
	}

	// 비밀번호 유효성 체크 (8자 이상)
//	if (pw.length < 8) {
//		alert('비밀번호는 최소 8자 이상이어야 합니다.');
//		document.fr.member_pw.focus();
//		return false;
//	}

	// 비밀번호 확인 입력여부 체크
//	var pw2 = document.fr.member_pw2.value;
//	if (pw2 == "") {
//		alert('비밀번호 확인을 입력하세요!');
//		document.fr.member_pw2.focus();
//		return false;
//	}

	// 비밀번호와 비밀번호 확인 일치 여부 체크
//	if (pw != pw2) {
//		alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
//		document.fr.member_pw2.focus();
//		return false;
//	}

	// 이메일 입력여부 체크 (이메일 주소 또는 직접 입력)
	var email = document.fr.member_email.value;
	var email2 = document.fr.member_email2.value;
	var domain = document.fr.domain.value;
	if (email == "" || (domain == "type" && email2 == "")) {
		alert('이메일을 입력하세요!');
		document.fr.member_email.focus();
		return false;
	}

	// 생년월일 입력여부 체크
	var birth = document.fr.member_birth.value;
	if (birth == "") {
		alert('생년월일을 입력하세요!');
		document.fr.member_birth.focus();
		return false;
	}

	// 생년월일 유효성 체크 (8자)
	if (birth.length < 8) {
		alert("생년월일은 8자로 입력하세요.\n ex) '20000101'");
		document.fr.member_pw.focus();
		return false;
	}

	// 성별 선택여부 체크
	var gender = document.querySelector('input[name="member_gender"]:checked');
	if (!gender) {
		alert('성별을 선택하세요!');
		return false;
	}

	// 전화번호 입력여부 체크
	var phone = document.fr.member_phone.value;
	if (phone == "") {
		alert('전화번호를 입력하세요!');
		document.fr.member_phone.focus();
		return false;
	}

	// 마케팅 수신 동의 체크여부 체크
	//     var agree = document.querySelector('input[name="member_agree"]:checked');
	//     if(!agree){
	//       alert('마케팅 수신 동의를 체크하세요!');
	//       return false;
	//     }
	return true;
}   