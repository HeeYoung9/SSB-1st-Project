package com.itwillbs.ssb.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.util.ActionForward;

@WebServlet("/loginProcess.lg")
public class loginProcessController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String member_user_id = request.getParameter("member_user_id");
        String member_pw = request.getParameter("member_pw");

        com.itwillbs.ssb.db.loginDAO dao = new com.itwillbs.ssb.db.loginDAO();
        boolean loginResult = dao.login(member_user_id, member_pw);

        if (loginResult) {
            response.sendRedirect("./Main.in"); // 로그인 성공 시 Main.in 페이지로 이동
        } else {
            response.sendRedirect("./login.lg"); // 로그인 실패 시 login.lg 페이지로 이동
        }
    }
}
