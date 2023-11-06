package com.itwillbs.ssb.db;

public class loginDTO {
    private String member_user_id;
    private String member_pw;

    public String getMember_user_id() {
        return member_user_id;
    }

    public void setMember_user_id(String member_user_id) {
        this.member_user_id = member_user_id;
    }

    public String getMember_pw() {
        return member_pw;
    }

    public void setMember_pw(String member_pw) {
        this.member_pw = member_pw;
    }

    @Override
    public String toString() {
        return "loginDTO [member_user_id=" + member_user_id + ", member_pw=" + member_pw + "]";
    }
}
