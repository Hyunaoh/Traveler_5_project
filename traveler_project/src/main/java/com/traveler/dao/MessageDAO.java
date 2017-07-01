package com.traveler.dao;

import java.util.List;

import com.traveler.model.MessageVO;

public interface MessageDAO {

	// 모든 메세지 select 
	public List<MessageVO> selectAllMessage();
	
	// 받은 메세지 select
	public List<MessageVO> selectByIdMessage(MessageVO vo);
	
	// 메세지 Insert
	public int insertMessage(MessageVO vo) throws Exception;
	
	// 메세지 삭제
	public int deleteMessage(MessageVO vo) throws Exception;
	
}
