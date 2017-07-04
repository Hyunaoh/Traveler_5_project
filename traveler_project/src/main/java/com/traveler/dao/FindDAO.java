package com.traveler.dao;

import java.util.List;

import com.traveler.model.FindVO;

public interface FindDAO {

	// 전체 목록 가져옴
	public List<FindVO> selectFindListAll() throws Exception;

	// 紐⑸줉 Insert
	public int insertFindInfo(FindVO findVO) throws Exception;

	// 紐⑸줉 Update
	public int updateFindInfo(FindVO findVO) throws Exception;

	// 紐⑸줉 Delete
	public int deleteFindInfo(FindVO findVO) throws Exception;

	// �듅�젙�븳 �젙蹂� �븯�굹瑜� 媛��졇�샂
	public FindVO selectFindInfo(FindVO findVO_in);
}
