package com.traveler.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/messageListView.go")
	public String messageListView(){
		return "/message/messageListView";
	}
	
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
	
	// 보낸 메세지함 프로세스
	@RequestMapping("/messageSendViewAjax.go")
	public boolean messageSendViewAjax(Model model, MessageVO mVo){
		boolean check = false;
		
		System.out.println("보낸 메세지함 Ajax실행");
	    
	    MessageDAO mDao = sqlSession.getMapper(MessageDAO.class);
	    
		List<MessageVO> mList = mDao.selectByIdMessage(mVo);
		
		return true;
	}
	
	// 메세지 쓰는 함 프로세스
	@RequestMapping(value="/messageWritePro.go", method=RequestMethod.GET)
	public String messageWritePro(Model model, MessageVO mVo) throws Exception{
		MessageDAO mDao = sqlSession.getMapper(MessageDAO.class);
		
		int insertRes = mDao.insertMessage(mVo);
		
		model.addAttribute("insert_res", insertRes);
		
		return "/message/messageWrite";
	}
	
	// 메세지 리스트의 Ajax
	
	@ResponseBody
	@RequestMapping("/messageGetViewAjax.go")
	public boolean messageGetViewAjax(@RequestBody MessageVO mVo, Principal principal){

		boolean check = false;
		
		System.out.println("받은 메세지함 Ajax실행");
	    
	    MessageDAO mDao = sqlSession.getMapper(MessageDAO.class);
	    
		List<MessageVO> mList = mDao.selectByIdMessage(mVo);
		
		return true;
	}
	
}
