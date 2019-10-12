package com.inhatc.vo;

public class SignupVO {
	private String id;
	private String pw;
	private String name;
	private String email;
	private String address;
	private int pnum;
	
	public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    
    public String getPw() {
        return pw;
    }
    public void setPw(String pw) {
        this.pw = pw;
    }
    
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    public int getPnum() {
        return pnum;
    }
    public void setPnum(int pnum) {
        this.pnum = pnum;
    }
}