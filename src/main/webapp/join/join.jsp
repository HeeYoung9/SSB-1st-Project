<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- header js 코드 영역 접어둠. -->
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

<!-- 상단 메뉴바 오픈 및 영역 확장 js 코드 접어둠.-->
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
<title>Document</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link href="./join/join.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">
	function check(){
	    // 아이디 입력여부 체크
	    var id = document.fr.member_user_id.value;
	    if(id == ""){
	      alert('아이디를 입력하세요!');
	      document.fr.member_user_id.focus();
	      return false;
	    }
	
	    // 비밀번호 입력여부 체크
	    var pw = document.fr.member_pw.value;
	    if(pw == ""){
	      alert('비밀번호를 입력하세요!');
	      document.fr.member_pw.focus();
	      return false;
	    }
	
	    // 비밀번호 유효성 체크 (8자 이상)
	    if(pw.length < 8){
	      alert('비밀번호는 최소 8자 이상이어야 합니다.');
	      document.fr.member_pw.focus();
	      return false;
	    }
	
	    // 비밀번호 확인 입력여부 체크
	    var pw2 = document.fr.member_pw2.value;
	    if(pw2 == ""){
	      alert('비밀번호 확인을 입력하세요!');
	      document.fr.member_pw2.focus();
	      return false;
	    }
	
	    // 비밀번호와 비밀번호 확인 일치 여부 체크
	    if(pw != pw2){
	      alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
	      document.fr.member_pw2.focus();
	      return false;
	    }
	
	    // 이메일 입력여부 체크 (이메일 주소 또는 직접 입력)
	    var email = document.fr.member_email.value;
	    var email2 = document.fr.member_email2.value;
	    var domain = document.fr.domain.value;
	    if(email == "" || (domain == "type" && email2 == "")){
	      alert('이메일을 입력하세요!');
	      document.fr.member_email.focus();
	      return false;
	    }
	
	    // 생년월일 입력여부 체크
	    var birth = document.fr.member_birth.value;
	    if(birth == ""){
	      alert('생년월일을 입력하세요!');
	      document.fr.member_birth.focus();
	      return false;
	    }
	    
	    // 생년월일 유효성 체크 (8자)
	    if(birth.length < 8){
	      alert("생년월일은 8자로 입력하세요.\n ex) '20000101'");
	      document.fr.member_pw.focus();
	      return false;
	    }
	
	    // 성별 선택여부 체크
	    var gender = document.querySelector('input[name="member_gender"]:checked');
	    if(!gender){
	      alert('성별을 선택하세요!');
	      return false;
	    }
	
	    // 전화번호 입력여부 체크
	    var phone = document.fr.member_phone.value;
	    if(phone == ""){
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
	  }   
</script>
<link href="./main/main.css" rel="stylesheet">
</head>
<body>


<!--  -------------------------------------------탑 컨테이너 넣는 곳 ---------------------------------------------- -->
<!-- 헤더/ 상단메뉴바 영역 top.jsp 공통 페이지 사용 -->
<div class="header">
	<jsp:include page="../Mcommon/top.jsp" />
</div>
<!-- 헤더/ 상단메뉴바 영역 top.jsp 공통 페이지 사용 -->
<!--  -------------------------------------------탑 컨테이너 끝 ---------------------------------------------- -->

<!---------------------------left-panel 시작---------------------------------->
<div class="left-panel"></div>

<!-- 메인 컨테이너 -->
<div class="main-container" style="text-align: center; margin-top: 150px;">
		<img alt="SSB_black" src="./main/img/SSB_black.png" width="150px" style="text-align: left;">
	

	<div class="form-container">

		<main class="form-signin m-auto" style="width: 480px; /*border: 1px solid red;*/">
			<!-- form 시작 -->
			<form action="./MemberJoinAction.me" method="post" name="fr" onsubmit="return check();">
				<h1 class="h3 mb-3 fw-normal" style="text-align: left;">회원가입</h1>
				<!-- 아이디 -->
				<div class="col">
					<div class="input-group">
						<div class="form-floating">
							<input type="text" name="member_user_id" class="form-control input-cc inputId" id="floatingId" placeholder=""> 
							<label for="floatingId">아이디</label>
							<font id="checkId" size="2" class="position-absolute top-50 start-20 translate-middle-y" style="right: 9px; margin-top: 2px"></font>
						</div>
					</div>
				</div>
				<!-- 비밀번호 -->
<!-- 				<div class="form-floating d-flex"> -->
<!-- 					<input type="password" name="member_pw" class="form-control input-cc inputPw" id="floatingPassword" placeholder="">  -->
<!-- 					<label for="floatingPassword">비밀번호</label> -->
<!-- 					<font>대소문자 &#10003;</font> -->
<!-- 					<font>숫자 &#10003;</font> -->
<!-- 					<font>특수문자 &#10003;</font> -->
<!-- 					<font>8~20자 이내 &#10003;</font> -->
<!-- 				</div> -->
				
				<div class="col">
					<div class="input-group">
						<div class="form-floating">
							<input type="password" name="member_pw" class="form-control input-cc inputPw" id="floatingPassword" placeholder=""> 
							<label for="floatingPassword">비밀번호</label>
							<div class="">
								<font>대소문자 &#10003;</font>
								<font>숫자 &#10003;</font>
								<font>특수문자 &#10003;</font>
								<font>8~20자 이내 &#10003;</font>
							</div>
						</div>
					</div>
				</div>
				<!-- 비밀번호 확인 -->
				<div class="form-floating d-flex">
					<input type="password" name="member_pw2" class="form-control input-cc inputPw" id="floatingCheckPassword" placeholder=""> 
					<label for="floatinCheckPassword">비밀번호 확인</label>
				</div>
				
				<!-- 이메일 입력-->
				<div class="form-floating d-flex">
				    <input type="text" name="member_email" class="form-control flex-grow-1 input-cc" id="floatingEmail" placeholder="">
				    <label for="floatingEmail" class="flex-grow-4">이메일 입력</label>
				    
             			 <span class="input-group-text">@</span>
             			 
				    <input type="text" name="member_email2" class="form-control flex-grow-1 input-cc " id="domain-txt" placeholder=''>
				    <select name="domain" class="form-control flex-grow-1" id="domain-list">
				        <option value="type">직접 입력</option>
				        <option value="naver.com">naver.com</option>
				        <option value="google.com">google.com</option>
				        <option value="hanmail.net">hanmail.net</option>
				        <option value="nate.com">nate.com</option>
				        <option value="kakao.com">kakao.com</option>
				    </select>
				</div>
				
				<!-- 이름 -->
				<div class="form-floating d-flex mt-2">
					<input type="text" name="member_name" class="form-control input-cc " id="floatingName" placeholder=""> 
          			<label for="floatingName">이름</label>
				</div>
				
				<!-- 생년월일 -->
				<div class="form-floating d-flex">
					<input type="text" name="member_birth" class="form-control input-cc " id="floatingBirth" placeholder="" > 
          			<label for="floatingBirth">생년월일 ex)'20000101'</label>
				</div>
				
				<!-- 성별 -->
				<div class="form-floating d-flex">
				    <div class="form-check form-check-inline">
				        <input type="radio" name="member_gender" class="form-check-input" id="floatingKor" value="M" checked>
				        <label class="form-check-label" for="floatingKor">남</label>
				    </div>
				    <div class="form-check form-check-inline">
				        <input type="radio" name="member_gender" class="form-check-input" id="floatingFor" value="W">
				        <label class="form-check-label" for="floatingFor">여</label>
				    </div>
				</div>
				
				<!-- 전화번호 -->
				<div class="form-floating d-flex">
					<input type="text" name="member_phone" class="form-control input-cc" id="floatingTel" placeholder=""> 
					<label for="floatingTel"><span>전화번호 '-' 제외 입력</span></label>
				</div>
				
				<!-- 마케팅 수신 동의 -->
				<div class="form-floating d-flex">
				    <div class="form-check form-check-inline">
				        <input type="checkbox" name="member_agree" class="form-check-input" id="floatingAgree" value="Y">
				        <label class="form-check-label" for="floatingAgree">마케팅 수신 동의(선택)</label>
				    </div>
				</div>
				
				<div class="info">
					<span><button style="border: none; background-color: none; font-size: 8px;" onclick="location.href='#'">고객 센터</button></span>
				</div>
				<div class="form-floating" style="text-align: center; margin-top: 5%;">
					<button class="btn btn-outline-dark w-25 py-2" type="submit" name="member_situation" value="가입">회원가입</button>
					<button class="btn btn-outline-dark w-25 py-2" type="button" style="margin-left: 10%" onclick=history.go(-1);>취소</button>
				</div>
			</form>
			<!-- form 끝 -->
		</main>
	</div>

</div>
<!-- 메인 컨테이너-->


<!---------------------------left-panel 종료---------------------------------->


<br>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="./join/join.js"></script>
</body>

</html>