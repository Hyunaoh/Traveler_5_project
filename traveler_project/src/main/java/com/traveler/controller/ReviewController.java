package com.traveler.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.traveler.model.MemberVO;

@Controller
@RequestMapping(value ="/review")
public class ReviewController {

	@RequestMapping(value = "/star.go")
	public String adminForm(Model model, MemberVO vo) throws SQLException, ClassNotFoundException{
		
		return "review/star";
	}
}
