<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>loginProcess</title>
</head>
<body>
    <%
        String member_user_id = request.getParameter("member_user_id");
        String member_pw = request.getParameter("member_pw");
        
        com.itwillbs.ssb.db.loginProcessDAO dao = new com.itwillbs.ssb.db.loginProcessDAO();
        boolean loginResult = dao.login(member_user_id, member_pw);
        
        if (loginResult) {
    %>
            <script>
                alert("로그인 성공");
                window.location.href = "./Main.in"; // 로그인 성공 시 Main.in 페이지로 이동
            </script>
    <%
        } else {
    %>
            <script>
                alert("로그인 실패");
                window.location.href = "./login.lg"; // 로그인 실패 시 login.lg 페이지로 이동
            </script>
    <%
        }
    %>
</body>
</html>
