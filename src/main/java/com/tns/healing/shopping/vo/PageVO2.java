package com.tns.healing.shopping.vo;

public class PageVO2 {
	private int page; //페이지 번호
	private int maxPage; //최대로 필요한 페이지 갯수
	private int startPage; //현재 페이지에 보여줄 시작 페이지 번호
	private int endPage; //현재 페이지에 보여줄 마지막 페이지 번호
	private int listCount; //전체 글갯수
	private int limit; //현페이지에 보여줄 글갯수
	private int PRODUCT_NUM;
	private String MEMBER_ID;
	private int startRow; //현재 페이지의 시작글(rownum 기준)
	private int endRow; //현재 페이지의 마지막글(rownum 기준)
	
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public int getPRODUCT_NUM() {
		return PRODUCT_NUM;
	}
	public void setPRODUCT_NUM(int pRODUCT_NUM) {
		PRODUCT_NUM = pRODUCT_NUM;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	
	
	
	
	
}
