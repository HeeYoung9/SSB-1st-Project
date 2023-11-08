package com.ssb.login.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.util.Action;
import com.ssb.util.ActionForward;

@WebServlet("*.lg ")
public class loginController extends HttpServlet {

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestURI = request.getRequestURI(); // 클라이언트가 요청한 URI
        String contextPath = request.getContextPath(); // 현재 웹 애플리케이션의 컨텍스트 경로
        String command = requestURI.substring(contextPath.length()); // 컨텍스트 경로 이후의 요청 URI

        ActionForward forward = null; // ActionForward 객체 초기화

        if (command.equals("/login.lg")) {
            forward = new ActionForward(); // ActionForward 객체 생성
            forward.setPath("./login/login.jsp"); // login.jsp로 경로 설정
            forward.setRedirect(false); // forward 방식 설정
        } else if (command.equals("/loginProcess.lg")) {
            forward = new ActionForward(); // ActionForward 객체 생성
            forward.setPath("./login/loginProcess.jsp"); // loginProcess.jsp로 경로 설정
            forward.setRedirect(false); // forward 방식 설정
        }

        if (forward != null) { // forward가 설정되어 있는 경우
            if (forward.isRedirect()) { // redirect 방식일 경우
                response.sendRedirect(forward.getPath()); // 지정된 경로로 redirect
            } else { // forward 방식일 경우
                RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath()); // RequestDispatcher 객체 생성
                dispatcher.forward(request, response); // 지정된 경로로 forward
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response); // doProcess 메소드 호출
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response); // doProcess 메소드 호출
    }
}
