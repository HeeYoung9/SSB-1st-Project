<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>login Process</title>
</head>
<body>
    <%
        String member_user_id = request.getParameter("member_user_id"); // 수정된 부분
        String member_pw = request.getParameter("member_pw"); // 수정된 부분
        
        com.ssb.login.db.loginDAO dao = new com.ssb.login.db.loginDAO(); // 패키지 경로 수정
        boolean loginResult = dao.login(member_user_id, member_pw);
        
        if (loginResult) {
    %>
            <script>
                alert("로그인 성공");
                location.replace("http://localhost:8080/3teamProject/main/main_page/main.jsp");
            </script>
    <%
        } else {
    %>
            <script>
                alert("로그인 실패");
                location.replace("login.jsp");
            </script>
    <%
        }
    %>
</body>
</html>
