package com.traveler.dao;

import java.util.List;

import com.traveler.model.FindVO;

public interface FindDAO {

	// ��ü ��� ������
	public List<FindVO> selectFindListAll() throws Exception;
	
	// 페이징 처리되서 전체 리스트 가져옴
	public List<FindVO> selectFindListAllPaging(FindVO findVO) throws Exception;

	// 페이징 처리되서 전체 리스트 가져옴
	public List<FindVO> selectBadFindListAllPaging(FindVO findVO) throws Exception;

	// ��� Insert
	public int insertFindInfo(FindVO findVO) throws Exception;

	// ��� Update
	public int updateFindInfo(FindVO findVO) throws Exception;

	// ��� Delete
	public int deleteFindInfo(FindVO findVO) throws Exception;

	// Ư���� ���� �ϳ��� ������
	public FindVO selectFindInfo(FindVO findVO_in);
	
	// 전체 게시물 개수 가져옴
	public int countFindList() throws Exception;

	// 전체 나쁜 게시물 개수 가져옴
	public int countBadFindList() throws Exception;

	// 국가별 목록 가져옴
	public List<FindVO> selectCountryFindList(FindVO findVO);

	// 검색 리스트 가져옴
	public List<FindVO> selectSearchFindList(FindVO findVO);
}
