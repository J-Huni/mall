package com.inhatc.vo;

import java.util.Date;

public class BuyVO {	
	private int b_no;
	private String id;
	private Date b_date;
	private int b_totprice;
	private int b_amount;
	private int p_no;
	private String b_address;
	private String b_name;
	private String b_pnum;
	
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}

	public int getB_amount() {
		return b_amount;
	}
	public void setB_amount(int b_amount) {
		this.b_amount = b_amount;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getB_address() {
		return b_address;
	}
	public void setB_address(String b_address) {
		this.b_address = b_address;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getB_pnum() {
		return b_pnum;
	}
	public void setB_pnum(String b_pnum) {
		this.b_pnum = b_pnum;
	}
	public int getB_totprice() {
		return b_totprice;
	}
	public void setB_totprice(int b_totprice) {
		this.b_totprice = b_totprice;
	}
}