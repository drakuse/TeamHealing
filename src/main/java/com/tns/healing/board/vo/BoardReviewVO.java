package com.tns.healing.board.vo;

import java.sql.Date;

public class BoardReviewVO {
	private int INFO_NUM; // 원본 글 번호
	private String MEMBER_ID; // 회원 아이디
	private String INFO_REVIEW_CONTENT; // 댓글 내용
	private int INFO_REVIEW_NUM; // 댓글 번호
	private int INFO_REVIEW_LEV; // 댓글 레벨
	private int INFO_REVIEW_SEQ; // 댓글 시퀀스
	private int INFO_REVIEW_LIKE; // 댓글 추천
	private int INFO_REVIEW_REPORT; // 댓글 신고
	private Date INFO_REVIEW_DATE; // 댓글 등록 날짜

	@Override
	public String toString() {
		return "BoardReviewVO [INFO_NUM=" + INFO_NUM + ", MEMBER_ID=" + MEMBER_ID + ", INFO_REVIEW_CONTENT="
				+ INFO_REVIEW_CONTENT + ", INFO_REVIEW_NUM=" + INFO_REVIEW_NUM + ", INFO_REVIEW_LEV=" + INFO_REVIEW_LEV
				+ ", INFO_REVIEW_SEQ=" + INFO_REVIEW_SEQ + ", INFO_REVIEW_LIKE=" + INFO_REVIEW_LIKE
				+ ", INFO_REVIEW_REPORT=" + INFO_REVIEW_REPORT + ", INFO_REVIEW_DATE=" + INFO_REVIEW_DATE + "]";
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

	public String getINFO_REVIEW_CONTENT() {
		return INFO_REVIEW_CONTENT;
	}

	public void setINFO_REVIEW_CONTENT(String iNFO_REVIEW_CONTENT) {
		INFO_REVIEW_CONTENT = iNFO_REVIEW_CONTENT;
	}

	public int getINFO_REVIEW_NUM() {
		return INFO_REVIEW_NUM;
	}

	public void setINFO_REVIEW_NUM(int iNFO_REVIEW_NUM) {
		INFO_REVIEW_NUM = iNFO_REVIEW_NUM;
	}

	public int getINFO_REVIEW_LEV() {
		return INFO_REVIEW_LEV;
	}

	public void setINFO_REVIEW_LEV(int iNFO_REVIEW_LEV) {
		INFO_REVIEW_LEV = iNFO_REVIEW_LEV;
	}

	public int getINFO_REVIEW_SEQ() {
		return INFO_REVIEW_SEQ;
	}

	public void setINFO_REVIEW_SEQ(int iNFO_REVIEW_SEQ) {
		INFO_REVIEW_SEQ = iNFO_REVIEW_SEQ;
	}

	public int getINFO_REVIEW_LIKE() {
		return INFO_REVIEW_LIKE;
	}

	public void setINFO_REVIEW_LIKE(int iNFO_REVIEW_LIKE) {
		INFO_REVIEW_LIKE = iNFO_REVIEW_LIKE;
	}

	public int getINFO_REVIEW_REPORT() {
		return INFO_REVIEW_REPORT;
	}

	public void setINFO_REVIEW_REPORT(int iNFO_REVIEW_REPORT) {
		INFO_REVIEW_REPORT = iNFO_REVIEW_REPORT;
	}

	public Date getINFO_REVIEW_DATE() {
		return INFO_REVIEW_DATE;
	}

	public void setINFO_REVIEW_DATE(Date iNFO_REVIEW_DATE) {
		INFO_REVIEW_DATE = iNFO_REVIEW_DATE;
	}

}
