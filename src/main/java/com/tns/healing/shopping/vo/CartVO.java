package com.tns.healing.shopping.vo;

import java.sql.Date;

public class CartVO {
	private int ORDER_NUM;
	private int PRODUCT_NUM;
	private String MEMBER_ID;
	private String PRODUCT_NAME;
	private int PRODUCT_PRICE;
	private int ORDER_AMOUNT;
	private int ORDER_PRICE;
	private Date ORDER_DATE;
	private int ORDER_DIVISION;
	
	@Override
	public String toString() {
		return "CartVO [ORDER_NUM=" + ORDER_NUM + ", PRODUCT_NUM=" + PRODUCT_NUM + ", MEMBER_ID=" + MEMBER_ID
				+ ", PRODUCT_NAME=" + PRODUCT_NAME + ", PRODUCT_PRICE=" + PRODUCT_PRICE + ", ORDER_AMOUNT="
				+ ORDER_AMOUNT + ", ORDER_PRICE=" + ORDER_PRICE + ", ORDER_DATE=" + ORDER_DATE + ", ORDER_DIVISION="
				+ ORDER_DIVISION + "]";
	}
	public int getORDER_NUM() {
		return ORDER_NUM;
	}
	public void setORDER_NUM(int oRDER_NUM) {
		ORDER_NUM = oRDER_NUM;
	}
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
	public String getPRODUCT_NAME() {
		return PRODUCT_NAME;
	}
	public void setPRODUCT_NAME(String pRODUCT_NAME) {
		PRODUCT_NAME = pRODUCT_NAME;
	}
	public int getORDER_AMOUNT() {
		return ORDER_AMOUNT;
	}
	public void setORDER_AMOUNT(int oRDER_AMOUNT) {
		ORDER_AMOUNT = oRDER_AMOUNT;
	}
	public int getORDER_PRICE() {
		return ORDER_PRICE;
	}
	public void setORDER_PRICE(int oRDER_PRICE) {
		ORDER_PRICE = oRDER_PRICE;
	}
	public Date getORDER_DATE() {
		return ORDER_DATE;
	}
	public void setORDER_DATE(Date oRDER_DATE) {
		ORDER_DATE = oRDER_DATE;
	}
	public int getORDER_DIVISION() {
		return ORDER_DIVISION;
	}
	public void setORDER_DIVISION(int oRDER_DIVISION) {
		ORDER_DIVISION = oRDER_DIVISION;
	}
	public int getPRODUCT_PRICE() {
		return PRODUCT_PRICE;
	}
	public void setPRODUCT_PRICE(int pRODUCT_PRICE) {
		PRODUCT_PRICE = pRODUCT_PRICE;
	}
	
}
