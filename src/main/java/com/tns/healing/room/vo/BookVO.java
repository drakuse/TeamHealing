package com.tns.healing.room.vo;

import java.sql.Date;

public class BookVO {
	private int BOOK_NUM;
	private int ROOM_NUM;
	private String COMPANY_NUM;
	private String MEMBER_ID;
	private Date BOOK_CHECKIN;
	private Date BOOK_CHECKOUT;
	private int BOOK_PRICE;

	@Override
	public String toString() {
		return "BookVO [BOOK_NUM=" + BOOK_NUM + ", ROOM_NUM=" + ROOM_NUM + ", COMPANY_NUM=" + COMPANY_NUM
				+ ", MEMBER_ID=" + MEMBER_ID + ", BOOK_CHECKIN=" + BOOK_CHECKIN + ", BOOK_CHECKOUT=" + BOOK_CHECKOUT
				+ ", BOOK_PRICE=" + BOOK_PRICE + "]";
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

	public String getCOMPANY_NUM() {
		return COMPANY_NUM;
	}

	public void setCOMPANY_NUM(String cOMPANY_NUM) {
		COMPANY_NUM = cOMPANY_NUM;
	}

	public String getMEMBER_ID() {
		return MEMBER_ID;
	}

	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}

	public Date getBOOK_CHECKIN() {
		return BOOK_CHECKIN;
	}

	public void setBOOK_CHECKIN(Date bOOK_CHECKIN) {
		BOOK_CHECKIN = bOOK_CHECKIN;
	}

	public Date getBOOK_CHECKOUT() {
		return BOOK_CHECKOUT;
	}

	public void setBOOK_CHECKOUT(Date bOOK_CHECKOUT) {
		BOOK_CHECKOUT = bOOK_CHECKOUT;
	}

	public int getBOOK_PRICE() {
		return BOOK_PRICE;
	}

	public void setBOOK_PRICE(int bOOK_PRICE) {
		BOOK_PRICE = bOOK_PRICE;
	}

}
