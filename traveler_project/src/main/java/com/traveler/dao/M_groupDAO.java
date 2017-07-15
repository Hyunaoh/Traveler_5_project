package com.traveler.dao;

import com.traveler.model.M_groupVO;

public interface M_groupDAO {

	public int insert(M_groupVO m_groupVO) throws Exception;

	public int countAll(M_groupVO m_groupVO) throws Exception;
}
