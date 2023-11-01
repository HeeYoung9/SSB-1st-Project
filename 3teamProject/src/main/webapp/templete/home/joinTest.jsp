<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="/css/basic.css" rel="stylesheet"/>
</head>



    <!--  -------------------------------------------탑 컨테이너 넣는 곳 ---------------------------------------------- -->
    <div class="container-fluid p3 bg-black">


        <!-------------------  로고 넣는 곳 시작 --------------->
        <div class="logo">
          aa
        </div>
        <!------------------  로고 넣는 곳  끝----------------->

    </div>
    <!--  -------------------------------------------탑 컨테이너 끝 ---------------------------------------------- -->

    <!---------------------------left-panel 시작---------------------------------->
    <div class="left-panel">

    </div>

    <!-- 메인 컨테이너 -->
    <div class="main-container" style="width: 70%; margin-top: 5%;">

      <div class="form-container" style="margin-left:45%">
        <main class="form-signin w-100 m-auto">
          <form action="./MemberJoinAction.me" method="post">
            <h1 class="h3 mb-3 fw-normal">회원가입</h1>
        
            <div class="form-floating">
              <input type="text" class="form-control" id="floatingInput" placeholder="ID">
              <label for="floatingInput">아이디</label>
            </div>
            <div class="form-floating">
              <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
              <label for="floatingPassword">비밀번호</label>
            </div>
            <div class="info">
              <span><button style="border: none; background-color: none; font-size: 8px;">아이디가 기억나지 않아요.</button></span>
              <span><button style="border: none; background-color: none; font-size: 8px;" onclick="goToCenter();">고객 센터.</button></span>
          </div>
            <div style="margin-left:20%; margin-top:5%">
              <button class="btn btn-primary w-25 py-2" type="submit">로그인</button>
              <button class="btn btn-primary w-25 py-2" type="button" style="margin-left:10%" onclick=history.go(-1);>취소</button>
  
            </div>
          </form>
        </main>
      </div>
      
    </div><!-- 메인 컨테이너-->

  </div><!---------------------------left-panel 종료---------------------------------->


  <br>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="/js/active.js"></script>
</body>

</html>