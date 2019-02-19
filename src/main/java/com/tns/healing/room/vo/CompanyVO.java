package com.tns.healing.room.vo;

import org.springframework.web.multipart.MultipartFile;

public class CompanyVO {
	private int COMPANY_NUM;
	private String COMPANY_NAME;
	private String MEMBER_ID;
	private String COMPANY_POSTCODE;
	private String COMPANY_ADDRESS;
	private String COMPANY_DETAILADDRESS;
	private MultipartFile COMPANY_IMAGE;
	private String COMPANY_IMAGENAME;

	private int COMPANY_APPROVE;
	
	@Override
	public String toString() {
		return "CompanyVO [COMPANY_NUM=" + COMPANY_NUM + ", COMPANY_NAME=" + COMPANY_NAME + ", MEMBER_ID=" + MEMBER_ID
				+ ", COMPANY_POSTCODE=" + COMPANY_POSTCODE + ", COMPANY_ADDRESS=" + COMPANY_ADDRESS
				+ ", COMPANY_DETAILADDRESS=" + COMPANY_DETAILADDRESS + ", COMPANY_IMAGE=" + COMPANY_IMAGE
				+ ", COMPANY_IMAGENAME=" + COMPANY_IMAGENAME + ", COMPANY_APPROVE=" + COMPANY_APPROVE + "]";
	}

	public MultipartFile getCOMPANY_IMAGE() {
		return COMPANY_IMAGE;
	}

	public void setCOMPANY_IMAGE(MultipartFile cOMPANY_IMAGE) {
		COMPANY_IMAGE = cOMPANY_IMAGE;
	}

	public int getCOMPANY_NUM() {
		return COMPANY_NUM;
	}

	public void setCOMPANY_NUM(int cOMPANY_NUM) {
		COMPANY_NUM = cOMPANY_NUM;
	}

	public String getCOMPANY_NAME() {
		return COMPANY_NAME;
	}

	public void setCOMPANY_NAME(String cOMPANY_NAME) {
		COMPANY_NAME = cOMPANY_NAME;
	}

	public String getMEMBER_ID() {
		return MEMBER_ID;
	}

	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}

	public String getCOMPANY_POSTCODE() {
		return COMPANY_POSTCODE;
	}

	public void setCOMPANY_POSTCODE(String cOMPANY_POSTCODE) {
		COMPANY_POSTCODE = cOMPANY_POSTCODE;
	}

	public String getCOMPANY_ADDRESS() {
		return COMPANY_ADDRESS;
	}

	public void setCOMPANY_ADDRESS(String cOMPANY_ADDRESS) {
		COMPANY_ADDRESS = cOMPANY_ADDRESS;
	}

	public String getCOMPANY_DETAILADDRESS() {
		return COMPANY_DETAILADDRESS;
	}

	public void setCOMPANY_DETAILADDRESS(String cOMPANY_DETAILADDRESS) {
		COMPANY_DETAILADDRESS = cOMPANY_DETAILADDRESS;
	}

	public String getCOMPANY_IMAGENAME() {
		return COMPANY_IMAGENAME;
	}

	public int getCOMPANY_APPROVE() {
		return COMPANY_APPROVE;
	}

	public void setCOMPANY_APPROVE(int cOMPANY_APPROVE) {
		COMPANY_APPROVE = cOMPANY_APPROVE;
	}

	public void setCOMPANY_IMAGENAME(String cOMPANY_IMAGENAME) {
		COMPANY_IMAGENAME = cOMPANY_IMAGENAME;
	}
	
}