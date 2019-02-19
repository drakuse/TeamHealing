package com.tns.healing.shopping.vo;

import org.springframework.web.multipart.MultipartFile;

public class ShoppingVO {
	private String PRODUCT_NAME; // 상품명
	private int PRODUCT_NUM; // 상품 번호
	private int PRODUCT_PRICE; // 상품 가격
	private int PRODUCT_AMOUNT; // 상품 총 판매량
	private String PRODUCT_IMAGE_NAME; // 파일이름
	private MultipartFile PRODUCT_IMAGE; // 파일
	private String PRODUCT_INFO;// 상품정보
	private String PRODUCT_CATEGORY; // 카테고리

	@Override
	public String toString() {
		return "ShoppingVO [PRODUCT_NAME=" + PRODUCT_NAME + ", PRODUCT_NUM=" + PRODUCT_NUM + ", PRODUCT_PRICE="
				+ PRODUCT_PRICE + ", PRODUCT_AMOUNT=" + PRODUCT_AMOUNT + ", PRODUCT_IMAGE_NAME=" + PRODUCT_IMAGE_NAME
				+ ", PRODUCT_IMAGE=" + PRODUCT_IMAGE + ", PRODUCT_CATEGORY=" + PRODUCT_CATEGORY + "]";
	}

	public String getPRODUCT_NAME() {
		return PRODUCT_NAME;
	}

	public void setPRODUCT_NAME(String pRODUCT_NAME) {
		PRODUCT_NAME = pRODUCT_NAME;
	}

	public int getPRODUCT_NUM() {
		return PRODUCT_NUM;
	}

	public void setPRODUCT_NUM(int pRODUCT_NUM) {
		PRODUCT_NUM = pRODUCT_NUM;
	}

	public int getPRODUCT_PRICE() {
		return PRODUCT_PRICE;
	}

	public void setPRODUCT_PRICE(int pRODUCT_PRICE) {
		PRODUCT_PRICE = pRODUCT_PRICE;
	}

	public int getPRODUCT_AMOUNT() {
		return PRODUCT_AMOUNT;
	}

	public void setPRODUCT_AMOUNT(int pRODUCT_AMOUNT) {
		PRODUCT_AMOUNT = pRODUCT_AMOUNT;
	}

	public String getPRODUCT_IMAGE_NAME() {
		return PRODUCT_IMAGE_NAME;
	}

	public void setPRODUCT_IMAGE_NAME(String pRODUCT_IMAGE_NAME) {
		PRODUCT_IMAGE_NAME = pRODUCT_IMAGE_NAME;
	}

	public MultipartFile getPRODUCT_IMAGE() {
		return PRODUCT_IMAGE;
	}

	public void setPRODUCT_IMAGE(MultipartFile pRODUCT_IMAGE) {
		PRODUCT_IMAGE = pRODUCT_IMAGE;
	}

	public String getPRODUCT_CATEGORY() {
		return PRODUCT_CATEGORY;
	}

	public void setPRODUCT_CATEGORY(String pRODUCT_CATEGORY) {
		PRODUCT_CATEGORY = pRODUCT_CATEGORY;
	}

	public String getPRODUCT_INFO() {
		return PRODUCT_INFO;
	}

	public void setPRODUCT_INFO(String pRODUCT_INFO) {
		PRODUCT_INFO = pRODUCT_INFO;
	}

}
