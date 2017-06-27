package com.traveler.dao;

import java.util.List;

import com.traveler.model.FindVO;

public interface FindDAO {

	// ��ü ��� ������
	public List<FindVO> selectFindListAll() throws Exception;

	// ��� Insert
	public int insertFindInfo(FindVO findVO) throws Exception;

	// ��� Update
	public int updateFindInfo(FindVO findVO) throws Exception;

	// ��� Delete
	public int deleteFindInfo(FindVO findVO) throws Exception;

	// Ư���� ���� �ϳ��� ������
	public FindVO selectFindInfo(FindVO findVO_in);
}
