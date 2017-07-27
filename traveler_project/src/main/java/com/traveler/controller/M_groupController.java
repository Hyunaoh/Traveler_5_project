package com.traveler.controller;

import java.security.Principal;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.traveler.dao.M_groupDAO;
import com.traveler.dao.MemberDAO;
import com.traveler.model.M_groupVO;
import com.traveler.model.MemberVO;

@Controller
@RequestMapping("/m_group")
public class M_groupController {

	@Autowired
	SqlSession sqlSession;

	@RequestMapping("/m_groupInsertForm.go")
	public String m_groupInsertForm(M_groupVO m_groupVO, Model model) throws Exception{
		System.out.println("[system] access m_groupInsertForm!");
		
		// 회원 정보 가져오기
		MemberVO memberVO_in = new MemberVO();
		memberVO_in.setMember_id(m_groupVO.getGroup_mem_reserve_id());
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		MemberVO memberVO = memberDAO.selectMyPage(memberVO_in);
		
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("m_groupVO", m_groupVO);
		return "m_group/m_groupInsertForm";
	}
	
	@Transactional
	@RequestMapping("/m_groupInsertPro.go")
	public String m_groupInsertPro(M_groupVO m_groupVO, int count, Model model) throws Exception{
		System.out.println("[system] access m_groupInsertPro!");

		// 예약 인원 추가
		M_groupDAO m_groupDAO = sqlSession.getMapper(M_groupDAO.class);
		StringTokenizer token_mem_id = new StringTokenizer(m_groupVO.getGroup_mem_id(), ",");
		StringTokenizer token_mem_name = new StringTokenizer(m_groupVO.getGroup_mem_name(), ",");
		StringTokenizer token_mem_gender = new StringTokenizer(m_groupVO.getGroup_mem_gender(), ",");
		StringTokenizer token_mem_age = new StringTokenizer(m_groupVO.getGroup_mem_str_age(), ",");
		M_groupVO m_groupVO_result;
		for(int i=0; i < count; i++){
			m_groupVO_result = new M_groupVO();
			m_groupVO_result.setGroup_mem_age(Integer.valueOf(token_mem_age.nextToken()));
			m_groupVO_result.setGroup_mem_gender(token_mem_gender.nextToken());
			m_groupVO_result.setGroup_mem_id(token_mem_id.nextToken());
			m_groupVO_result.setGroup_mem_name(token_mem_name.nextToken());
			m_groupVO_result.setGroup_mem_package_pk(m_groupVO.getGroup_mem_package_pk());
			m_groupVO_result.setGroup_mem_reserve_id(m_groupVO.getGroup_mem_reserve_id());
			boolean check = false;
			if(m_groupDAO.insert(m_groupVO_result) > 0){
				check = true;
			}
			System.out.println(" >> process result["+i+"] : " + check);
		}
		
		model.addAttribute("group_pak_pk", m_groupVO.getGroup_mem_package_pk());
		return "/m_group/m_groupInsertPro";
	}
	
	@RequestMapping("/m_groupListForm.go")
	public String m_groupListForm(M_groupVO m_groupVO, Model model) throws Exception{
		System.out.println("[system] access m_groupListForm!");
		
		M_groupDAO m_groupDAO = sqlSession.getMapper(M_groupDAO.class);
		List<M_groupVO> m_groupList = m_groupDAO.selectAllGroup(m_groupVO);
		
		model.addAttribute("m_groupList", m_groupList);
		return "m_group/m_groupListForm";
	}
	
	@RequestMapping("/m_groupDetailForm.go")
	public String m_groupDetailForm(M_groupVO m_groupVO_in, Model model) throws Exception{
		System.out.println("[system] access m_groupDetailForm!");
		
		M_groupDAO m_groupDAO = sqlSession.getMapper(M_groupDAO.class);
		List<M_groupVO> m_groupList = m_groupDAO.selectDetailInfo(m_groupVO_in);
		
		model.addAttribute("m_groupList", m_groupList);
		return "m_group/m_groupDetailForm";
	}
	
	
	@ResponseBody
	@RequestMapping("/m_groupGetInfoAjax.go")
	public List<M_groupVO> m_groupGetInfoAjax(@RequestBody M_groupVO m_groupVO_in)throws Exception{
		System.out.println("[system] access m_groupGetInfoAjax!");
		
		M_groupDAO m_groupDAO = sqlSession.getMapper(M_groupDAO.class);
		List<M_groupVO> m_groupListAjax = m_groupDAO.selectAll(m_groupVO_in);
		
		return m_groupListAjax;
	}
	
	@RequestMapping("/m_groupDeleteForm.go")
	public String m_groupDeleteForm(M_groupVO m_groupVO_in, Model model) throws Exception{
		System.out.println("[system] access m_groupDeleteForm!");
		
		M_groupDAO m_groupDAO = sqlSession.getMapper(M_groupDAO.class);
		List<M_groupVO> m_groupList = m_groupDAO.selectDetailInfo(m_groupVO_in);
		
		model.addAttribute("m_groupList", m_groupList);
		return "m_group/m_groupDeleteForm";
	}
	
	@RequestMapping("/m_groupDeletePro.go")
	public String m_groupDeletePro(M_groupVO m_groupVO_in, Principal principal) throws Exception{
		System.out.println("[system] access m_groupDeletePro!");
		
		String sessionID = principal.getName();
		m_groupVO_in.setGroup_mem_reserve_id(sessionID);
		boolean check = false;
		M_groupDAO m_groupDAO = sqlSession.getMapper(M_groupDAO.class);
		if(m_groupDAO.delete(m_groupVO_in) > 0){
			check=true;
		}
		System.out.println(" >> process result : " + check);
		
		return "redirect:../group/groupDetailForm.go?group_pak_pk="+m_groupVO_in.getGroup_mem_package_pk();
	}
}
