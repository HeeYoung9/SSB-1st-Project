package com.itwillbs.ssb.db;

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
        Context initCTX = new InitialContext();
        DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/ssb");
        con = ds.getConnection();
        System.out.println("DAO : 디비연결 성공!!");
        System.out.println("DAO : " + con);
        return con;
    }

    public void CloseDB() {
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
            sql = "SELECT * FROM LOGIN WHERE member_user_id = ? AND member_pw = ?";
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
            CloseDB();
        }
        return result;
    }

    // 다른 메서드 추가
    // ...

    public static void main(String[] args) {
        loginDAO dao = new loginDAO();
        // DAO 객체를 사용하여 원하는 작업 수행
    }
}
