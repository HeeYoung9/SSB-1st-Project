<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SSB Layout</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/login.css" rel="stylesheet">
</head>
<body>
    <!-- header 시작 -->
    <header class="header">
        <div class="logo">
            <img src="../img/SSB_gold.png" style="width: 200px;">
        </div>
        <div>
            <button class="login-button">메인페이지</button>
            <button class="login-button">장바구니</button>
        </div>
    </header><br>
    <!-- header 끝 -->

    <div id="login_wrap">
        <div class="main-container">

            <div class="form-container" style="width: 380px;" >
                <h1 class="h3 mb-3 fw-normal">로그인</h1>
                <form action="loginProcess.jsp" method="POST">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingInput" name="member_user_id" placeholder="ID">
                        <label for="floatingInput">아이디</label>
                    </div>
                    <div class="form-floating">
                        <input type="password" class="form-control" id="floatingPassword" name="member_pw" placeholder="Password">
                        <label for="floatingPassword">비밀번호</label>
                    </div>
                    
                    <div >
                        <button class="login-button-custom" type="submit">로그인</button>
                    </div>
                </form>
                <div class="info">
                    <span>
					<button style="border: none; background-color: transparent; font-size: 12px; border: none;" onclick="window.open('../findID/findID.jsp', '_blank')">아이디 찾기</button>
					</span>
					<span>&nbsp;</span>
					<span>
					<button style="border: none; background-color: transparent; font-size: 12px; border: none;" onclick="window.open('../findPassword/findPassword.jsp', '_blank')">비밀번호 찾기</button>
					</span>
					<span>&nbsp;</span>
                        <button style="border: none; background-color: transparent; font-size: 12px; border: none;">
                            <a href="/3teamProject/join/join.jsp">회원가입</a>
                        </button>
                    </span>
                </div>

                <br>
				<div class="d-grid gap-2" style="text-align: center;">
                    <a href="javascript:kakaoLogin();"><img src="../img/kakao_login.png" alt="카카오계정 로그인" /></a>
                    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
                    <script>
                        window.Kakao.init('7dab86842cbd0450f16b4b7691565447');
                        function kakaoLogin() {
                            window.Kakao.Auth.login({
                                scope: 'profile_nickname',
                                success: function (response) {
                                    console.log(response);
                                    window.Kakao.API.request({
                                        url: '/v2/user/me',
                                        success: (res) => {
                                            const kakao_account = res.kakao_account;
                                            console.log(kakao_account);
                                        }
                                    });
                                    window.location.href = './main.in';
                                },
                                fail: function (error) {
                                    console.log(error);
                                }
                            });
                        }
                    </script>
                    <a href="https://accounts.google.com/o/oauth2/v2/auth?c lient_id=253324653095-4p0h7jpcqct6512k21j23k72qkphd812.apps.googleusercontent.com&redirect_uri=./main.in&response_type=code&scope=openid%20email%20profile">
    				<img src="../img/google_login.png" alt="구글 계정 로그인" /> <!-- 여기서 임시로 리다이렉트할 주소를 네이버로 해뒀습니다. 메인페이지 주소를 추후에 google developer에서 api 관리에 들어가서 수정할수 있습니다. -->
					</a>
					<a href="https://nid.naver.com/nidlogin.login?mode=form&url=https://www.naver.com/">
                    <img src="../img/naver_login.png" />
                    </a>

                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/active.js"></script>
</body>
</html>
