<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>update</title>
    <script type="text/javascript">
        function check() {
            var pw = document.fr.pw.value;
            if (pw == "") {
                alert('비밀번호를 입력하세요!');
                document.fr.pw.focus();
                return false;
            }
        }
    </script>
</head>
<body>
    <h1>update</h1>
    <fieldset>
        <legend>회원정보 수정</legend>
        <form action="./updateAction.ud" method="post" name="fr" onsubmit="return check();">
            이름 : <input type="text" name="member_name" value="${dto.getMember_name()}"><br>
            전화번호 : <input type="text" name="member_phone" value="${dto.getMember_phone()}">
            비밀번호 : <input type="password" name="member_pw" value="${dto.getMember_pw()}"> <br>
            이메일 : <input type="email" name="member_email" value="${dto.getMember_email()}"><br>
            <input type="hidden" name="member_user_id" value="${sessionScope.id}">
            <hr>
            <input type="submit" value="수정완료">
        </form>
    </fieldset>
</body>
</html>
