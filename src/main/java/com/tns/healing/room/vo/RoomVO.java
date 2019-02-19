package com.tns.healing.room.vo;

import org.springframework.web.multipart.MultipartFile;

public class RoomVO {
	private int COMPANY_NUM;
	private int ROOM_NUM;
	private int ROOM_SEQ;
	private String ROOM_NAME;
	private String ROOM_LIMIT;
	private String ROOM_PRICE;

	private MultipartFile ROOM_IMAGE;
	private String ROOM_IMAGENAME;
	
	@Override
	public String toString() {
		return "RoomVO [COMPANY_NUM=" + COMPANY_NUM + ", ROOM_NUM=" + ROOM_NUM + ", ROOM_SEQ=" + ROOM_SEQ
				+ ", ROOM_NAME=" + ROOM_NAME + ", ROOM_LIMIT=" + ROOM_LIMIT + ", ROOM_PRICE=" + ROOM_PRICE
				+ ", ROOM_IMAGE=" + ROOM_IMAGE + ", ROOM_IMAGENAME=" + ROOM_IMAGENAME + "]";
	}
	public int getCOMPANY_NUM() {
		return COMPANY_NUM;
	}
	public void setCOMPANY_NUM(int cOMPANY_NUM) {
		COMPANY_NUM = cOMPANY_NUM;
	}
	public int getROOM_NUM() {
		return ROOM_NUM;
	}
	public void setROOM_NUM(int rOOM_NUM) {
		ROOM_NUM = rOOM_NUM;
	}
	
	public int getROOM_SEQ() {
		return ROOM_SEQ;
	}

	public void setROOM_SEQ(int rOOM_SEQ) {
		ROOM_SEQ = rOOM_SEQ;
	}

	public String getROOM_NAME() {
		return ROOM_NAME;
	}
	public void setROOM_NAME(String rOOM_NAME) {
		ROOM_NAME = rOOM_NAME;
	}
	public String getROOM_LIMIT() {
		return ROOM_LIMIT;
	}
	public void setROOM_LIMIT(String rOOM_LIMIT) {
		ROOM_LIMIT = rOOM_LIMIT;
	}
	public String getROOM_PRICE() {
		return ROOM_PRICE;
	}
	public void setROOM_PRICE(String rOOM_PRICE) {
		ROOM_PRICE = rOOM_PRICE;
	}
	public MultipartFile getROOM_IMAGE() {
		return ROOM_IMAGE;
	}
	public void setROOM_IMAGE(MultipartFile rOOM_IMAGE) {
		ROOM_IMAGE = rOOM_IMAGE;
	}
	public String getROOM_IMAGENAME() {
		return ROOM_IMAGENAME;
	}
	public void setROOM_IMAGENAME(String rOOM_IMAGENAME) {
		ROOM_IMAGENAME = rOOM_IMAGENAME;
	}

	
}
