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
	
	// 받은메세지 삭제
	public int deleteGetMessage(MessageVO vo) throws Exception;

	// 보낸메세지 삭제
	public int deleteSendMessage(MessageVO vo) throws Exception;
	
	// 받은 메세지 / 보낸메시지 개수 세기
	public int countMessage(MessageVO vo) throws Exception;
	
}
