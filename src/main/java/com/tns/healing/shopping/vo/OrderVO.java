package com.tns.healing.shopping.vo;

public class OrderVO {
	private int PRODUCT_NUM;
	private String PRODUCT_NAME;
	private int ORDER_AMOUNT;
	private int ORDER_PRICE;
	private String ORDER_NAME;
	private String ORDER_POSTCODE;
	private String ORDER_JIBUNADDRESS;
	private String ORDER_DETAILADDRESS;
	private String ORDER_PHONE;
	private String ORDER_REQUIREMENT;
	
	public int getPRODUCT_NUM() {
		return PRODUCT_NUM;
	}
	public void setPRODUCT_NUM(int pRODUCT_NUM) {
		PRODUCT_NUM = pRODUCT_NUM;
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
	public String getORDER_NAME() {
		return ORDER_NAME;
	}
	public void setORDER_NAME(String oRDER_NAME) {
		ORDER_NAME = oRDER_NAME;
	}
	public String getORDER_POSTCODE() {
		return ORDER_POSTCODE;
	}
	public void setORDER_POSTCODE(String oRDER_POSTCODE) {
		ORDER_POSTCODE = oRDER_POSTCODE;
	}
	public String getORDER_JIBUNADDRESS() {
		return ORDER_JIBUNADDRESS;
	}
	public void setORDER_JIBUNADDRESS(String oRDER_JIBUNADDRESS) {
		ORDER_JIBUNADDRESS = oRDER_JIBUNADDRESS;
	}
	public String getORDER_DETAILADDRESS() {
		return ORDER_DETAILADDRESS;
	}
	public void setORDER_DETAILADDRESS(String oRDER_DETAILADDRESS) {
		ORDER_DETAILADDRESS = oRDER_DETAILADDRESS;
	}
	public String getORDER_PHONE() {
		return ORDER_PHONE;
	}
	public void setORDER_PHONE(String oRDER_PHONE) {
		ORDER_PHONE = oRDER_PHONE;
	}
	public String getORDER_REQUIREMENT() {
		return ORDER_REQUIREMENT;
	}
	public void setORDER_REQUIREMENT(String oRDER_REQUIREMENT) {
		ORDER_REQUIREMENT = oRDER_REQUIREMENT;
	}
	
	@Override
	public String toString() {
		return "OrderVO [PRODUCT_NAME=" + PRODUCT_NAME + ", ORDER_AMOUNT=" + ORDER_AMOUNT + ", ORDER_PRICE="
				+ ORDER_PRICE + ", ORDER_NAME=" + ORDER_NAME + ", ORDER_POSTCODE=" + ORDER_POSTCODE + ", ORDER_ADDRESS="
				+ ORDER_JIBUNADDRESS + ", ORDER_DETAILADDRESS=" + ORDER_DETAILADDRESS + ", ORDER_PHONE=" + ORDER_PHONE
				+ ", ORDER_REQUIREMENT=" + ORDER_REQUIREMENT + "]";
	}
	
	
}
