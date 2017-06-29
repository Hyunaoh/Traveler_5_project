package com.traveler.model;

public class PagingVO {

	private int countBoardPerPage; // 한 페이지 당 게시물 개수
	private int totalCount; // 전체 게시글의 수
	private int totalPageCount; // 전체 페이지 개수
	private int currentPageNum; // 현재 페이지 번호
	private int startBoardNum; // 해당 페이에서의 첫 시작 글
	private int endBoardNum; // 해당 페이에서의 마지막 글
	
	// set get method
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
	public int getCurrentPageNum() {
		return currentPageNum;
	}
	public void setCurrentPageNum(int currentPageNum) {
		this.currentPageNum = currentPageNum;
	}
	public int getStartBoardNum() {
		return startBoardNum;
	}
	public void setStartBoardNum(int startBoardNum) {
		this.startBoardNum = startBoardNum;
	}
	public int getEndBoardNum() {
		return endBoardNum;
	}
	public void setEndBoardNum(int endBoardNum) {
		this.endBoardNum = endBoardNum;
	}
	public int getCountBoardPerPage() {
		return countBoardPerPage;
	}
	public void setCountBoardPerPage(int countBoardPerPage) {
		this.countBoardPerPage = countBoardPerPage;
	}
}
