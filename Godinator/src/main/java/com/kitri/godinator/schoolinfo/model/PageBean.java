package com.kitri.godinator.schoolinfo.model;

public class PageBean {
	private int cntPerPage = 7;
	private int startRow = 1;
	private int endRow = 1;
	private int totalPage = 1;
	private int totalCnt = 0;
	private int cntPerPageGroup = 5;
	private int startPage;
	private int endPage;
	private int currentPage;
	private boolean isPrev = false;
	private boolean isNext = false;
	private String url;
	private String keyword;
	private String condition;
	
	public PageBean(int currentPage, int totalCnt) {
		super();
		this.totalCnt = totalCnt;
		this.currentPage = currentPage;
		execute();
	}
	public void execute() {
		totalPage = (totalCnt/cntPerPage)+1;
		System.out.println("totalPage " + totalPage);
		endRow = currentPage * cntPerPage;
		System.out.println("endRow " + endRow);
		startRow = endRow - (cntPerPage - 1);
		System.out.println("startRow " + startRow);
		startPage = ((currentPage - 1) / cntPerPageGroup) * cntPerPageGroup + 1;
		System.out.println("startPage " + startPage);
		endPage = startPage + cntPerPageGroup - 1;
		System.out.println("endPage " + endPage);
		if(endPage > totalPage)
			endPage = totalPage;
		if(startPage != 1) 
			isPrev = true;
		if(endPage != totalPage)
			isNext = true;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
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
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getCntPerPageGroup() {
		return cntPerPageGroup;
	}
	public void setCntPerPageGroup(int cntPerPageGroup) {
		this.cntPerPageGroup = cntPerPageGroup;
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
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public boolean isPrev() {
		return isPrev;
	}
	public void setPrev(boolean isPrev) {
		this.isPrev = isPrev;
	}
	public boolean isNext() {
		return isNext;
	}
	public void setNext(boolean isNext) {
		this.isNext = isNext;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
}
