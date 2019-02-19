package com.tns.healing.room.vo;

import java.sql.Date;

public class SearchVO {
	private String region;
	private String company_num;
	private String room_num;
	private String member_id;
	private Date checkIn;
	private Date checkOut;
	private String checkin;
	private String checkout;
	private String price;
	private String companyScore;
	private int page;

	@Override
	public String toString() {
		return "SearchVO [region=" + region + ", company_num=" + company_num + ", room_num=" + room_num + ", member_id="
				+ member_id + ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", checkin=" + checkin + ", checkout="
				+ checkout + ", price=" + price + ", companyScore=" + companyScore + ", page=" + page + "]";
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getCompany_num() {
		return company_num;
	}

	public void setCompany_num(String company_num) {
		this.company_num = company_num;
	}

	public String getRoom_num() {
		return room_num;
	}

	public void setRoom_num(String room_num) {
		this.room_num = room_num;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Date getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}

	public Date getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getCompanyScore() {
		return companyScore;
	}

	public void setCompanyScore(String companyScore) {
		this.companyScore = companyScore;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

}