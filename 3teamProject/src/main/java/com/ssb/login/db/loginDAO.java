package com.ssb.login.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class loginDAO {

    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private String sql = "";

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

    // 로그인 메서드
    public boolean login(String member_user_id, String member_pw) {
        boolean result = false;
        try {
            con = getCon();
            sql = "SELECT * FROM member WHERE member_user_id = ? AND member_pw = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, member_user_id);
            pstmt.setString(2, member_pw);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                // 로그인 성공
                result = true;
            } else {
                // 로그인 실패
                result = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeDB();
        }
        return result;
    }
}
