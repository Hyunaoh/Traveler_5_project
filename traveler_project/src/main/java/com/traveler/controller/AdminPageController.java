package com.traveler.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.traveler.dao.AdminPageDao;
import com.traveler.model.MemberVO;

@Controller
@RequestMapping(value ="/admin")
public class AdminPageController {
	
	@Autowired
	private AdminPageDao dao;
	
	/* 추후 메세지와 연동할 때 사용
	 * @Autowired
	private MessageDaoImpl mDao;*/
	
	@Autowired
	public void setDao(AdminPageDao dao){
		this.dao = dao;
	}
	
	@RequestMapping(value = "/adminTest.do")
	public String adminForm(Model model, MemberVO vo) throws SQLException, ClassNotFoundException{
		
		return "admin/adminTest";
		
	}
	

		
}