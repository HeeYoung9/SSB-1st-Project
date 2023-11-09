package com.itwillbs.ssb.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class findIDDAO {

    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private String sql = "";

    // 데이터베이스 연결을 위한 메서드
    private Connection getCon() throws Exception {
        try {
            Context initCTX = new InitialContext();
            DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/ssb");
            con = ds.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    // 데이터베이스 연결 자원 해제를 위한 메서드
    public void closeDB() {
        try {
            if (rs != null)
                rs.close();
            if (pstmt != null)
                pstmt.close();
            if (con != null)
                con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

 // 이메일 전송을 위한 메서드
    public boolean sendEmail(String email) {
        boolean result = false;
        try {
            con = getCon();
            String randomCode = generateRandomCode();
            // 이메일 전송 코드 작성
            // 이메일 전송 성공 시 result 값을 true로 변경

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeDB();
        }
        return result;
    }

    // 인증 코드 확인을 위한 메서드
    public boolean checkCode(String code) {
        boolean result = false;
        try {
            con = getCon();
            // 인증 코드 확인 로직을 여기에 추가

            result = true; // 인증 코드가 유효할 경우 true로 변경
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeDB();
        }
        return result;
    }

    // 임의의 인증 코드 생성을 위한 메서드
    private String generateRandomCode() {
        Random random = new Random();
        int code = random.nextInt(100000); // 0부터 99999 사이의 난수 생성
        return String.format("%05d", code); // 다섯 자리로 맞추기 위해 포맷팅
    }
}
