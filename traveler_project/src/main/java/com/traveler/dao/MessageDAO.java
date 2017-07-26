package com.traveler.dao;

import java.util.ArrayList;
import java.util.List;

import com.traveler.model.MessageVO;

public interface MessageDAO {

	// 모든 메세지 select 
	public List<MessageVO> selectAllMessageById(MessageVO vo);

	// 아이디로 메세지 select하여 VO타입으로 받아옴
	public ArrayList<MessageVO> selectOneBySeq(MessageVO vo);
	
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
	
	public int updateReadMessage(MessageVO vo) throws Exception;
	
}
