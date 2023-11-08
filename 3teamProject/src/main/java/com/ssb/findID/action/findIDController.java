package com.ssb.findID.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.findID.db.findIDDAO;

@WebServlet("/findIDController")
public class findIDController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String code = request.getParameter("code");

        findIDDAO dao = new findIDDAO(); // DAO 인스턴스 한 번만 생성

        if (email != null && !email.equals("")) {
            // 이메일 전송 코드
            boolean emailSent = dao.sendEmail(email);

            if (emailSent) {
                response.getWriter().write("이메일 전송 완료");
            } else {
                response.getWriter().write("이메일 전송 실패");
            }
        } else if (code != null && !code.equals("")) {
            // 인증 코드 확인 및 처리 코드
            boolean codeValid = dao.checkCode(code);

            if (codeValid) {
                response.getWriter().write("아이디 찾기가 완료되었습니다.");
            } else {
                response.getWriter().write("인증번호가 일치하지 않습니다.");
            }
        }
    }
}
