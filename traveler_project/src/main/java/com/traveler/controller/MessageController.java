package com.traveler.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.glass.ui.Application;
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
	
	// 메세지 3초마다 보는 폼
	@RequestMapping("/alarm_conn.go")
	public String alarm_conn(){
		return "/message/alarm_conn";
	}
	
	// 메세지 접속 폼 (+ id List로 뽑아내기)
	@RequestMapping("/alarm_access.go")
	public String alarm_access(Principal principal) {	
		
		return "/message/alarm_access";
	}
	
	// 메세지 alert 창 
	@RequestMapping("/alarm_view.go")
	public String alarm_view(Model model, HttpServletRequest request){
		
		String msg = request.getParameter("msg");
		
		System.out.println("alert에 띄울 메세지 내용 : " + msg);
		// alert 창이 뜨기전, 그 안에 msg에 해당하는 객체를 model에 add해준다.
		
		model.addAttribute("msg", msg);
		return "/message/alarm_view";
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

	@ResponseBody
	@RequestMapping("/messageGetDeleteAjax.go")
	public int deleteGetMessage(Model model, @RequestBody MessageVO mVo, Principal principal) throws Exception{
		
		System.out.println("== 받은 메세지 삭제 Ajax실행 ==");
	    
	    MessageDAO mDao = sqlSession.getMapper(MessageDAO.class);
	    
		int res = mDao.deleteGetMessage(mVo);
		
		return res;
	}
	
	@ResponseBody
	@RequestMapping("/messageSendDeleteAjax.go")
	public int deleteSendMessage(Model model,@RequestBody MessageVO mVo, Principal principal) throws Exception{
		
		System.out.println("== 보낸 메세지 삭제 Ajax실행 ==");
	    
	    MessageDAO mDao = sqlSession.getMapper(MessageDAO.class);
	    
	    System.out.println("시퀀스 넘버 : " + mVo.getMessage_seq());
	    
		int res = mDao.deleteSendMessage(mVo);
		
		System.out.println("삭제여부 : " + res);
		
		return res;
	}
}
