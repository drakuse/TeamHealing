package com.tns.healing.room.vo;

public class RoomCountVO {
	private String MEMBER_ID;
	private int ROOM_REVIEW_NUM;
	private int ROOM_LIKE;
	private int ROOM_REFUSE;

	@Override
	public String toString() {
		return "RoomCountVO [MEMBER_ID=" + MEMBER_ID + ", ROOM_REVIEW_NUM=" + ROOM_REVIEW_NUM + ", ROOM_LIKE="
				+ ROOM_LIKE + ", ROOM_REFUSE=" + ROOM_REFUSE + "]";
	}

	public String getMEMBER_ID() {
		return MEMBER_ID;
	}

	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}

	public int getROOM_REVIEW_NUM() {
		return ROOM_REVIEW_NUM;
	}

	public void setROOM_REVIEW_NUM(int rOOM_REVIEW_NUM) {
		ROOM_REVIEW_NUM = rOOM_REVIEW_NUM;
	}

	public int getROOM_LIKE() {
		return ROOM_LIKE;
	}

	public void setROOM_LIKE(int rOOM_LIKE) {
		ROOM_LIKE = rOOM_LIKE;
	}

	public int getROOM_REFUSE() {
		return ROOM_REFUSE;
	}

	public void setROOM_REFUSE(int rOOM_REFUSE) {
		ROOM_REFUSE = rOOM_REFUSE;
	}

}
