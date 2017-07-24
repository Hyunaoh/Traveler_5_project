package com.traveler.dao;

import java.util.List;

import com.traveler.model.ReviewVO;

public interface ReviewDAO {
	//리뷰 목록 출력
	public List<ReviewVO> getReviewList(int package_pk) throws Exception;
	
	//리뷰 입력
	public int insertReview(ReviewVO reviewVO)throws Exception;
	
	//리뷰 삭제
	public int deleteReview(int review_pk) throws Exception;
	
	//리뷰 업데이트(update_check를 1로 변경)
	public int updateReady(int review_pk) throws Exception;
	
	//리뷰 수정부분 페이지 이동시 다시 원복위해서 먼저 셀렉트( update_check 1인부분을 0으로 수정)
	public int checkReview(String user) throws Exception;
	
	//리뷰 업데이트 후 페이지 이동시 다시 원복( update_check 1인부분을 0으로 수정)
	public int reviewUpdateInit(String user) throws Exception;
	
	//리뷰 수정 완료
	public int updateReview(ReviewVO reviewVO)throws Exception;
	
	//리뷰가 있는지 확인(nullpoint exception 방지)
	public int checkCountReview(int package_pk)throws Exception;
	
	//리뷰가 있다면 avg구하기
	public double getAvgScore(int package_pk)throws Exception;
}
