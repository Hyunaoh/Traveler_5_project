package com.traveler.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.traveler.dao.MessageDAO;
import com.traveler.model.MessageVO;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

/**
 * 쪽지함 (2017.06.27)
 * @author OHHYUNA
 *
 */

@Controller
@RequestMapping(value="/message")
public class MessageController {
	
	@Autowired
	SqlSession sqlSession;
	
	// 받은 메세지함
	@RequestMapping("/messageGet.go")
	public String messageGet(){
		return "/message/messageGet";
	}
	
	// 보낸 메세지함
	@RequestMapping("/messageSend.go")
	public String messageSend(){
		return "/message/messageSend";
	}
	
	// 메세지 쓰는 함
	@RequestMapping("/messageWrite.go")
	public String messageWrite(){
		return "/message/messageWrite";
	}
	
	// 받은 메세지함 프로세스
	@RequestMapping("/messageGetPro.go")
	public String messageGetPro(Model model, MessageVO mVo){
		MessageDAO mDao = sqlSession.getMapper(MessageDAO.class);
		
		List<MessageVO> mList = mDao.selectByIdMessage(mVo);
		
		model.addAttribute("mList", mList);
		return "/message/messageGet";
	}
	
	// 보낸 메세지함 프로세스
	@RequestMapping("/messageSendPro.go")
	public String messageSendPro(Model model, MessageVO mVo){
		MessageDAO mDao = sqlSession.getMapper(MessageDAO.class);
		
		List<MessageVO> mList = mDao.selectByIdMessage(mVo);
		
		model.addAttribute("mList", mList);
		return "/message/messageSend";
	}
	
	// 메세지 쓰는 함 프로세스
	@RequestMapping(value="/messageWritePro.go", method=RequestMethod.GET)
	public String messageWritePro(Model model, MessageVO mVo) throws Exception{
		MessageDAO mDao = sqlSession.getMapper(MessageDAO.class);
		
		int insertRes = mDao.insertMessage(mVo);
		
		model.addAttribute("insert_res", insertRes);
		
		return "/message/messageWrite";
	}
	
}
