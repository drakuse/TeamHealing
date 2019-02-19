package com.tns.healing.shopping.vo;

public class PageVO {
	private int page; // 페이지 번호
	private int maxPage; // 최대로 필요한 페이지 갯수
	private int startPage; // 현재 페이지에 보여줄 시작 페이지 번호
	private int endPage; // 현재 페이지에 보여줄 마지막 페이지 번호
	private int listCount; // 전체 글갯수
	private int limit; // 현페이지에 보여줄 글갯수
	private String PRODUCT_CATEGORY;
	private int startRow; // 현재 페이지의 시작글(rownum 기준)
	private int endRow; // 현재 페이지의 마지막글(rownum 기준)
	private String category;
	private String searchText;
	private String MEMBER_ID;
	private int ORDER_DIVISION;

	
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}

	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}

	public int getORDER_DIVISION() {
		return ORDER_DIVISION;
	}

	public void setORDER_DIVISION(int oRDER_DIVISION) {
		ORDER_DIVISION = oRDER_DIVISION;
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

	public String getPRODUCT_CATEGORY() {
		return PRODUCT_CATEGORY;
	}

	public void setPRODUCT_CATEGORY(String pRODUCT_CATEGORY) {
		PRODUCT_CATEGORY = pRODUCT_CATEGORY;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	@Override
	public String toString() {
		return "PageVO [page=" + page + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", listCount=" + listCount + ", limit=" + limit + ", PRODUCT_CATEGORY=" + PRODUCT_CATEGORY
				+ ", startRow=" + startRow + ", endRow=" + endRow + ", category=" + category + ", searchText="
				+ searchText + "]";
	}

}
