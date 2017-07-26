package com.traveler.dao;

import com.traveler.model.RoleVO;

public interface RoleDAO {

	public int insertRole(RoleVO roleVO) throws Exception;
	
	public int updateRole(RoleVO roleVO) throws Exception;
	
	public int deleteRole(RoleVO roleVO) throws Exception;
}
