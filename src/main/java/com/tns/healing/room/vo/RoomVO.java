package com.tns.healing.room.vo;

import org.springframework.web.multipart.MultipartFile;

public class RoomVO {
	private String MEMBER_COMPANY;
	private String ROOM_ADDRESS;
	private int ROOM_NUM;
	private String ROOM_NAME;
	private String ROOM_LIMIT;
	private String ROOM_PRICE;

	private MultipartFile ROOM_IMAGE;
	private String ROOM_IMAGENAME;

	public String getMEMBER_COMPANY() {
		return MEMBER_COMPANY;
	}

	public void setMEMBER_COMPANY(String mEMBER_COMPANY) {
		MEMBER_COMPANY = mEMBER_COMPANY;
	}

	public String getROOM_ADDRESS() {
		return ROOM_ADDRESS;
	}

	public void setROOM_ADDRESS(String rOOM_ADDRESS) {
		ROOM_ADDRESS = rOOM_ADDRESS;
	}

	public int getROOM_NUM() {
		return ROOM_NUM;
	}

	public void setROOM_NUM(int rOOM_NUM) {
		ROOM_NUM = rOOM_NUM;
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
