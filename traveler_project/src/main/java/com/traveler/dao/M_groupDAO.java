package com.traveler.dao;

import java.util.List;

import com.traveler.model.M_groupVO;

public interface M_groupDAO {

	public int insert(M_groupVO m_groupVO) throws Exception;

	public int countAll(M_groupVO m_groupVO) throws Exception;

	public List<M_groupVO> selectAll(M_groupVO m_groupVO) throws Exception;
	
	public List<M_groupVO> selectDetailInfo(M_groupVO m_groupVO) throws Exception;
}
