package com.tns.healing.room.vo;

import org.springframework.web.multipart.MultipartFile;

public class RoomReviewVO {
	private int ROOM_REVIEW_NUM;
	private int BOOK_NUM;
	private int ROOM_NUM;
	private int COMPANY_NUM;
	private String MEMBER_ID;
	private String ROOM_REVIEW_CONTENT;
	private MultipartFile ROOM_REVIEW_IMAGE;
	private String ROOM_REVIEW_IMAGENAME;
	private int ROOM_REVIEW_SCORE;
	private int ROOM_REVIEW_LIKE;
	private int ROOM_REVIEW_REPORT;

	@Override
	public String toString() {
		return "RoomReviewVO [ROOM_REVIEW_NUM=" + ROOM_REVIEW_NUM + ", BOOK_NUM=" + BOOK_NUM + ", ROOM_NUM=" + ROOM_NUM
				+ ", COMPANY_NUM=" + COMPANY_NUM + ", MEMBER_ID=" + MEMBER_ID + ", ROOM_REVIEW_CONTENT="
				+ ROOM_REVIEW_CONTENT + ", ROOM_REVIEW_IMAGE=" + ROOM_REVIEW_IMAGE + ", ROOM_REVIEW_IMAGENAME="
				+ ROOM_REVIEW_IMAGENAME + ", ROOM_REVIEW_SCORE=" + ROOM_REVIEW_SCORE + ", ROOM_REVIEW_LIKE="
				+ ROOM_REVIEW_LIKE + ", ROOM_REVIEW_REPORT=" + ROOM_REVIEW_REPORT + "]";
	}

	public int getROOM_REVIEW_NUM() {
		return ROOM_REVIEW_NUM;
	}

	public void setROOM_REVIEW_NUM(int rOOM_REVIEW_NUM) {
		ROOM_REVIEW_NUM = rOOM_REVIEW_NUM;
	}

	public int getBOOK_NUM() {
		return BOOK_NUM;
	}

	public void setBOOK_NUM(int bOOK_NUM) {
		BOOK_NUM = bOOK_NUM;
	}

	public int getROOM_NUM() {
		return ROOM_NUM;
	}

	public void setROOM_NUM(int rOOM_NUM) {
		ROOM_NUM = rOOM_NUM;
	}

	public int getCOMPANY_NUM() {
		return COMPANY_NUM;
	}

	public void setCOMPANY_NUM(int cOMPANY_NUM) {
		COMPANY_NUM = cOMPANY_NUM;
	}

	public String getMEMBER_ID() {
		return MEMBER_ID;
	}

	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}

	public String getROOM_REVIEW_CONTENT() {
		return ROOM_REVIEW_CONTENT;
	}

	public void setROOM_REVIEW_CONTENT(String rOOM_REVIEW_CONTENT) {
		ROOM_REVIEW_CONTENT = rOOM_REVIEW_CONTENT;
	}

	public MultipartFile getROOM_REVIEW_IMAGE() {
		return ROOM_REVIEW_IMAGE;
	}

	public void setROOM_REVIEW_IMAGE(MultipartFile rOOM_REVIEW_IMAGE) {
		ROOM_REVIEW_IMAGE = rOOM_REVIEW_IMAGE;
	}

	public String getROOM_REVIEW_IMAGENAME() {
		return ROOM_REVIEW_IMAGENAME;
	}

	public void setROOM_REVIEW_IMAGENAME(String rOOM_REVIEW_IMAGENAME) {
		ROOM_REVIEW_IMAGENAME = rOOM_REVIEW_IMAGENAME;
	}

	public int getROOM_REVIEW_SCORE() {
		return ROOM_REVIEW_SCORE;
	}

	public void setROOM_REVIEW_SCORE(int rOOM_REVIEW_SCORE) {
		ROOM_REVIEW_SCORE = rOOM_REVIEW_SCORE;
	}

	public int getROOM_REVIEW_LIKE() {
		return ROOM_REVIEW_LIKE;
	}

	public void setROOM_REVIEW_LIKE(int rOOM_REVIEW_LIKE) {
		ROOM_REVIEW_LIKE = rOOM_REVIEW_LIKE;
	}

	public int getROOM_REVIEW_REPORT() {
		return ROOM_REVIEW_REPORT;
	}

	public void setROOM_REVIEW_REPORT(int rOOM_REVIEW_REPORT) {
		ROOM_REVIEW_REPORT = rOOM_REVIEW_REPORT;
	}
}
