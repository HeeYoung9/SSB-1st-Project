<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link href="./join/join.css" rel="stylesheet"/>
</head>
<body>
<script type="text/javascript">
  	function check(){
  		// 아이디 입력여부 체크
  		var id = document.fr.member_user_id.value;
  		if(id == ""){
  			alert(' 아이디를 입력하세요! ');
  			document.fr.id.focus();
  			return false;
  		}
  	}  
</script>

<!--  -------------------------------------------탑 컨테이너 넣는 곳 ---------------------------------------------- -->
<div class="container-fluid">
	<!-------------------  로고 넣는 곳 시작 --------------->
	<div class="logo" style="margin-left: 25%;">
<!-- 		<img alt="SSB_black" src="../img/SSB_black.png" width="150px"> -->
	</div>
	<!------------------  로고 넣는 곳  끝----------------->
</div>
<!--  -------------------------------------------탑 컨테이너 끝 ---------------------------------------------- -->

<!---------------------------left-panel 시작---------------------------------->
<div class="left-panel"></div>

<!-- 메인 컨테이너 -->
<div class="main-container" style="text-align: center; margin-top: 5%;">
		<img alt="SSB_black" src="./templete/img/SSB_black.png" width="150px" style="text-align: left;">
	

	<div class="form-container">

		<main class="form-signin m-auto" style="width: 480px; border: 1px solid red;">
			<form action="./MemberJoinAction.me" method="post" name="fr" onsubmit="return check();">
				<h1 class="h3 mb-3 fw-normal" style="text-align: left;">회원가입</h1>


				<div class="col">
					<div class="input-group">
						<div class="form-floating">
							<input type="text" name="member_user_id" class="form-control input-cc" id="floatingId" placeholder="ID"> 
							<label for="floatingId">아이디</label>
						</div>
					</div>
				</div>

				<div class="form-floating d-flex">
					<input type="password" name="member_pw" class="form-control input-cc" id="floatingPassword" placeholder="Password"> 
					<label for="floatingPassword">비밀번호</label>
				</div>
				<div class="form-floating d-flex">
					<input type="password" name="member_pw2" class="form-control input-cc" id="floatingCheckPassword" placeholder="Password"> 
					<label for="floatinCheckPassword">비밀번호 확인</label>
				</div>

				<div class="form-floating d-flex">
				    <input type="text" name="member_email" class="form-control flex-grow-1 input-cc" id="floatingEmail" placeholder="Email">
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
					

				<div class="form-floating d-flex mt-2">
					<input type="text" name="member_name" class="form-control input-cc " id="floatingName" placeholder="Name"> 
          			<label for="floatingName">이름</label>
				</div>

				<div class="form-floating d-flex">
					<input type="text" name="member_birth" class="form-control input-cc " id="floatingBirth" placeholder="" > 
          			<label for="floatingBirth">생년월일</label>
				</div>

				<div class="form-floating d-flex">
				    <div class="form-check form-check-inline">
				        <input type="radio" name="member_gender" class="form-check-input" id="floatingKor" value="M">
				        <label class="form-check-label" for="floatingKor">남</label>
				    </div>
				    <div class="form-check form-check-inline">
				        <input type="radio" name="member_gender" class="form-check-input" id="floatingFor" value="W">
				        <label class="form-check-label" for="floatingFor">여</label>
				    </div>
				</div>
				
				<div class="form-floating d-flex">
					<input type="text" name="member_phone" class="form-control input-cc" id="floatingTel" placeholder="ex)'19990101'"> 
					<label for="floatingTel">전화번호</label>
				</div>
				
				<div class="form-floating d-flex ">
					<input type="radio" name="member_agree" class="form-check-input" id="floatingAgree" value="Y">
				    <label class="form-check-label" for="floatingAgree">마케팅 수신 동의</label>
				</div>
				
				<div class="info">
					<span><button style="border: none; background-color: none; font-size: 8px;" onclick="location.href='#'">고객 센터</button></span>
				</div>
				<div style="text-align: center; margin-top: 5%;">
					<button class="btn btn-outline-dark w-25 py-2" type="submit" name="member_situation" value="가입">회원가입</button>
					<button class="btn btn-outline-dark w-25 py-2" type="button" style="margin-left: 10%" onclick=history.go(-1);>취소</button>
				</div>
			</form>

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