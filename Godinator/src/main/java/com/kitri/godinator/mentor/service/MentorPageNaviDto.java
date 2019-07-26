package com.kitri.godinator.mentor.service;

public class MentorPageNaviDto {
	private boolean nowFirst;
	private boolean nowEnd;
	private int totalArticleCount;
	private int totalPageCount;
	private int pageNo;
	private String navigator;
	private int pageSize;
	private int articleSize;

	
	public int getArticleSize() {
		return articleSize;
	}
	public void setArticleSize(int articleSize) {
		this.articleSize = articleSize;
	}
	public boolean isNowFirst() {
		return nowFirst;
	}
	public void setNowFirst(boolean nowFirst) {
		this.nowFirst = nowFirst;
	}
	public boolean isNowEnd() {
		return nowEnd;
	}
	public void setNowEnd(boolean nowEnd) {
		this.nowEnd = nowEnd;
	}
	public int getTotalArticleCount() {
		return totalArticleCount;
	}
	public void setTotalArticleCount(int totalArticleCount) {
		this.totalArticleCount = totalArticleCount;
	}
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public String getNavigator() {
		return navigator;
	}
	public void setNavigator(String navigator) {
		this.navigator = navigator;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	
	public void makeNavigator() {
		StringBuffer tmpNavigator = new StringBuffer();

		int prePage = (pageNo - 1) / pageSize * pageSize;

		tmpNavigator.append("");
		
		if (this.isNowFirst()) {
			tmpNavigator.append("<li><span class='button disabled'>Prev</span></li>");
		} else {
			tmpNavigator.append("<li><a href='#' class='button pageBtn'  data-pg='" + prePage + "'>Prev</a></li>");
		}

		// 시작 페이지 & 마지막 페이지 계산
		int startPage = prePage + 1;
		int endPage = prePage + pageSize;
		if (endPage >= totalPageCount) {
			endPage = totalPageCount;
		}

		for (int i = startPage; i <= endPage; i++) {
			if (pageNo == i) {
				// 현재 페이지일때, 숫자 버튼
				tmpNavigator.append("<li><a class='page active'>" + i + "</a></li>");
			} else {
				// 현재 페이지가 아닐 때, 숫자 버튼
				tmpNavigator.append("<li><a class='page apage'>" + i + "</a></li>");
			}
		}

		if (this.isNowEnd()) {
			tmpNavigator.append("<li><span class='button disabled'>Next</span></li>");
		} else {
			tmpNavigator.append("<li><a href='#' class='button pageBtn' data-pg='" + (endPage + 1) + "'>Next</a></li>");
		}

		this.navigator = tmpNavigator.toString();
	}

}
