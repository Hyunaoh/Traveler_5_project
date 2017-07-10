package com.traveler.dao;

import java.util.List;

import com.traveler.model.PlanVO;

public interface PlanDAO {

	// 모든 리스트
	public List<PlanVO> getListAll(PlanVO planVO) throws Exception;

	// 특정한 정보
	public PlanVO getDetailInfo(PlanVO planVO) throws Exception;
	
	// 삽입
	public int insertList(PlanVO planVO) throws Exception;
	
	// 수정
	public int updateList(PlanVO planVO) throws Exception;

	// 삭제
	public int deleteList(PlanVO planVO) throws Exception;

}
