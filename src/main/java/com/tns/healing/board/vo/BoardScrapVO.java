package com.tns.healing.board.vo;

import java.util.Date;

public class BoardScrapVO {
	private String MEMBER_ID; // 회원 아이디
	private int INFO_NUM; // 원본글 번호
	private String INFO_TITLE; // 원본글 제목
	private Date INFO_SCRAP_DATE; // 스크랩한 날짜

	@Override
	public String toString() {
		return "BoardScrapVO [MEMBER_ID=" + MEMBER_ID + ", INFO_NUM=" + INFO_NUM + ", INFO_TITLE=" + INFO_TITLE
				+ ", INFO_SCRAP_DATE=" + INFO_SCRAP_DATE + "]";
	}

	public String getMEMBER_ID() {
		return MEMBER_ID;
	}

	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}

	public int getINFO_NUM() {
		return INFO_NUM;
	}

	public void setINFO_NUM(int iNFO_NUM) {
		INFO_NUM = iNFO_NUM;
	}

	public String getINFO_TITLE() {
		return INFO_TITLE;
	}

	public void setINFO_TITLE(String iNFO_TITLE) {
		INFO_TITLE = iNFO_TITLE;
	}

	public Date getINFO_SCRAP_DATE() {
		return INFO_SCRAP_DATE;
	}

	public void setINFO_SCRAP_DATE(Date iNFO_SCRAP_DATE) {
		INFO_SCRAP_DATE = iNFO_SCRAP_DATE;
	}

}
