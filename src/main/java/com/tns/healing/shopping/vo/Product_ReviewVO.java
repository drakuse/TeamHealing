package com.tns.healing.shopping.vo;

import java.sql.Date;

public class Product_ReviewVO {
	private int PRODUCT_NUM;
	private String MEMBER_ID;
	private String PRODUCT_REVIEW_CONTENT;
	private int PRODUCT_REVIEW_NUM;
	private Date PRODUCT_REVIEW_DATE;
	private int PRODUCT_REVIEW_LIKE;
	private int PRODUCT_REVIEW_REPORT;
	private String PRODUCT_REVIEW_IMAGE;
	
	public int getPRODUCT_NUM() {
		return PRODUCT_NUM;
	}
	public void setPRODUCT_NUM(int pRODUCT_NUM) {
		PRODUCT_NUM = pRODUCT_NUM;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getPRODUCT_REVIEW_CONTENT() {
		return PRODUCT_REVIEW_CONTENT;
	}
	public void setPRODUCT_REVIEW_CONTENT(String pRODUCT_REVIEW_CONTENT) {
		PRODUCT_REVIEW_CONTENT = pRODUCT_REVIEW_CONTENT;
	}
	public int getPRODUCT_REVIEW_NUM() {
		return PRODUCT_REVIEW_NUM;
	}
	public void setPRODUCT_REVIEW_NUM(int pRODUCT_REVIEW_NUM) {
		PRODUCT_REVIEW_NUM = pRODUCT_REVIEW_NUM;
	}
	public Date getPRODUCT_REVIEW_DATE() {
		return PRODUCT_REVIEW_DATE;
	}
	public void setPRODUCT_REVIEW_DATE(Date pRODUCT_REVIEW_DATE) {
		PRODUCT_REVIEW_DATE = pRODUCT_REVIEW_DATE;
	}
	public int getPRODUCT_REVIEW_LIKE() {
		return PRODUCT_REVIEW_LIKE;
	}
	public void setPRODUCT_REVIEW_LIKE(int pRODUCT_REVIEW_LIKE) {
		PRODUCT_REVIEW_LIKE = pRODUCT_REVIEW_LIKE;
	}
	public int getPRODUCT_REVIEW_REPORT() {
		return PRODUCT_REVIEW_REPORT;
	}
	public void setPRODUCT_REVIEW_REPORT(int pRODUCT_REVIEW_REPORT) {
		PRODUCT_REVIEW_REPORT = pRODUCT_REVIEW_REPORT;
	}
	public String getPRODUCT_REVIEW_IMAGE() {
		return PRODUCT_REVIEW_IMAGE;
	}
	public void setPRODUCT_REVIEW_IMAGE(String pRODUCT_REVIEW_IMAGE) {
		PRODUCT_REVIEW_IMAGE = pRODUCT_REVIEW_IMAGE;
	}
	
	
}
