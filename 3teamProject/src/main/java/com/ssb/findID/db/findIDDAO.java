package com.ssb.findID.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class findIDDAO {

    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private String sql = " ";

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
            // 이메일 전송을 위한 코드 작성
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
            // 인증 코드 확인을 위한 코드 작성
            // 인증 코드가 유효할 경우 result 값을 true로 변경
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeDB();
        }
        return result;
    }
}
