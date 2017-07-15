package com.traveler.dao;

import java.util.List;

import com.traveler.model.GroupVO;

public interface GroupDAO {

	// 전체 리스트
	public List<GroupVO> selectAll(GroupVO groupVO) throws Exception;
	
	// 특정한 정보
	public GroupVO selectInfo(GroupVO groupVO) throws Exception;
	
	// insert
	public int insertGroup(GroupVO groupVO) throws Exception;
	
	// update
	public int updateGroup(GroupVO groupVO) throws Exception;
	
	// delete
	public int deleteGroup(GroupVO groupVO) throws Exception;
}
