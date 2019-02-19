package com.tns.healing.page.vo;

public class PageVO {
	private int page; // 페이지 번호
	private int maxPage; // 최대로 필요한 페이지 갯수
	private int startPage; // 현재페이지에 보여줄 시작 페이지 번호
	private int endPage; // 현재 페이지에 보여줄 마지막 페이지 번호
	private int listCount;// 전체 글 갯수
	private int limit; // 한 페이지에 보여줄 글 갯수

	private int startRow; // 현재 페이지의 시작 글 (rownum 기준)
	private int endRow; // 현재 페이지의 마지막 글(rownum 기준)
	private String region;
	private String search;

	@Override
	public String toString() {
		return "PageVO [page=" + page + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", listCount=" + listCount + ", limit=" + limit + ", startRow=" + startRow + ", endRow=" + endRow
				+ ", region=" + region + ", search=" + search + "]";
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

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

}
