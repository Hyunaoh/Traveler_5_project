package com.traveler.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.traveler.dao.MemberDAO;
import com.traveler.model.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	SqlSession sqlSession;
	
	//회원 가입 Insert
	@RequestMapping("/memberInsertForm.go")
	public String memberInsertForm(Model model)throws Exception{
		System.out.println("[system] access memberInsertForm! ");
		return "/member/memberInsertForm";
	}
	
	@RequestMapping("/memberInsertPro.go")
	public String memberInsertPro(Model model, MemberVO memberVO)throws Exception{
		System.out.println("[system] access memberInsertPro! ");
		
		boolean check = false;
		
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		if(memberDAO.insertMember(memberVO) > 0){
			check = true;
		}
		System.out.println("등록되었습니다");
		model.addAttribute("check", check);
		return "/member/memberInsertPro";
	}
}
