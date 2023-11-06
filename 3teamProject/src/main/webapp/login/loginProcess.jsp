<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Process</title>
</head>
<body>
    <%
        String member_user_id = request.getParameter("username");
        String member_pw = request.getParameter("password");
        
        com.itwillbs.ssb.db.loginDAO dao = new com.itwillbs.ssb.db.loginDAO();
        boolean loginResult = dao.login(member_user_id, member_pw);
        
        if (loginResult) {
    %>
            <script>
                alert("로그인 성공");
                location.replace("http://www.naver.com");
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

