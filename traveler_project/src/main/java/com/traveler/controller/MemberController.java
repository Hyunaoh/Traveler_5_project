package com.traveler.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.traveler.dao.MemberDAO;
import com.traveler.model.GoogleVO;
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
	
	@RequestMapping("/googleLoginForm.go")
	public String googleLoginForm(GoogleVO googleVO, Model model) throws Exception{
		System.out.println("[system] access googleLoginForm!");
		
		String client_id, client_secret, redirect_uri, grant_type;
		client_id = "341469578879-3gtopv1fjej2s0vhvh4k8igk8igmckgs.apps.googleusercontent.com";
		client_secret = "gOmSnDVjEUY_FA8haX4GPkH7";
		redirect_uri = "http://localhost:8080/member/googleLoginForm.go";
		grant_type = "authorization_code";
		
		googleVO.setClient_id(client_id);
		googleVO.setClient_secret(client_secret);
		googleVO.setRedirect_uri(redirect_uri);
		googleVO.setGrant_type(grant_type);
		
		System.out.println(googleVO.toString());
		model.addAttribute("googleVO", googleVO);
		return "/member/googleLoginForm";
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
