package com.traveler.dao;

import java.util.List;

import com.traveler.model.GroupNoticeVO;

public interface GroupNoticeDAO {

	public int insert(GroupNoticeVO groupNoticeVO) throws Exception;
	public int update(GroupNoticeVO groupNoticeVO) throws Exception;
	public int delete(GroupNoticeVO groupNoticeVO) throws Exception;
	public List<GroupNoticeVO> selectAll(GroupNoticeVO groupNoticeVO) throws Exception;
}
