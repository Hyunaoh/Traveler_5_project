package com.traveler.commons;

import com.traveler.model.PagingVO;

public class Commons {

	public Commons(){
		
	}
	
	// 페이징 연산
	public PagingVO processPaging(PagingVO pagingVO_in) throws Exception{
		int COUNT_PER_PAGE = pagingVO_in.getCountBoardPerPage();
		int totalCount = pagingVO_in.getTotalCount(); // 전체게시글의 수
		int totalPageCount; // 전체 페이지 개수
		if(totalCount % COUNT_PER_PAGE == 0){
			totalPageCount = totalCount / COUNT_PER_PAGE;
		} else{
			totalPageCount = (totalCount / COUNT_PER_PAGE) + 1;
		}
		int startBoardNum;
		int endBoardNum;
		if(pagingVO_in.getCurrentPageNum() == 0){
			// 현재 페이값이 없다 == 1페이지 이다.
			startBoardNum = 1;
			endBoardNum = COUNT_PER_PAGE;
		} else{
			startBoardNum = COUNT_PER_PAGE * (pagingVO_in.getCurrentPageNum() - 1) + 1;
			endBoardNum = COUNT_PER_PAGE * pagingVO_in.getCurrentPageNum();
		}

		PagingVO pagingVO_out = new PagingVO();
		pagingVO_out.setCountBoardPerPage(COUNT_PER_PAGE);
		pagingVO_out.setTotalPageCount(totalPageCount);
		pagingVO_out.setStartBoardNum(startBoardNum-1); // mysql에서는 0번부터 시작
		pagingVO_out.setEndBoardNum(endBoardNum);
		pagingVO_out.setCurrentPageNum(pagingVO_in.getCurrentPageNum());
		System.out.println(pagingVO_out.toString());
		return pagingVO_out;
	}
}
