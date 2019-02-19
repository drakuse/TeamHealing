package com.tns.healing.board.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;


public class BoardVO {
	private int INFO_NUM; // 정보글 번호
	private String MEMBER_ID; // 회원 아이디
	private String INFO_TITLE; // 정보글 제목
	private String INFO_CONTENT; // 정보글 내용
	private int INFO_HIT; // 정보글 조회수
	private int INFO_LIKE; // 정보글 추천
	private int INFO_REPORT; // 정보글 신고
	private Date INFO_DATE; // 정보글 등록날짜
	private String INFO_IMAGE_NAME; // 파일이름
	private MultipartFile INFO_IMAGE; // 파일

	@Override
	public String toString() {
		return "BoardVO [INFO_NUM=" + INFO_NUM + ", MEMBER_ID=" + MEMBER_ID + ", INFO_TITLE=" + INFO_TITLE
				+ ", INFO_CONTENT=" + INFO_CONTENT + ", INFO_HIT=" + INFO_HIT + ", INFO_LIKE=" + INFO_LIKE
				+ ", INFO_REPORT=" + INFO_REPORT + ", INFO_DATE=" + INFO_DATE + ", INFO_IMAGE_NAME=" + INFO_IMAGE_NAME
				+ ", INFO_IMAGE=" + INFO_IMAGE + "]";
	}

	public int getINFO_NUM() {
		return INFO_NUM;
	}

	public void setINFO_NUM(int iNFO_NUM) {
		INFO_NUM = iNFO_NUM;
	}

	public String getMEMBER_ID() {
		return MEMBER_ID;
	}

	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}

	public String getINFO_TITLE() {
		return INFO_TITLE;
	}

	public void setINFO_TITLE(String iNFO_TITLE) {
		INFO_TITLE = iNFO_TITLE;
	}

	public String getINFO_CONTENT() {
		return INFO_CONTENT;
	}

	public void setINFO_CONTENT(String iNFO_CONTENT) {
		INFO_CONTENT = iNFO_CONTENT;
	}

	public int getINFO_LIKE() {
		return INFO_LIKE;
	}

	public void setINFO_LIKE(int iNFO_LIKE) {
		INFO_LIKE = iNFO_LIKE;
	}

	public int getINFO_REPORT() {
		return INFO_REPORT;
	}

	public void setINFO_REPORT(int iNFO_REPORT) {
		INFO_REPORT = iNFO_REPORT;
	}

	public Date getINFO_DATE() {
		return INFO_DATE;
	}

	public void setINFO_DATE(Date iNFO_DATE) {
		INFO_DATE = iNFO_DATE;
	}

	public String getINFO_IMAGE_NAME() {
		return INFO_IMAGE_NAME;
	}

	public void setINFO_IMAGE_NAME(String iNFO_IMAGE_NAME) {
		INFO_IMAGE_NAME = iNFO_IMAGE_NAME;
	}

	public MultipartFile getINFO_IMAGE() {
		return INFO_IMAGE;
	}

	public void setINFO_IMAGE(MultipartFile iNFO_IMAGE) {
		INFO_IMAGE = iNFO_IMAGE;
	}

	public int getINFO_HIT() {
		return INFO_HIT;
	}

	public void setINFO_HIT(int iNFO_HIT) {
		INFO_HIT = iNFO_HIT;
	}

}
