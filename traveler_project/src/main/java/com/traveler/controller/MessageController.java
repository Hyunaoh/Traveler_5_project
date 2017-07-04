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
	
	// 메세지 쓰는 함 프로세스
	@ResponseBody
	@RequestMapping(value="/messageWriteAjax.go", method=RequestMethod.POST)
	public int messageWritePro(@RequestBody MessageVO mVo, Principal principal) throws Exception{
		
		
		System.out.println("메세지 쓰는 Ajax실행");
		
		MessageDAO mDao = sqlSession.getMapper(MessageDAO.class);
		
		int insertRes = mDao.insertMessage(mVo);
		System.out.println("메세지 insert 여부 : " + insertRes);
		
		return insertRes;
	}
	
	// 메세지 리스트의 Ajax
	@ResponseBody
	@RequestMapping("/messageViewAjax.go")
	public List<MessageVO> messageGetViewAjax(Model model,@RequestBody MessageVO mVo, Principal principal){

		boolean res_check = false;
		
		System.out.println("보낸/받은 메세지함 Ajax실행");
	    
	    MessageDAO mDao = sqlSession.getMapper(MessageDAO.class);
	    
		List<MessageVO> mList = mDao.selectByIdMessage(mVo);
		
		System.out.println(mList);
		
		res_check = true;
		
		return mList;
	}
	
}
