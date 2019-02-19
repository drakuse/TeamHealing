package com.tns.healing.member.vo;

public class MemberVO {
	private String MEMBER_ID; // 회원 아이디
	private String MEMBER_PASS; // 회원 비밀번호
	private String MEMBER_NAME; // 회원 이름
	private int MEMBER_AGE; // 회원 나이
	private String MEMBER_PHONE; // 회원 전화번호
	private String MEMBER_EMAIL; // 회원 이메일
	private String MEMBER_POSTCODE; // 회원 우편주소
	private String MEMBER_JIBUNADDRESS; // 회원 지번주소
	private String MEMBER_DETAILADDRESS; // 회원 상세주소
	private int MEMBER_DIVISION; // 일반회원 1, 승인대기2, 업자회원3, 관리자4

	private String MEMBER_BUSINESS; // 업자회원 사업자번호
	private String MEMBER_COMPANY; // 업자회원 업소명

	@Override
	public String toString() {
		return "MemberVO [MEMBER_ID=" + MEMBER_ID + ", MEMBER_PASS=" + MEMBER_PASS + ", MEMBER_NAME=" + MEMBER_NAME
				+ ", MEMBER_AGE=" + MEMBER_AGE + ", MEMBER_PHONE=" + MEMBER_PHONE + ", MEMBER_EMAIL=" + MEMBER_EMAIL
				+ ", MEMBER_PSOTCODE=" + MEMBER_POSTCODE + ", MEMBER_JIBUNADDRESS=" + MEMBER_JIBUNADDRESS
				+ ", MEMBER_DETAILADDRESS=" + MEMBER_DETAILADDRESS + ", MEMBER_DIVISION=" + MEMBER_DIVISION
				+ ", MEMBER_BUSINESS=" + MEMBER_BUSINESS + ", MEMBER_COMPANY=" + MEMBER_COMPANY + "]";
	}

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

	public String getMEMBER_POSTCODE() {
		return MEMBER_POSTCODE;
	}

	public void setMEMBER_POSTCODE(String mEMBER_POSTCODE) {
		MEMBER_POSTCODE = mEMBER_POSTCODE;
	}

	public String getMEMBER_JIBUNADDRESS() {
		return MEMBER_JIBUNADDRESS;
	}

	public void setMEMBER_JIBUNADDRESS(String mEMBER_JIBUNADDRESS) {
		MEMBER_JIBUNADDRESS = mEMBER_JIBUNADDRESS;
	}

	public String getMEMBER_DETAILADDRESS() {
		return MEMBER_DETAILADDRESS;
	}

	public void setMEMBER_DETAILADDRESS(String mEMBER_DETAILADDRESS) {
		MEMBER_DETAILADDRESS = mEMBER_DETAILADDRESS;
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
}
