package com.traveler.dao;

import java.util.List;

import com.traveler.model.FindVO;

public interface FindDAO {

	// 전체 목록 가져옴
	public List<FindVO> selectFindListAll() throws Exception;

	// 목록 Insert
	public int insertFindInfo(FindVO findVO) throws Exception;

	// 목록 Update
	public int updateFindInfo(FindVO findVO) throws Exception;

	// 목록 Delete
	public int deleteFindInfo(FindVO findVO) throws Exception;

	// 특정한 정보 하나를 가져옴
	public FindVO selectFindInfo(FindVO findVO_in);
	
	// �쟾泥� 寃뚯떆臾� 媛쒖닔 媛��졇�샂
	public int countFindList() throws Exception;

	// 援�媛�蹂� 紐⑸줉 媛��졇�샂
	public List<FindVO> selectCountryFindList(FindVO findVO);

	// 寃��깋 由ъ뒪�듃 媛��졇�샂
	public List<FindVO> selectSearchFindList(FindVO findVO);
}
