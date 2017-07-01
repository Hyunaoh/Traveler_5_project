package com.traveler.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.traveler.dao.MemberDAO;
import com.traveler.model.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	SqlSession sqlSession;
	
	//ȸ�� ���� Insert
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
		System.out.println("멤버 입력 완료");
		model.addAttribute("check", check);
		return "/member/memberInsertPro";
	}
	
	@RequestMapping("/loginForm.go")
	public String loginForm() throws Exception{
		System.out.println("[system] access loginForm! ");
		return "/member/loginForm";
	}
	
	@ResponseBody
	@RequestMapping("/idConfirmAjax.go")
	public boolean idConfirmAjax(@RequestBody MemberVO memberVO)throws Exception{
		System.out.println("[system] access idConfirmAjax! ");
		
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		boolean check=false;
		
		try{
			MemberVO result_memberVO=memberDAO.selectMemberList(memberVO);
			if(result_memberVO.getMember_id() != null ){
				check=false;
			}
		}catch(Exception e){
			check = true;
		}
		
		return check;
	}
}
