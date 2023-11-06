<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SSB Layout</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
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
    <!-- header 끝 -->\

    <div id="login_wrap">
        <div class="main-container">

            <div class="form-container">
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
                    <div class="info">
                        <span><button style="border: none; background-color: transparent; font-size: 12px; border: none;">아이디 찾기</button></span>
                        <span>&nbsp;</span>
                        <span><button style="border: none; background-color: transparent; font-size: 12px; border: none;" onclick="goToCenter();">비밀번호 찾기</button></span>
                        <span>&nbsp;</span>
                        <span><button style="border: none; background-color: transparent; font-size: 12px; border: none;">회원가입</button></span>
                    </div>
                    <div >
                        <button class="login-button-custom" type="submit">로그인</button>
                    </div>
                </form>
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
                                    window.location.href = 'http://127.0.0.1:5500/3teamProject/src/main/webapp/templete/home/retouch.html';
                                },
                                fail: function (error) {
                                    console.log(error);
                                }
                            });
                        }
                    </script>
                    <a href="https://nid.naver.com/nidlogin.login?mode=form&url=https://www.naver.com/">
                        <img src="../img/naver_login.png" />
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="/js/active.js"></script>
</body>
</html>
