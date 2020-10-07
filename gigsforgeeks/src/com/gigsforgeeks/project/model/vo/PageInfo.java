package com.gigsforgeeks.project.model.vo;

public class PageInfo {
	private int listCount;		// 총 게시글 갯수
	private int currentPage;	// 현재 페이지
	private int pageLimit;		// 페이지 최대갯수
	private int boardLimit;		// 최대갯수
	
	private int maxPage;		// 가장 마지막 페이지
	private int startPage;		// 페이징 바의 시작 수
	private int endPage;		// 페이징 바의 끝 수
	
	private int notReadCount;		// 읽지않은 메세지 갯수
	private int keepCount;			// 보관 메세지 갯수
	private int adminCount;			// 고객지원 메세지 갯수
	private int fullCount;			// 전체 메세지 갯수
	public PageInfo() {
		
	}
	
	public PageInfo(int listCount, int currentPage, int pageLimit, int boardLimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}
	
	public PageInfo(int listCount, int currentPage, int pageLimit, int boardLimit, int maxPage, int startPage,
			int endPage, int notReadCount,int adminCount, int fullCount) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.notReadCount = notReadCount;
		this.adminCount = adminCount;
		this.fullCount = fullCount;
	}

	public PageInfo(int keepCount, int adminCount, int fullCount) {
		super();
		this.keepCount = keepCount;
		this.adminCount = adminCount;
		this.fullCount = fullCount;
	}
	
	public PageInfo(int notReadCount, int keepCount, int adminCount, int fullCount) {
		super();
		this.notReadCount = notReadCount;
		this.keepCount = keepCount;
		this.adminCount = adminCount;
		this.fullCount = fullCount;
	}

	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageLimit() {
		return pageLimit;
	}
	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}
	public int getBoardLimit() {
		return boardLimit;
	}
	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
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
	public int getNotReadCount() {
		return notReadCount;
	}
	public void setNotReadCount(int notReadCount) {
		this.notReadCount = notReadCount;
	}
	public int getKeepCount() {
		return keepCount;
	}

	public void setKeepCount(int keepCount) {
		this.keepCount = keepCount;
	}
	public int getAdminCount() {
		return adminCount;
	}

	public void setAdminCount(int adminCount) {
		this.adminCount = adminCount;
	}
	public int getFullCount() {
		return fullCount;
	}

	public void setFullCount(int fullCount) {
		this.fullCount = fullCount;
	}

	@Override
	public String toString() {
		return "PageInfo [listCount=" + listCount + ", currentPage=" + currentPage + ", pageLimit=" + pageLimit
				+ ", boardLimit=" + boardLimit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + ", notReadCount=" + notReadCount + ", keepCount=" + keepCount + ", adminCount=" + adminCount + ", fullCount=" + fullCount +"]";
	}
	
}
