package com.tns.healing.board.vo;

public class BoardCountVO {
	private String MEMBER_ID; // 회원 아이디
	private int INFO_NUM; // 원본글 번호
	private int INFO_REVIEW_NUM; // 댓글 번호
	private int INFO_LIKE; // 추천
	private int INFO_REPORT; // 신고

	@Override
	public String toString() {
		return "BoardCount [MEMBER_ID=" + MEMBER_ID + ", INFO_NUM=" + INFO_NUM + ", INFO_REVIEW_NUM=" + INFO_REVIEW_NUM
				+ ", INFO_LIKE=" + INFO_LIKE + ", INFO_REPORT=" + INFO_REPORT + "]";
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

	public int getINFO_REVIEW_NUM() {
		return INFO_REVIEW_NUM;
	}

	public void setINFO_REVIEW_NUM(int iNFO_REVIEW_NUM) {
		INFO_REVIEW_NUM = iNFO_REVIEW_NUM;
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

}
