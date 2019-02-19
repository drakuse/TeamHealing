package com.tns.healing.shopping.vo;

public class MemberVO {
	private String MEMBER_ID;
	private String MEMBER_PASS;
	private String MEMBER_NAME;
	private int MEMBER_AGE;
	private String MEMBER_PHONE;
	private String MEMBER_EMAIL;
	private String MEMBER_ADDRESS;
	private int MEMBER_DIVISION;
	private String MEMBER_BUSINESS;
	private String MEMBER_COMPANY;
	
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getMEMBER_PASS() {
		return MEMBER_PASS;
	}
	public void setMEMBER_PASS(String mEMBER_PASS) {
		MEMBER_PASS = mEMBER_PASS;
	}
	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}
	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}
	public int getMEMBER_AGE() {
		return MEMBER_AGE;
	}
	public void setMEMBER_AGE(int mEMBER_AGE) {
		MEMBER_AGE = mEMBER_AGE;
	}
	public String getMEMBER_PHONE() {
		return MEMBER_PHONE;
	}
	public void setMEMBER_PHONE(String mEMBER_PHONE) {
		MEMBER_PHONE = mEMBER_PHONE;
	}
	public String getMEMBER_EMAIL() {
		return MEMBER_EMAIL;
	}
	public void setMEMBER_EMAIL(String mEMBER_EMAIL) {
		MEMBER_EMAIL = mEMBER_EMAIL;
	}
	public String getMEMBER_ADDRESS() {
		return MEMBER_ADDRESS;
	}
	public void setMEMBER_ADDRESS(String mEMBER_ADDRESS) {
		MEMBER_ADDRESS = mEMBER_ADDRESS;
	}
	public int getMEMBER_DIVISION() {
		return MEMBER_DIVISION;
	}
	public void setMEMBER_DIVISION(int mEMBER_DIVISION) {
		MEMBER_DIVISION = mEMBER_DIVISION;
	}
	public String getMEMBER_BUSINESS() {
		return MEMBER_BUSINESS;
	}
	public void setMEMBER_BUSINESS(String mEMBER_BUSINESS) {
		MEMBER_BUSINESS = mEMBER_BUSINESS;
	}
	public String getMEMBER_COMPANY() {
		return MEMBER_COMPANY;
	}
	public void setMEMBER_COMPANY(String mEMBER_COMPANY) {
		MEMBER_COMPANY = mEMBER_COMPANY;
	}
	@Override
	public String toString() {
		return "MemberVO [MEMBER_ID=" + MEMBER_ID + ", MEMBER_PASS=" + MEMBER_PASS + ", MEMBER_NAME=" + MEMBER_NAME
				+ ", MEMBER_AGE=" + MEMBER_AGE + ", MEMBER_PHONE=" + MEMBER_PHONE + ", MEMBER_EMAIL=" + MEMBER_EMAIL
				+ ", MEMBER_ADDRESS=" + MEMBER_ADDRESS + ", MEMBER_DIVISION=" + MEMBER_DIVISION + ", MEMBER_BUSINESS="
				+ MEMBER_BUSINESS + ", MEMBER_COMPANY=" + MEMBER_COMPANY + "]";
	}
	
	
}
